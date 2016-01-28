_G.CompactHUD = _G.CompactHUD or {}

CompactHUD.mod_path = ModPath
CompactHUD._data_path = SavePath .. "CompactHUD.txt"
CompactHUD.options = CompactHUD.options or {}
CompactHUD.options_menu = "CompactHUD_options"
CompactHUD.hook_files = {
  ["lib/managers/hud/hudteammate"] = "hud/hudteammate.lua",
  ["lib/managers/hud/hudtemp"] = "hud/hudtemp.lua",
  ["lib/units/beings/player/playerdamage"] = "lua/playerdamage.lua",
  ["lib/units/equipment/doctor_bag/doctorbagbase"] = "lua/doctorbagbase.lua",
  ["lib/managers/hudmanager"] = "hud/hudmanager.lua",
  ["lib/managers/hudmanagerpd2"] = "hud/hudmanager.lua"
}

function CompactHUD:Save()
  local file = io.open(self._data_path, "w+")

  if file then
    file:write(json.encode(self.options))
    file:close()
  end
end

function CompactHUD:Load()
  local file = io.open(self._data_path, "r")

  if file then
    self.options = json.decode(file:read("*all"))

    file:close()
  end
end

if not CompactHUD.setup then
  CompactHUD.colors = {
    --You can add new ones
    { color = Color(0, 0.4, 1), menu_name = "Blue" },
    { color = Color(0, 1, 0.4), menu_name = "Green" },
    { color = Color(1, 1, 1), menu_name = "White" },
    { color = Color(0, 0, 0), menu_name = "Black" },
    { color = Color(1, 0.5, 0), menu_name = "Orange" },
    { color = Color(1, 0, 0.6), menu_name = "Pink" },
    { color = Color(0.6, 0, 0.6), menu_name = "Purple" },
  }

  for k, v in pairs(CompactHUD.options) do
    if k:match("color") and type(v) == "number" and v > #CompactHUD.colors then
      CompactHUD.options[k] = #CompactHUD.colors
    end
  end

  CompactHUD:Load()

  if CompactHUD.options.armor_color == nil then
    CompactHUD.options.armor_color = 1
    CompactHUD:Save()
  end

  if CompactHUD.options.bg_alpha == nil then
    CompactHUD.options.bg_alpha = 0.4
    CompactHUD:Save()
  end

  if CompactHUD.options.downed_counter == nil then
    CompactHUD.options.downed_counter = true
    CompactHUD:Save()
  end

  if CompactHUD.options.fireselector == nil then
    CompactHUD.options.fireselector = true
    CompactHUD:Save()
  end

  if CompactHUD.options.tm_nades == nil then
    CompactHUD.options.tm_nades = false
    CompactHUD:Save()
  end

  if CompactHUD.options.true_ammototal == nil then
    CompactHUD.options.true_ammototal = false
    CompactHUD:Save()
  end

  if CompactHUD.options.tm_cableties == nil then
    CompactHUD.options.tm_cableties = true
    CompactHUD:Save()
  end

  if CompactHUD.options.bg_color == nil then
    CompactHUD.options.bg_color = 4
    CompactHUD:Save()
  end

  CompactHUD.armor_color = CompactHUD.colors[CompactHUD.options.armor_color].color
  CompactHUD.bg_alpha = CompactHUD.options.bg_alpha
  CompactHUD.bg_color = CompactHUD.colors[CompactHUD.options.bg_color].color
  CompactHUD.fireselector = CompactHUD.options.fireselector
  CompactHUD.downed_counter = CompactHUD.options.downed_counter
  CompactHUD.tm_cableties = CompactHUD.options.tm_cableties
  CompactHUD.tm_nades = CompactHUD.options.tm_nades
  CompactHUD:Load()
  CompactHUD.setup = true
end

function CompactHUD:UpdateGame()
  CompactHUD.armor_color = CompactHUD.colors[CompactHUD.options.armor_color].color
  CompactHUD.bg_color = CompactHUD.colors[CompactHUD.options.bg_color].color
  CompactHUD.bg_alpha = CompactHUD.options.bg_alpha
  CompactHUD.fireselector = CompactHUD.options.fireselector
  CompactHUD.downed_counter = CompactHUD.options.downed_counter

  if managers.hud then
    managers.hud._teammate_panels[managers.hud.PLAYER_PANEL]:UpdateSettings()
  end
end

local CompactHUD_Colors = {}

