if not _G.NPCWeap then
  _G.NPCWeap = {}
  NPCWeap.loaded_options = NPCWeap.loaded_options or {}
  NPCWeap.mod_path = ModPath
  NPCWeap.save_path = SavePath
  NPCWeap.menu_name = "NPCWeap_menu"
  NPCWeap.write_options = NPCWeap.write_options or {}
  NPCWeap.loaded_options = NPCWeap.loaded_options or {}
  NPCWeap.weapons = NPCWeap.weapons or {}
  NPCWeap.incompat_categories_button = {}
end

NPCWeap.dofiles = {
  "Options.lua"
}

NPCWeap.hook_files = {
  ["lib/units/weapons/npcraycastweaponbase"] = "NPCWeaponBase.lua"
}

if not NPCWeap.setup then
  local files = file.GetFiles(NPCWeap.mod_path .. "Weapons/")
  for p, d in pairs(files) do
    local file_path = NPCWeap.mod_path .. "Weapons/" .. d
    if io.file_is_readable(file_path) then
      dofile(file_path)
    end
  end

  for p, d in pairs(NPCWeap.dofiles) do
    dofile(ModPath .. d)
  end
  NPCWeap:Load_options()
  NPCWeap.setup = true
end

if RequiredScript then
  local requiredScript = RequiredScript:lower()
  if NPCWeap.hook_files[requiredScript] then
    dofile(ModPath .. NPCWeap.hook_files[requiredScript])
  end
end

function NPCWeap:AddMultipleChoice(multi_data)

  local data = {
    type = "MenuItemMultiChoiceWithIcon"
  }
  for k, v in ipairs(multi_data.items or {}) do
    table.insert(data, { _meta = "option", text_id = v, value = k })
  end

  local params = {
    name = multi_data.id,
    text_id = multi_data.title,
    help_id = multi_data.desc,
    callback = multi_data.callback,
    icon = tweak_data.hud_icons:get_icon_data("icon_locked"),
    disabled_color = multi_data.disabled_color or Color(0.25, 1, 1, 1),
    row_item_color = multi_data.row_item_color or nil,
    hightlight_color = multi_data.row_item_color or nil,
    filter = true,
    localize = multi_data.localized,
  }

  local menu = multi_data.node
  local item = menu:create_item(data, params)
  item:set_value(multi_data.value or 1)
  menu:add_item(item)
end

