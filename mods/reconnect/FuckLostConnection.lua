_G.Reconnect = _G.Reconnect or {}
Reconnect._data_path = SavePath .. "Reconnect.txt"
Reconnect.options = {}

local C = LuaModManager.Constants

LuaModManager.Constants._keybinds_menu_id = "base_keybinds_menu"

local keybinds_menu_id = C._keybinds_menu_id

function Reconnect:Save()
  local file = io.open(self._data_path, "w+")

  if file then
    file:write(json.encode(self.options))
    file:close()
  end
end

function Reconnect:Load()
  local file = io.open(self._data_path, "r")

  if file then
    self.options = json.decode(file:read("*all"))

    file:close()
  end
end

Reconnect:Load()

Hooks:Add("MenuManager_Base_SetupModOptionsMenu", "ReconnectOptions", function(menu_manager, nodes)
  MenuHelper:NewMenu(keybinds_menu_id)
end)

Hooks:Add("MenuManager_Base_PopulateModOptionsMenu", "ReconnectOptions", function(menu_manager, nodes)
  local key = LuaModManager:GetPlayerKeybind("Reconnect_key") or "f1"

  MenuHelper:AddKeybinding({
    id = "Reconnect_key",
    title = "断线重连",
    connection_name = "Reconnect_key",
    button = key,
    binding = key,
    menu_id = keybinds_menu_id,
    localized = true
  })
end)

if RequiredScript == "lib/managers/crimenetmanager" then
  Hooks:PostHook(CrimeNetGui, "init", "reinit", function(self, ws, fullscreeen_ws, node)
    local key = LuaModManager:GetPlayerKeybind("Reconnect_key") or "f1"
    local reconnect_button = self._panel:text({
      name = "reconnect_button",
      text = string.upper("[" .. key .. "]" .. " 断线重连"),
      font_size = tweak_data.menu.pd2_small_font_size,
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.screen_colors.button_stage_3,
      layer = 40,
      blend_mode = "add"
    })

    self:make_fine_text(reconnect_button)
    reconnect_button:set_right(self._panel:w() - 10)
    reconnect_button:set_top(40)
    self._fullscreen_ws:connect_keyboard(Input:keyboard())
    self._fullscreen_panel:key_press(callback(self, self, "key_press"))
  end)

  function CrimeNetGui:key_press(o, k)
    local key = LuaModManager:GetPlayerKeybind("Reconnect_key") or "f1"

    if k == Idstring(key) and self._panel:child("reconnect_button") then
      Reconnect:Load()

      if Reconnect.options.room_id then
        managers.network.matchmake:join_server(Reconnect.options.room_id)
      else
        QuickMenu:new("错误！", "未找到可以连接的服务器。", {}):show()
      end
    end
  end

  Hooks:PostHook(CrimeNetGui, "mouse_moved", "mouse_move", function(self, o, x, y)
    if self._panel:child("reconnect_button") then
      if self._panel:child("reconnect_button"):inside(x, y) then
        if not self._reconnect_highlighted then
          self._reconnect_highlighted = true

          self._panel:child("reconnect_button"):set_color(tweak_data.screen_colors.button_stage_2)
          managers.menu_component:post_event("highlight")
        end
      elseif self._reconnect_highlighted then
        self._reconnect_highlighted = false

        self._panel:child("reconnect_button"):set_color(tweak_data.screen_colors.button_stage_3)
      end
    end
  end)

  Hooks:PostHook(CrimeNetGui, "mouse_pressed", "mouse_presse", function(self, o, button, x, y)
    if self._panel:child("reconnect_button") and self._panel:child("reconnect_button"):inside(x, y) then
      Reconnect:Load()

      if Reconnect.options.room_id then
        managers.network.matchmake:join_server(Reconnect.options.room_id)
      else
        QuickMenu:new("错误！", "未找到可以连接的服务器。", {}):show()
      end
      return
    end
  end)
end

if RequiredScript == "lib/network/matchmaking/networkmatchmakingsteam" then
  function NetworkMatchMakingSTEAM:join_server_with_check(room_id, is_invite)
    managers.menu:show_joining_lobby_dialog()

    local lobby = Steam:lobby(room_id)
    local empty = function() end

    local function f()
      print("NetworkMatchMakingSTEAM:join_server_with_check f")
      lobby:setup_callback(empty)

      local attributes = self:_lobby_to_numbers(lobby)

      if NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY then
        local ikey = lobby:key_value(NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY)

        if ikey == "value_missing" or ikey == "value_pending" then
          print("Wrong version!!")
          managers.system_menu:close("join_server")
          managers.menu:show_failed_joining_dialog()

          return
        end
      end

      print(inspect(attributes))

      local server_ok, ok_error = self:is_server_ok(nil, room_id, attributes, is_invite)

      if server_ok then
        self:join_server(room_id, true)

        Reconnect.options.room_id = room_id

        Reconnect:Save()
        log("Saving(Room ID = " .. Reconnect.options.room_id .. ")")
      else
        managers.system_menu:close("join_server")

        if ok_error == 1 then
          managers.menu:show_game_started_dialog()
        elseif ok_error == 2 then
          managers.menu:show_game_permission_changed_dialog()
        elseif ok_error == 3 then
          managers.menu:show_too_low_level()
        elseif ok_error == 4 then
          managers.menu:show_does_not_own_heist()
        end
        self:search_lobby(self:search_friends_only())
      end
    end

    lobby:setup_callback(f)

    if lobby:key_value("state") == "value_pending" then
      print("NetworkMatchMakingSTEAM:join_server_with_check value_pending")
      lobby:request_data()
    else
      f()
    end
  end
end
