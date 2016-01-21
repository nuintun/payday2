if not _G.FastNet then
  _G.FastNet = {}
  FastNet.loaded_options = {}
  FastNet.mod_path = ModPath
  FastNet.save_path = SavePath
  FastNet.fastnetmenu = "fast_play_online"
end

FastNet.dofiles = {}

FastNet.hook_files = {
  ["lib/managers/menumanager"] = "FastNetLua/MenuManager.lua",
  ["lib/managers/menu/menunodegui"] = "FastNetLua/MenuNodeGui.lua",
  ["lib/managers/menu/renderers/menunodetablegui"] = "FastNetLua/MenuNodeTableGui.lua",
  --["lib/network/base/networkpeer"] = "FastNetLua/NetworkPeer.lua"
}

if not FastNet.setup then
  for p, d in pairs(FastNet.dofiles) do
    dofile(ModPath .. d)
  end

  FastNet.setup = true
end

if RequiredScript then
  local requiredScript = RequiredScript:lower()

  if FastNet.hook_files[requiredScript] then
    dofile(ModPath .. FastNet.hook_files[requiredScript])
  end
end

if Hooks then
  Hooks:Add("LocalizationManagerPostInit", "FastNet_Localization", function(loc)
    LocalizationManager:add_localized_strings({
      ["fast_net_title"] = "Fast.Net",
      ["fast_net_friends_title"] = "Fast.Net好友游戏",
      ["menu_heist_filter"] = "合约过滤",
      ["menu_heist_filter_help"] = "根据合约过滤服务器。",
      ["menu_lobby_days_title"] = "合约天数:",
      ["menu_state_filter"] = "大厅状态",
      ["menu_state_lobby"] = "大厅中",
      ["menu_state_loading"] = "加载中",
      ["menu_state_ingame"] = "游戏中",
      ["menu_state_filter_help"] = "根据大厅状态过滤服务器。",
      ["menu_servers_filter"] = "服务器最大显示数目",
      ["menu_servers_filter_help"] = "设置服务器最大显示数目。",
    })
  end)

  Hooks:Add("MenuManagerSetupCustomMenus", "FastNetSetupMenu", function(menu_manager, nodes)
    MenuHelper:NewMenu(FastNet.fastnetmenu)
  end)

  Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildFastNetMenu", function(menu_manager, nodes)
    local arugements = {
      --type = "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Object, mscorlib]], mscorlib",
      _meta = "node",
      [1] = {
        type = "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Object, mscorlib]], mscorlib",
        _meta = "legend",
        name = "menu_legend_update",
        pc = true
      },
      --align_line = 0.5,
      back_callback = "stop_multiplayer",
      gui_class = "MenuNodeTableGui",
      legend = {
        type = "System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Object, mscorlib]], mscorlib",
        _meta = "legend",
        name = "menu_legend_update",
        pc = true
      },
      menu_components = "",
      modifier = "MenuSTEAMHostBrowser",
      name = FastNet.fastnetmenu,
      refresh = "MenuSTEAMHostBrowser",
      stencil_align = "right",
      stencil_image = "bg_creategame",
      topic_id = "menu_play_online",
      type = "MenuNodeServerList",
      update = "MenuSTEAMHostBrowser"
      --scene_state = "options"
    }

    local node_class
    local type = "MenuNodeServerList"

    if type then
      node_class = CoreSerialize.string_to_classtable(type)
    end

    nodes[FastNet.fastnetmenu] = node_class:new(arugements)

    local callback_handler = CoreSerialize.string_to_classtable("MenuCallbackHandler")

    nodes[FastNet.fastnetmenu]:set_callback_handler(callback_handler:new())

    local parent_menu
    local menu_position

    if nodes.main then
      parent_menu = nodes.main
    end

    if parent_menu then
      for k, v in pairs(parent_menu._items) do
        --if "crimenet" == v["_parameters"]["name"] then
        if "crimenet_offline" == v["_parameters"]["name"] then
          menu_position = k + 1
          break
        end
      end

      local data = {
        type = "CoreMenuItem.Item",
      }
      local params = {
        name = "fast_net_friends",
        text_id = "fast_net_friends_title",
        --help_id = "fast_net_help",
        callback = "find_online_games_with_friends",
        next_node = FastNet.fastnetmenu,
      }
      local new_item = parent_menu:create_item(data, params)

      parent_menu:add_item(new_item)

      local element = table.remove(parent_menu._items, table.maxn(parent_menu._items))

      table.insert(parent_menu._items, menu_position, element)

      local data = {
        type = "CoreMenuItem.Item",
      }
      local params = {
        name = "fast_net",
        text_id = "fast_net_title",
        --help_id = "fast_net_help",
        callback = "find_online_games",
        next_node = FastNet.fastnetmenu,
      }
      local new_item = parent_menu:create_item(data, params)

      parent_menu:add_item(new_item)

      local element = table.remove(parent_menu._items, table.maxn(parent_menu._items))

      table.insert(parent_menu._items, menu_position, element)
    end
  end)
end
