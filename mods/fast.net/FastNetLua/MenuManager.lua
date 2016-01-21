function MenuCallbackHandler:choice_difficulty_filter(item)
  log("initial choice difficulty")

  local diff_filter = item:value()

  print("diff_filter", diff_filter)

  if managers.network.matchmake:get_lobby_filter("difficulty") == diff_filter then
    return
  end

  managers.network.matchmake:add_lobby_filter("difficulty", diff_filter, "equal")
  managers.network.matchmake:search_lobby(managers.network.matchmake:search_friends_only())
  log("it should be done")
end


function MenuCallbackHandler:_find_online_games(friends_only)
  if self:is_win32() then
    local function f(info)
      print("info in function")
      print(inspect(info))
      managers.network.matchmake:search_lobby_done()
      managers.menu:active_menu().logic:refresh_node(FastNet.fastnetmenu, true, info, friends_only)
    end

    managers.network.matchmake:register_callback("search_lobby", f)
    --managers.network.matchmake:set_lobby_return_count(150)
    managers.menu:show_retrieving_servers_dialog()
    managers.network.matchmake:search_lobby(friends_only)

    local usrs_f = function(success, amount)
      print("usrs_f", success, amount)

      if success then
        local stack = managers.menu:active_menu().renderer._node_gui_stack
        local node_gui = stack[#stack]

        if node_gui.set_mini_info then
          node_gui:set_mini_info(managers.localization:text("menu_players_online", { COUNT = amount }))
        end
      end
    end

    Steam:sa_handler():concurrent_users_callback(usrs_f)
    Steam:sa_handler():get_concurrent_users()
  end

  if self:is_ps3() or self:is_ps4() then
    if #PSN:get_world_list() == 0 then
      return
    end

    local function f(info_list)
      print("info_list in function")
      print(inspect(info_list))
      managers.network.matchmake:search_lobby_done()
      managers.menu:active_menu().logic:refresh_node("play_online", true, info_list, friends_only)
    end

    managers.network.matchmake:register_callback("search_lobby", f)
    managers.network.matchmake:start_search_lobbys(friends_only)
  end
end

function MenuCallbackHandler:choice_state_filter(item)
  log("state Filter")

  local state_filter = item:value()

  if managers.network.matchmake:get_lobby_filter("state") == state_filter then
    return
  end

  managers.network.matchmake:add_lobby_filter("state", state_filter, "equal")
  managers.network.matchmake:search_lobby(managers.network.matchmake:search_friends_only())
end

function MenuSTEAMHostBrowser:add_filter(node)
  if node:item("server_filter") then
    return
  end

  local params = {
    name = "server_filter",
    text_id = "menu_dist_filter",
    help_id = "menu_dist_filter_help",
    --visible_callback = "is_pc_controller",
    callback = "choice_distance_filter",
    filter = true
  }
  local data_node = {
    type = "MenuItemMultiChoice",
    {
      _meta = "option",
      text_id = "menu_dist_filter_close",
      value = 1
    },
    {
      _meta = "option",
      text_id = "menu_dist_filter_far",
      value = 2
    },
    {
      _meta = "option",
      text_id = "menu_dist_filter_worldwide",
      value = 3
    }
  }

  local new_item = node:create_item(data_node, params)

  new_item:set_value(managers.network.matchmake:distance_filter())
  node:add_item(new_item)

  local params = {
    name = "difficulty_filter",
    text_id = "menu_diff_filter",
    help_id = "menu_diff_filter_help",
    --visible_callback = "is_pc_controller",
    callback = "choice_difficulty_filter",
    filter = true
  }
  local data_node = {
    type = "MenuItemMultiChoice",
    {
      _meta = "option",
      text_id = "menu_all",
      value = -1
    },
    {
      _meta = "option",
      text_id = "menu_difficulty_normal",
      value = 2
    },
    {
      _meta = "option",
      text_id = "menu_difficulty_hard",
      value = 3
    },
    {
      _meta = "option",
      text_id = "menu_difficulty_very_hard",
      value = 4
    },
    {
      _meta = "option",
      text_id = "menu_difficulty_overkill",
      value = 5
    },
    {
      _meta = "option",
      text_id = "menu_difficulty_apocalypse",
      value = 6
    }
  }

  local new_item = node:create_item(data_node, params)

  new_item:set_value(managers.network.matchmake:get_lobby_filter("difficulty"))
  node:add_item(new_item)

  local params = {
    name = "state_filter",
    text_id = "menu_state_filter",
    help_id = "menu_state_filter_help",
    --visible_callback = "is_pc_controller",
    callback = "choice_state_filter",
    filter = true
  }
  local data_node = {
    type = "MenuItemMultiChoice",
    {
      _meta = "option",
      text_id = "menu_all",
      value = -1
    },
    {
      _meta = "option",
      text_id = "menu_state_lobby",
      value = 1
    },
    {
      _meta = "option",
      text_id = "menu_state_loading",
      value = 2
    },
    {
      _meta = "option",
      text_id = "menu_state_ingame",
      value = 3
    }
  }

  local new_item = node:create_item(data_node, params)

  new_item:set_value(managers.network.matchmake:get_lobby_filter("state"))
  node:add_item(new_item)

  local params = {
    name = "heist_filter",
    text_id = "menu_heist_filter",
    help_id = "menu_heist_filter_help",
    --visible_callback = "is_pc_controller",
    callback = "choice_job_id_filter",
    filter = true
  }
  local data_node = {
    type = "MenuItemMultiChoice",
    {
      _meta = "option",
      text_id = "menu_any",
      value = -1
    }
  }

  for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
    if not tweak_data.narrative.jobs[job_id].wrapped_to_job and tweak_data.narrative.jobs[job_id].contact ~= "wip" then
      local text_id, color_data = tweak_data.narrative:create_job_name(job_id)
      local params = {
        _meta = "option",
        text_id = text_id,
        value = index,
        localize = false
      }

      for count, color in ipairs(color_data) do
        params["color" .. count] = color.color
        params["color_start" .. count] = color.start
        params["color_stop" .. count] = color.stop
      end

      table.insert(data_node, params)
    end
  end

  local new_item = node:create_item(data_node, params)

  new_item:set_value(managers.network.matchmake:get_lobby_filter("job_id"))
  node:add_item(new_item)

  local params = {
    name = "servers_filter",
    text_id = "menu_servers_filter",
    help_id = "menu_servers_filter_help",
    --visible_callback = "is_pc_controller",
    callback = "choice_max_lobbies_filter",
    filter = true
  }
  local data_node = {
    type = "MenuItemMultiChoice",
    {
      _meta = "option",
      text_id = "10",
      localize = false,
      value = 10
    },
    {
      _meta = "option",
      text_id = "20",
      localize = false,
      value = 20
    },
    {
      _meta = "option",
      text_id = "30",
      localize = false,
      value = 30
    },
    {
      _meta = "option",
      text_id = "40",
      localize = false,
      value = 40
    },
    {
      _meta = "option",
      text_id = "50",
      localize = false,
      value = 50
    }
  }

  local new_item = node:create_item(data_node, params)

  new_item:set_value(managers.network.matchmake:get_lobby_return_count())
  node:add_item(new_item)
end

function MenuSTEAMHostBrowser:refresh_node(node, info, friends_only)
  local new_node = node

  if not friends_only then
    self:add_filter(new_node)
  end

  if not info then
    managers.menu:add_back_button(new_node)
    return new_node
  end

  local room_list = info.room_list
  local attribute_list = info.attribute_list
  local dead_list = {}

  for _, item in ipairs(node:items()) do
    if not item:parameters().back and not item:parameters().filter and not item:parameters().pd2_corner then
      dead_list[item:parameters().room_id] = true
    end
  end

  for i, room in ipairs(room_list) do
    local name_str = tostring(room.owner_name)
    local attributes_numbers = attribute_list[i].numbers

    if managers.network.matchmake:is_server_ok(friends_only, room.owner_id, attributes_numbers) then
      dead_list[room.room_id] = nil

      local host_name = name_str
      local level_index, job_index = managers.network.matchmake:_split_attribute_number(attributes_numbers[1], 1000)
      local level_id = tweak_data.levels:get_level_name_from_index(level_index)
      local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
      local level_name = name_id and managers.localization:text(name_id) or "CONTRACTLESS"
      local job_id = tweak_data.narrative:get_job_name_from_index(math.floor(job_index))
      local job_name = job_id and tweak_data.narrative.jobs[job_id] and managers.localization:text(tweak_data.narrative.jobs[job_id].name_id) or "CONTRACTLESS"
      local job_days = job_id and (tweak_data.narrative.jobs[job_id].job_wrapper and table.maxn(tweak_data.narrative.jobs[tweak_data.narrative.jobs[job_id].job_wrapper[1]].chain) or table.maxn(tweak_data.narrative.jobs[job_id].chain)) or 1
      local is_pro = job_id and (tweak_data.narrative.jobs[job_id].professional and tweak_data.narrative.jobs[job_id].professional or false) or false
      local difficulties = {
        "easy",
        "normal",
        "hard",
        "very_hard",
        "overkill",
        "apocalypse"
      }
      local difficulty = difficulties[attributes_numbers[2]] or "error"
      local difficulty_num = attributes_numbers[2]
      local state_string_id = tweak_data:index_to_server_state(attributes_numbers[4])
      local state_name = state_string_id and managers.localization:text("menu_lobby_server_state_" .. state_string_id) or "blah"
      --local display_job = job_name .. ((level_name ~= job_name and job_days ~= 1)and " (" .. level_name .. ")" or "")
      local display_job = job_name .. ((level_name ~= job_name) and " (" .. level_name .. ")" or "")
      local state = attributes_numbers[4]
      local num_plrs = attributes_numbers[5]
      local item = new_node:item(room.room_id)

      if not item and not (state ~= 1 and not tweak_data.narrative.jobs[job_id]) then
        local params = {
          name = room.room_id,
          text_id = name_str,
          room_id = room.room_id,
          columns = {
            utf8.to_upper(host_name),
            utf8.to_upper(display_job),
            utf8.to_upper(state_name),
            tostring(num_plrs) .. "/4 "
          },
          pro = is_pro,
          days = job_days,
          level_name = job_id,
          real_level_name = display_job,
          level_id = level_id,
          state_name = state_name,
          difficulty = difficulty,
          difficulty_num = difficulty_num or 2,
          host_name = host_name,
          state = state,
          num_plrs = num_plrs,
          callback = "connect_to_lobby",
          localize = false
        }
        local new_item = new_node:create_item({ type = "ItemServerColumn" }, params)

        new_node:add_item(new_item)
      elseif not (state ~= 1 and not tweak_data.narrative.jobs[job_id]) then
        if item:parameters().real_level_name ~= display_job then
          item:parameters().columns[2] = utf8.to_upper(display_job)
          item:parameters().level_name = job_id
          item:parameters().level_id = level_id
          item:parameters().real_level_name = display_job
        end

        if item:parameters().state ~= state then
          item:parameters().columns[3] = state_name
          item:parameters().state = state
          item:parameters().state_name = state_name
        end

        if item:parameters().difficulty ~= difficulty then
          item:parameters().difficulty = difficulty
        end

        if item:parameters().room_id ~= room.room_id then
          item:parameters().room_id = room.room_id
        end

        if item:parameters().num_plrs ~= num_plrs then
          item:parameters().num_plrs = num_plrs
          item:parameters().columns[4] = tostring(num_plrs) .. "/4 "
        end
      elseif item then
        new_node:delete_item(room.room_id)
      end
    end
  end

  for name, _ in pairs(dead_list) do
    new_node:delete_item(name)
  end

  managers.menu:add_back_button(new_node)
  return new_node
end