Hooks:Add("LocalizationManagerPostInit", "CompactHUD_loc", function()
  LocalizationManager:add_localized_strings({
    ["CompactHUD_options_title"] = "CompactHud设置",
    ["CompactHUD_options_desc"] = "自定义CompactHud",
    ["armor_color_title"] = "弹药数目下分割线颜色",
    ["armor_color_desc"] = "设置弹药数目下面分割线的颜色",
    ["bg_alpha_title"] = "背景透明度",
    ["bg_alpha_desc"] = "设置HUD的背景透明度",
    ["bg_color_title"] = "背景颜色",
    ["bg_color_desc"] = "设置HUD的背景颜色",
    ["downed_counter_enable_title"] = "倒地数目",
    ["downed_counter_enable_desc"] = "在心脏图标中显示你的剩余倒地次数",
    ["fireselector_enable_title"] = "射击模式选择",
    ["fireselector_enable_desc"] = "启用射击模式选择",
    ["show_tm_nades_title"] = "显示队友投掷物数量",
    ["show_tm_nades_desc"] = "If enabled this will add an icon near teammates name showing amount of throwables they have",
    ["show_tm_cableties_title"] = "显示队友扎带数量",
    ["show_tm_cableties_desc"] = "If enabled this will add an icon near teammates name showing amount of cable ties they have",
    ["true_ammototal_title"] = "true ammo total",
    ["true_ammototal_desc"] = "Changes the total ammo to show only total ammo and not total + clip ammo(Warning : doesn't work with saw) ",
  })

  for k, v in pairs(CompactHUD.colors) do
    LocalizationManager:add_localized_strings({
      ["CompactHUDcolor" .. k] = v.menu_name,
    })
    table.insert(CompactHUD_Colors, "CompactHUDcolor" .. k)
  end
end)

Hooks:Add("MenuManagerSetupCustomMenus", "MenuManagerSetupCustomMenusCompactHUD", function(menu_manager, nodes)
  MenuHelper:NewMenu(CompactHUD.options_menu)
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "MenuManagerPopulateCustomMenusCompactHUD", function(menu_manager, nodes)
  MenuCallbackHandler.armor_color = function(self, item)
    CompactHUD.options.armor_color = item:value()
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.bg_alpha = function(self, item)
    CompactHUD.options.bg_alpha = item:value()
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.bg_color = function(self, item)
    CompactHUD.options.bg_color = item:value()
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.fireselector_enable = function(self, item)
    CompactHUD.options.fireselector = (item:value() == "on" and true or false)
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.downed_counter_enable = function(self, item)
    CompactHUD.options.downed_counter = (item:value() == "on" and true or false)
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.show_tm_nades = function(self, item)
    CompactHUD.options.tm_nades = (item:value() == "on" and true or false)
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.show_tm_cableties = function(self, item)
    CompactHUD.options.tm_cableties = (item:value() == "on" and true or false)
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuCallbackHandler.true_ammototal = function(self, item)
    CompactHUD.options.true_ammototal = (item:value() == "on" and true or false)
    CompactHUD:Save()
    CompactHUD:UpdateGame()
  end

  MenuHelper:AddMultipleChoice({
    id = "armor_color",
    title = "armor_color_title",
    desc = "armor_color_desc",
    callback = "armor_color",
    items = CompactHUD_Colors,
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.armor_color,
    priority = 999,
  })

  MenuHelper:AddMultipleChoice({
    id = "bg_color",
    title = "bg_color_title",
    desc = "bg_color_desc",
    callback = "bg_color",
    items = CompactHUD_Colors,
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.bg_color,
    priority = 995,
  })

  MenuHelper:AddSlider({
    id = "bg_alpha",
    title = "bg_alpha_title",
    desc = "bg_alpha_desc",
    callback = "bg_alpha",
    value = CompactHUD.options.bg_alpha,
    min = 0,
    max = 1,
    step = 0.5,
    show_value = true,
    menu_id = CompactHUD.options_menu,
    priority = 990
  })

  MenuHelper:AddToggle({
    id = "downed_counter_enable",
    title = "downed_counter_enable_title",
    desc = "downed_counter_enable_desc",
    callback = "downed_counter_enable",
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.downed_counter,
    priority = 985,
  })

  MenuHelper:AddToggle({
    id = "fireselector_enable",
    title = "fireselector_enable_title",
    desc = "fireselector_enable_desc",
    callback = "fireselector_enable",
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.fireselector,
    priority = 980,
  })

  MenuHelper:AddToggle({
    id = "show_tm_nades",
    title = "show_tm_nades_title",
    desc = "show_tm_nades_desc",
    callback = "show_tm_nades",
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.tm_nades,
    priority = 975,
  })

  MenuHelper:AddToggle({
    id = "show_tm_cableties",
    title = "show_tm_cableties_title",
    desc = "show_tm_cableties_desc",
    callback = "show_tm_cableties",
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.tm_cableties,
    priority = 970,
  })

  MenuHelper:AddToggle({
    id = "true_ammototal",
    title = "true_ammototal_title",
    desc = "true_ammototal_desc",
    callback = "true_ammototal",
    menu_id = CompactHUD.options_menu,
    value = CompactHUD.options.true_ammototal,
    priority = 965,
  })
end)

Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusCompactHUD", function(menu_manager, nodes)
  nodes[CompactHUD.options_menu] = MenuHelper:BuildMenu(CompactHUD.options_menu)
  MenuHelper:AddMenuItem(MenuHelper.menus.lua_mod_options_menu, CompactHUD.options_menu, "CompactHUD_options_title", "CompactHUD_options_desc", 1)
end)

if RequiredScript then
  local requiredScript = RequiredScript:lower()

  if CompactHUD.hook_files[requiredScript] then
    dofile(ModPath .. CompactHUD.hook_files[requiredScript])
  end
end
