--- 注册HUD初始化回调
Hooks:PostHook(HUDTeammate, "init", "killcounter_hudteammate_init", function(self)
  local kill_counter_panel_name = "kill_counter_panel"
  local main_player = self._id == HUDManager.PLAYER_PANEL
  local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
  local cable_ties_panel = self._player_panel:child("cable_ties_panel")
  local grenades_panel = self._player_panel:child("grenades_panel")

  if main_player then
    if self._panel:child(kill_counter_panel_name) then
      self._panel:remove(self._panel:child(kill_counter_panel_name))
    end

    local name = self._panel:child("name")
    local player = self._panel:child("player")
    local equipment = deployable_equipment_panel:child("equipment")
    local cable_ties = cable_ties_panel:child("cable_ties")
    local grenades = grenades_panel:child("grenades")

    equipment:set_x(equipment:x() + 4)
    cable_ties:set_x(cable_ties:x() + 4)
    grenades:set_x(grenades:x() + 4)

    self._kill_counter_panel = self._panel:panel({
      name = kill_counter_panel_name,
      visible = true,
      w = 64,
      h = name:h(),
      x = 0,
      halign = "right"
    })

    self._kill_counter_panel:set_rightbottom(player:right(), name:bottom())

    local kw = self._kill_counter_panel:w()
    local kh = self._kill_counter_panel:h()

    self._kill_icon = self._kill_counter_panel:bitmap({
      layer = 1,
      name = "kill_icon",
      texture = "guis/textures/pd2/risklevel_blackscreen",
      w = 15,
      h = 15,
      x = -1,
      y = (kh - 15) / 2,
      color = Color(KillCounter.icon_color),
      blend_mode = KillCounter.blend_mode
    })

    self._kill_text = self._kill_counter_panel:text({
      layer = 1,
      name = "kill_text",
      text = "0/0-0",
      w = kw - 16,
      h = kh,
      align = "right",
      vertical = "center",
      font_size = 13,
      font = "fonts/font_small_mf",
      color = Color(KillCounter.text_color),
      blend_mode = KillCounter.blend_mode
    })

    self._kill_text:set_right(kw - 2)

    self._kill_counter_bg = self._kill_counter_panel:bitmap({
      layer = 0,
      name = "kill_counter_bg",
      texture = "guis/textures/pd2/hud_tabs",
      texture_rect = { 84, 0, 44, 32 },
      visible = true,
      color = Color.white / 3,
      x = 0,
      y = 0,
      w = kw,
      h = kh
    })
  else
    local equipment_amount = deployable_equipment_panel:child("amount")
    local cable_ties_amount = cable_ties_panel:child("amount")
    local grenades_amount = grenades_panel:child("amount")

    equipment_amount:set_vertical("top")
    cable_ties_amount:set_vertical("top")
    grenades_amount:set_vertical("top")
  end
end)

--- 注册设置名字回调，防止名字过长和击杀统计叠屏
Hooks:PostHook(HUDTeammate, "set_name", "killcounter_hudteammate_set_name", function(self)
  local main_player = self._id == HUDManager.PLAYER_PANEL

  if main_player then
    local teammate_panel = self._panel
    local name = teammate_panel:child("name")
    local teammate_w = teammate_panel:w()
    local max_w = teammate_w - 72
    local name_w = name:w()

    if name_w > max_w then
      local name_bg = teammate_panel:child("name_bg")

      name:set_w(max_w)
      managers.hud:make_fine_text(name)
      name_bg:set_w(max_w + 4)
    end
  end
end)

--- 击杀统计更新回掉，展示方式：爆头数目/特殊敌人击杀数目-总共击杀数目
-- @param headshots
-- @param specials
-- @param total
function HUDTeammate:update_kill_counter(headshots, specials, total)
  self._kill_text:set_text(headshots .. "/" .. specials .. "-" .. total)
end