function NPCWeap:setup_weapon(unit, name)
  local current_weap = NPCWeap.weapons[name]

  if current_weap then
    local enabled_objects = {}

    local barrel_offset = current_weap.barrel_fire_offset or Vector3(0, 0, 0)
    local barrel_len = Vector3(0, 0, 0) --offset in relaton to barrel
    local barrel_fg_len = Vector3(0, 0, 0) --offset in relaton to foregrip (only for mp5)
    local barrel_ext_len = Vector3(0, 0, 0) --length of the ns

    if not current_weap.fire_pos then
      current_weap.fire_pos = unit:get_object(Idstring("fire")):position()
    end

    --init objects
    for _, enabled_object in pairs(current_weap.objects_init) do
      local object = unit:get_object(Idstring(enabled_object))

      if object then
        object:set_visibility(true)
      end
    end

    --reset all visibility
    for _, category in pairs(current_weap.categories) do
      for _, currentCategoryWeapon in pairs(current_weap[category]) do
        local object_name_sub = string.sub(currentCategoryWeapon, current_weap.object_sub, string.len(currentCategoryWeapon))
        local object = unit:get_object(Idstring(object_name_sub))

        if object then
          object:set_visibility(false)
        end
      end
    end

    --set visibility for each category
    for _, category in pairs(current_weap.categories) do
      local current_value = NPCWeap.loaded_options[name][category]
      local current_object_value = current_weap[category][current_value]
      local object_name

      if current_object_value ~= "random" then
        object_name = string.sub(current_object_value, current_weap.object_sub, string.len(current_object_value))
      else
        local random_object = NPCWeap:get_random(current_weap, category, name, unit)

        --hope to RNJesus that you roll one of these motherfuckers
        if current_weap.spooci and current_weap.spooci[category] then
          local rngNumber = math.random(1, 10000) / 100.0
          for spoociItemKey, spoociItem in pairs(current_weap.spooci[category]) do
            if rngNumber <= spoociItemKey then
              random_object = spoociItem[math.random(#spoociItem)]
              break
            end
          end
        end

        object_name = string.sub(random_object, current_weap.object_sub, string.len(random_object))
      end

      local selected_object = unit:get_object(Idstring(object_name))

      if selected_object then
        selected_object:set_visibility(true)
        table.insert(enabled_objects, object_name)
      end

      --reset the requested items for the section
      for _, required_reset_item in pairs(current_weap.required_reset[category]) do
        if required_reset_item ~= object_name then
          local object = unit:get_object(Idstring(required_reset_item))
          if object then
            object:set_visibility(false)
          end
        end
      end

      --enable the required objects (if any)
      if current_weap.required[object_name] then
        local required_table = current_weap.required[object_name]
        for _, requiredItems in pairs(required_table) do
          --log(category)
          local object = unit:get_object(Idstring(requiredItems))

          if object then
            object:set_visibility(true)
          end
        end
      end

      --Get offsets
      if category == "barrel" then
        if current_weap[object_name] and current_weap[object_name].barrel_ext then
          barrel_len = current_weap[object_name].barrel_ext
        end
      elseif category == "foregrip" then
        if current_weap[object_name] and current_weap[object_name].barrel_ext then
          barrel_fg_len = current_weap[object_name].barrel_ext
        end
      elseif category == "barrel_ext" then
        if current_weap[object_name] and current_weap[object_name].length then
          barrel_ext_len = current_weap[object_name].length
        end
      end
    end

    --adjust position
    for _, object_name in pairs(enabled_objects) do
      if current_weap[object_name] then
        for current_objectKey, current_object in pairs(current_weap[object_name]) do
          if current_weap[current_objectKey] then
            for _, category_object_name in pairs(current_weap[current_objectKey]) do
              local object_string = string.sub(category_object_name, current_weap.object_sub, string.len(category_object_name))
              local object = unit:get_object(Idstring(object_string))
              if object and object:visibility() == true then
                object:set_local_position(current_object)
                if current_weap.required[object_string] then
                  local required_table = current_weap.required[object_string]
                  for _, requiredItem in pairs(required_table) do
                    local object_req = unit:get_object(Idstring(requiredItem))
                    if object_req then
                      object_req:set_local_position(current_object)
                    end
                  end
                end
              end
            end
          end
          --adjust spooci
          if current_weap.spooci and current_weap.spooci[current_objectKey] then
            for _, spooci_object_list in pairs(current_weap.spooci[current_objectKey]) do
              for _, spooci_object_name in pairs(spooci_object_list) do
                local object_string = string.sub(spooci_object_name, current_weap.object_sub, string.len(spooci_object_name))
                local object = unit:get_object(Idstring(object_string))
                if object and object:visibility() == true then
                  object:set_local_position(current_object)
                  if current_weap.required[object_string] then
                    local required_table = current_weap.required[object_string]
                    for _, requiredItem in pairs(required_table) do
                      local object_req = unit:get_object(Idstring(requiredItem))
                      if object_req then
                        object_req:set_local_position(current_object)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    --Adjust Fire position
    unit:get_object(Idstring("fire")):set_local_position(current_weap.fire_pos + barrel_len + barrel_offset + barrel_fg_len + barrel_ext_len)

    for requiredItemKey, requiredItems in pairs(current_weap.required) do
      for _, reqItem in pairs(requiredItems) do
        local req_object = unit:get_object(Idstring(requiredItemKey))
        if req_object and req_object:visibility() == true then
          local object = unit:get_object(Idstring(reqItem))
          if object then
            object:set_visibility(true)
          end
        end
      end
    end
  end
end

Hooks:Add("LocalizationManagerPostInit", "NPCWeap_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["NPCWeap_button"] = "NPC Weapon Customization",
    ["NPCWeap_button_help"] = "Customize NPC weapons",
    ["barrel_title"] = "Barrel",
    ["body_title"] = "Body",
    ["barrel_ext_title"] = "Barrel Extension",
    ["magazine_title"] = "Magazine",
    ["upper_reciever_title"] = "Upper Reciever",
    ["stock_title"] = "Stock",
    ["sight_title"] = "Scopes",
    ["slide_title"] = "Slide",
    ["foregrip_title"] = "Foregrip",
    ["grip_title"] = "Grip",
    ["attachment_title"] = "Attachment",
    ["vertical_grip_title"] = "Vertical Grip",
    ["lower_receiver_title"] = "Lower Receiver",
    ["drag_handle_title"] = "Drag Handle",
    ["rail_title"] = "Rail"
  })
end)

Hooks:Add("MenuManagerSetupCustomMenus", "Base_SetupNPCWeapMenu", function(menu_manager, nodes)
  MenuHelper:NewMenu(NPCWeap.menu_name)
end)
math.randomseed(os.time())
function NPCWeap:get_random(current_weap, category, weap_name, unit)
  local value = math.random(#current_weap[category] - 1)
  local random_object = current_weap[category][value]

  if current_weap.incompatible[random_object] then
    local incompat_list = current_weap.incompatible[random_object]

    for _, curr_category in pairs(current_weap.categories) do
      for _, incompatibleItem in pairs(incompat_list) do
        local value = NPCWeap.loaded_options[weap_name][curr_category]

        if current_weap[curr_category][value] == incompatibleItem then
          return self:get_random(current_weap, category, weap_name, unit)
        end

        local object = string.sub(incompatibleItem, current_weap.object_sub, string.len(incompatibleItem))

        if unit:get_object(Idstring(object)) and unit:get_object(Idstring(object)):visibility() == true then
          return self:get_random(current_weap, category, weap_name, unit)
        end
      end
    end
  end
  return random_object
end

function NPCWeap:AddToggle(toggle_data, node)

  local data = {
    type = "CoreMenuItemToggle.ItemToggle",
    {
      _meta = "option",
      icon = "guis/textures/menu_tickbox",
      value = "on",
      x = 24,
      y = 0,
      w = 24,
      h = 24,
      s_icon = "guis/textures/menu_tickbox",
      s_x = 24,
      s_y = 24,
      s_w = 24,
      s_h = 24
    },
    {
      _meta = "option",
      icon = "guis/textures/menu_tickbox",
      value = "off",
      x = 0,
      y = 0,
      w = 24,
      h = 24,
      s_icon = "guis/textures/menu_tickbox",
      s_x = 0,
      s_y = 24,
      s_w = 24,
      s_h = 24
    }
  }

  local params = {
    name = toggle_data.id,
    text_id = toggle_data.title,
    help_id = toggle_data.desc,
    callback = toggle_data.callback,
    disabled_color = toggle_data.disabled_color or Color(0.25, 1, 1, 1),
    localize = toggle_data.localized,
  }

  local item = node:create_item(data, params)
  item:set_value(toggle_data.value and "on" or "off")

  if toggle_data.disabled then
    item:set_enabled(not toggle_data.disabled)
  end
  return node:add_item(item)
end

function NPCWeap:update_compatibility_item(node_items, this)
  for nodeKey, nodeItem in pairs(node_items) do
    if nodeItem.item.set_enabled then

      if nodeItem.item._parameters.name and NPCWeap.incompat_categories_button[nodeItem.item._parameters.name] and #NPCWeap.incompat_categories_button[nodeItem.item._parameters.name] > 0 then
        node_items[nodeKey].item._parameters.row_item_color = Color.red:with_alpha(0.5)
      else
        node_items[nodeKey].item._parameters.row_item_color = nil
      end
      nodeItem.item:set_enabled(true)
      this:refresh_node()
    end
  end
end

function NPCWeap:update_compatibility(item, this, current_weap, current_value)
  local node_items = item._parameters.gui_node.row_items
  NPCWeap:update_compatibility_item(node_items, this)
end

Hooks:Add("MenuManagerPopulateCustomMenus", "Base_PopulateNPCWeapMenu", function(menu_manager, nodes)
  MenuCallbackHandler.refresh_weapon = function(this, item)
    local unit = managers.menu_scene._item_unit.unit
    local current_weap = NPCWeap.weapons[NPCWeap.current_weapon]
    local current_value = current_weap[item:name()][item:value()]
    NPCWeap.incompat_categories = NPCWeap.incompat_categories or {}
    local incompatible
    if current_weap.incompatible[current_value] then
      local incompat_list = current_weap.incompatible[current_value]

      for _, category in pairs(current_weap.categories) do
        for _, incompat_list_item in pairs(incompat_list) do
          if table.contains(current_weap[category], incompat_list_item) then

            local value = NPCWeap.loaded_options[NPCWeap.current_weapon][category]

            if current_weap[category][value] == incompat_list_item then
              NPCWeap.incompat_categories[item:name()] = NPCWeap.incompat_categories[item:name()] or {}
              if not table.contains(NPCWeap.incompat_categories[item:name()], category) then
                table.insert(NPCWeap.incompat_categories[item:name()], category)
              end

              --for self
              if NPCWeap.incompat_categories_button[item:name()] then

                if not table.contains(NPCWeap.incompat_categories_button[item:name()], category) then
                  table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                end

              else
                NPCWeap.incompat_categories_button[item:name()] = {}
                table.insert(NPCWeap.incompat_categories_button[item:name()], category)
              end
              --for other
              if NPCWeap.incompat_categories_button[category] then

                if not table.contains(NPCWeap.incompat_categories_button[category], item:name()) then
                  table.insert(NPCWeap.incompat_categories_button[category], item:name())
                end

              else
                NPCWeap.incompat_categories_button[category] = {}
                table.insert(NPCWeap.incompat_categories_button[category], item:name())
              end

              incompatible = true
            end

            local string = string.sub(incompat_list_item, current_weap.object_sub, string.len(incompat_list_item))
            local object_incompat = unit:get_object(Idstring(string))

            if object_incompat then
              if object_incompat:visibility() == true then
                NPCWeap.incompat_categories[item:name()] = NPCWeap.incompat_categories[item:name()] or {}
                if not table.contains(NPCWeap.incompat_categories[item:name()], category) then
                  table.insert(NPCWeap.incompat_categories[item:name()], category)
                end

                --for self
                if NPCWeap.incompat_categories_button[item:name()] then

                  if not table.contains(NPCWeap.incompat_categories_button[item:name()], category) then
                    table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                  end

                else
                  NPCWeap.incompat_categories_button[item:name()] = {}
                  table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                end
                --for other
                if NPCWeap.incompat_categories_button[category] then

                  if not table.contains(NPCWeap.incompat_categories_button[category], item:name()) then
                    table.insert(NPCWeap.incompat_categories_button[category], item:name())
                  end

                else
                  NPCWeap.incompat_categories_button[category] = {}
                  table.insert(NPCWeap.incompat_categories_button[category], item:name())
                end

                incompatible = true
              end
            end
          end
        end
      end
    end
    if incompatible then
      local node_items = item._parameters.gui_node.row_items
      NPCWeap:update_compatibility_item(node_items, this)
      return
    end

    if NPCWeap.incompat_categories_button[item:name()] then

      for incompat_category_Key, incompat_category_Item in pairs(NPCWeap.incompat_categories_button[item:name()]) do

        if NPCWeap.incompat_categories_button[incompat_category_Item] then

          for incompat_sub_category_Key, incompat_sub_category_Item in pairs(NPCWeap.incompat_categories_button[incompat_category_Item]) do
            if incompat_sub_category_Item == item:name() then
              table.remove(NPCWeap.incompat_categories_button[incompat_category_Item], incompat_sub_category_Key)
              break
            end
          end
        end
      end

      NPCWeap.incompat_categories_button[item:name()] = {}
    end
    NPCWeap:update_compatibility(item, this, current_weap, current_value)
    NPCWeap.loaded_options[NPCWeap.current_weapon][item:name()] = item:value()
    NPCWeap:Save()
    for p, d in pairs(current_weap[item:name()]) do
      local string = string.sub(d, current_weap.object_sub, string.len(d))
      local object = unit:get_object(Idstring(string))
      if object then
        object:set_visibility(false)
      end
    end
    NPCWeap:update_category(unit, current_weap, current_value, item:name())
  end

  MenuCallbackHandler.reset_buttons = function(this, item)
    nodes.blackmarket_preview_node:clean_items()
    managers.menu:add_back_button(nodes.blackmarket_preview_node)
    if alive(NPCWeap._title_text) then
      NPCWeap._title_text:set_visible(false)
    end
  end

  MenuCallbackHandler.reset_buttons = function(this, item)
    nodes.blackmarket_preview_node:clean_items()
    managers.menu:add_back_button(nodes.blackmarket_preview_node)
    if alive(NPCWeap._title_text) then
      NPCWeap._title_text:set_visible(false)
    end
  end
  MenuCallbackHandler.npc_weap_toggle_customization = function(this, item)
    NPCWeap.loaded_options[NPCWeap.current_weapon].enabled = item:value() == "on" and true or false
    local node_items = item._parameters.gui_node.row_items
    for nodeKey, nodeItem in pairs(node_items) do
      if nodeItem.item.set_enabled then
        if nodeItem.item._parameters.name ~= nil then
          if nodeItem.item._parameters.name ~= NPCWeap.current_weapon and nodeItem.item._parameters.name ~= item:name() then
            nodeItem.item:set_enabled(NPCWeap.loaded_options[NPCWeap.current_weapon].enabled)
            this:refresh_node()
          end
        end
      end
    end
    NPCWeap:Save()
  end
  MenuCallbackHandler.refresh_weapon_action = function(this, item)
    NPCWeap:setup_weapon(managers.menu_scene._item_unit.unit, item:name())
  end
  MenuCallbackHandler.setup_buttons = function(this, item)
    NPCWeap.current_weapon = item:name()
    for p, d in pairs(NPCWeap.weapons[item:name()].categories) do
      NPCWeap:AddMultipleChoice({
        id = d,
        title = d .. "_title",
        callback = "refresh_weapon",
        node = nodes.blackmarket_preview_node,
        value = NPCWeap.loaded_options[item:name()][d],
        items = NPCWeap.weapons[item:name()][d],
        disabled = NPCWeap.loaded_options[item:name()].enabled,
      })
    end

    local divider_params = {
      name = "divider_" .. item:name(),
      no_text = true,
      size = 8,
    }
    local new_menu_divider = nodes.blackmarket_preview_node:create_item({ type = "MenuItemDivider" }, divider_params)
    nodes.blackmarket_preview_node:add_item(new_menu_divider)
    local params = {
      name = item:name(),
      text_id = "Refresh weapon",
      localize = false,
      callback = "refresh_weapon_action",
      localize_help = false,
      row_item_color = tweak_data.screen_colors.button_stage_3,
    }
    local new_item = nodes.blackmarket_preview_node:create_item({ type = "CoreMenuItem.Item" }, params)
    nodes.blackmarket_preview_node:add_item(new_item)
    local make_fine_text = function(text)
      local x, y, w, h = text:text_rect()
      text:set_size(w, h)
      text:set_position(math.round(text:x()), math.round(text:y()))
    end
    if not NPCWeap._panel and not NPCWeap._title_text then
      NPCWeap._panel = managers.gui_data:create_saferect_workspace():panel()
      NPCWeap._title_text = NPCWeap._panel:text({
        name = "title_text",
        text = "weapon",
        visible = false,
        font_size = tweak_data.menu.pd2_large_font_size,
        font = tweak_data.menu.pd2_large_font,
        color = tweak_data.screen_colors.button_stage_3
      })
    end
    if alive(NPCWeap._title_text) then
      NPCWeap._title_text:set_visible(true)
      NPCWeap._title_text:set_text(string.upper(NPCWeap.weapons[item:name()].display_name))
    end
    managers.menu:open_node("blackmarket_preview_node", { { back_callback = callback(MenuCallbackHandler, MenuCallbackHandler, "reset_buttons") } })
    managers.dyn_resource:load(Idstring("unit"), Idstring(NPCWeap.weapons[item:name()].unit), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)
    managers.menu_scene:_spawn_item(NPCWeap.weapons[item:name()].unit, nil)
    managers.menu_scene._item_yaw = -90
    NPCWeap:setup_weapon(managers.menu_scene._item_unit.unit, item:name())
  end
  for p, d in pairs(NPCWeap.weapons) do
    MenuHelper:AddButton({
      id = d.name_id,
      title = d.display_name,
      localized = "false",
      callback = "setup_buttons",
      menu_id = NPCWeap.menu_name
    })
  end
end)

function NPCWeap:update_category(unit, current_weap, current_value, category)
  local object_name
  if current_value ~= "random" then
    object_name = string.sub(current_value, current_weap.object_sub, string.len(current_value))
  else
    local random_object = NPCWeap:get_random(current_weap, category, NPCWeap.current_weapon, unit)
    object_name = string.sub(random_object, current_weap.object_sub, string.len(random_object))
  end
  if object_name ~= "none" then
    local object = unit:get_object(Idstring(object_name))
    if object then
      object:set_visibility(true)
    end
  end
  if current_weap[object_name] then
    for p, k in pairs(current_weap[object_name]) do
      log(p)
      if current_weap[p] then
        for x, y in pairs(current_weap[p]) do
          local object_string = string.sub(y, current_weap.object_sub, string.len(y))
          local object = unit:get_object(Idstring(object_string))
          if object and object:visibility() == true then
            object:set_local_position(k)
            if current_weap.required[object_string] then
              local required_table = current_weap.required[object_string]
              for p, d in pairs(required_table) do
                local object_req = unit:get_object(Idstring(d))
                if object_req then
                  object_req:set_local_position(k)
                end
              end
            end
          end
        end
      end
    end
  end
  if current_weap.pos_check and current_weap.pos_check[category] then
    for _, pos_category in pairs(current_weap.pos_check[category]) do
      for _, object_wpre in pairs(current_weap[pos_category]) do
        local object_string = string.sub(object_wpre, current_weap.object_sub, string.len(object_wpre))
        local wpre_object = unit:get_object(Idstring(object_string))
        if wpre_object and wpre_object:visibility() == true then
          if current_weap[object_string] then
            for vcategory, vector in pairs(current_weap[object_string]) do
              if vcategory == category then
                local object = unit:get_object(Idstring(object_name))
                if object and object:visibility() == true then
                  object:set_local_position(vector)
                  --if pos_category == "barrel" then
                  --log("fire pos: " .. unit:get_object(Idstring("fire")).position)

                  --log("fire after pos: " .. unit:get_object(Idstring("fire")).position)
                  --end
                  if current_weap.required[object_name] then
                    local required_table = current_weap.required[object_name]
                    for p, d in pairs(required_table) do
                      local object_req = unit:get_object(Idstring(d))
                      if object_req then
                        object_req:set_local_position(vector)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  for p, d in pairs(current_weap.required_reset[category]) do
    local object = unit:get_object(Idstring(d))
    if object then
      object:set_visibility(false)
    end
  end

  if current_weap.absolute_reset_on_update then
    for aroupdKey, aroupdVal in pairs(current_weap.absolute_reset_on_update) do
      for _, aroupdItem in pairs(aroupdVal) do
        local object = unit:get_object(Idstring(aroupdItem))
        if object and object:visibility() == true then
          object:set_visibility(false)
          NPCWeap:update_category(unit, current_weap, "random", aroupdKey)
        end
      end
    end
  end

  if current_weap.required[object_name] then
    local required_table = current_weap.required[object_name]
    for p, d in pairs(required_table) do
      local object = unit:get_object(Idstring(d))
      if object then
        object:set_visibility(true)
      end
    end
  end
  for p, d in pairs(current_weap.required) do
    for i, j in pairs(d) do
      local req_object = unit:get_object(Idstring(p))
      if req_object and req_object:visibility() == true then
        local object = unit:get_object(Idstring(j))
        if object then
          object:set_visibility(true)
        end
      end
    end
  end
end

Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildNPCWeapMenu", function(menu_manager, nodes)
  if nodes.main then
    nodes[NPCWeap.menu_name] = MenuHelper:BuildMenu(NPCWeap.menu_name)
    MenuHelper:AddMenuItem(MenuHelper.menus.lua_mod_options_menu, NPCWeap.menu_name, "NPCWeap_button", "NPCWeap_button_help", 1)
    nodes[NPCWeap.menu_name]._parameters.scene_state = "standard"
  end
end)
