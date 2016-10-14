_G.BBMenu = _G.BBMenu or {}

BBMenu._path = ModPath
BBMenu._data_path = ModPath .. "bb_data.txt"
BBMenu._data = {}

function BBMenu:Save()
  local file = io.open(self._data_path, "w+")

  if file then
    file:write(json.encode(self._data))
    file:close()
  end
end

function BBMenu:Load()
  local file = io.open(self._data_path, "r")

  if file then
    self._data = json.decode(file:read("*all"))
    file:close()
  end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BBMenu", function(loc)
  --  for _, filename in pairs(file.GetFiles(BBMenu._path .. "loc/")) do
  --    local str = filename:match('^(.*).txt$')
  --
  --    if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
  --      loc:load_localization_file(BBMenu._path .. "loc/" .. filename)
  --      break
  --    end
  --  end
  --
  --  loc:load_localization_file(BBMenu._path .. "loc/english.txt", false)

  loc:load_localization_file(BBMenu._path .. "loc/chinese.txt", false)
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_BBMenu", function(menu_manager)
  MenuCallbackHandler.callback_number_choice = function(self, item)
    BBMenu._data.number = item:value()
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_health_choice = function(self, item)
    BBMenu._data.health = item:value()
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_speed_choice = function(self, item)
    BBMenu._data.speed = item:value()
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_move_choice = function(self, item)
    BBMenu._data.move = item:value()
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_weaprof_choice = function(self, item)
    BBMenu._data.weaprof = item:value()
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_ak_toggle = function(self, item)
    BBMenu._data.akrifles = (item:value() == "on" and true or false)
    BBMenu:Save()
  end

  MenuCallbackHandler.callback_path_toggle = function(self, item)
    BBMenu._data.coppath = (item:value() == "on" and true or false)
    BBMenu:Save()
  end

  BBMenu:Load()
  MenuHelper:LoadFromJsonFile(BBMenu._path .. "menu.txt", BBMenu, BBMenu._data)
end)

BBMenu:Load()

if RequiredScript == "lib/tweak_data/charactertweakdata" then
  local old_ctd = CharacterTweakData._presets

  function CharacterTweakData:_presets(tweak_data, ...)
    local presets = old_ctd(self, tweak_data, ...)

    presets.weapon.gang_member.m4.aim_delay = { 0, 0 }
    presets.weapon.gang_member.m4.focus_delay = 0
    presets.weapon.gang_member.m4.range = presets.weapon.sniper.m4.range
    presets.gang_member_damage.hurt_severity = presets.hurt_severities.only_light_hurt
    presets.detection.gang_member.idle.angle_max = 240
    presets.detection.gang_member.combat.angle_max = 240
    presets.detection.gang_member.recon.angle_max = 240
    presets.detection.gang_member.guard.angle_max = 240

    return presets
  end
end

if RequiredScript == "lib/managers/criminalsmanager" then
  if BBMenu._data.number == 1 then
    CriminalsManager.MAX_NR_TEAM_AI = 1
  elseif BBMenu._data.number == 3 then
    CriminalsManager.MAX_NR_TEAM_AI = 3
  end

  if BBMenu._data.health == 2 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 75
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME = 2
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
  elseif BBMenu._data.health == 3 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 70
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME = 3
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME_AWAY = 3

    if Global.game_settings.difficulty ~= "overkill_290" then
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
    else
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
    end
  elseif BBMenu._data.health == 4 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 25
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME = 3
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME_AWAY = 3

    if Global.game_settings.difficulty ~= "overkill_290" then
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
    else
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
    end
  elseif BBMenu._data.health == 5 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 34
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME = 3
    tweak_data.character.presets.gang_member_damage.REGENERATE_TIME_AWAY = 3

    if Global.game_settings.difficulty ~= "overkill_290" then
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.45
    else
      tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
    end
  elseif BBMenu._data.health == 6 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 24
  elseif BBMenu._data.health == 7 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 34
  elseif BBMenu._data.health == 8 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 61.2
  elseif BBMenu._data.health == 9 then
    tweak_data.character.presets.gang_member_damage.HEALTH_INIT = 102
  end

  if BBMenu._data.weaprof == 2 then
    tweak_data.character.presets.weapon.gang_member.m4.FALLOFF = tweak_data.character.presets.weapon.normal.m4.FALLOFF
  elseif BBMenu._data.weaprof == 3 then
    tweak_data.character.presets.weapon.gang_member.m4.FALLOFF = tweak_data.character.presets.weapon.good.m4.FALLOFF
  elseif BBMenu._data.weaprof == 4 then
    tweak_data.character.presets.weapon.gang_member.m4.FALLOFF = tweak_data.character.presets.weapon.expert.m4.FALLOFF
  elseif BBMenu._data.weaprof == 5 then
    tweak_data.character.presets.weapon.gang_member.m4.FALLOFF = tweak_data.character.presets.weapon.deathwish.m4.FALLOFF
  end

  local movespeed = tweak_data.character.presets.move_speed.fast

  if BBMenu._data.speed == 1 then
    movespeed = tweak_data.character.presets.move_speed.very_slow
  elseif BBMenu._data.speed == 2 then
    movespeed = tweak_data.character.presets.move_speed.slow
  elseif BBMenu._data.speed == 3 then
    movespeed = tweak_data.character.presets.move_speed.normal
  elseif BBMenu._data.speed == 5 then
    movespeed = tweak_data.character.presets.move_speed.very_fast
  elseif BBMenu._data.speed == 6 then
    movespeed = tweak_data.character.presets.move_speed.lightning
  end

  for k, v in pairs(tweak_data.character) do
    if type(v) == "table" and v.access == "teamAI1" then
      v.no_run_start = true
      v.no_run_stop = true
      v.move_speed = movespeed

      local original_weapon_choice = v.weapon.weapons_of_choice

      v.weapon = deep_clone(tweak_data.character.presets.weapon.gang_member)
      v.weapon.weapons_of_choice = BBMenu._data.akrifles and { primary = Idstring("units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47") } or original_weapon_choice

      if BBMenu._data.move == 2 then
        v.dodge = tweak_data.character.presets.dodge.athletic
      elseif BBMenu._data.move == 3 then
        v.allowed_poses = { crouch = false }
      end
    end
  end
end

if RequiredScript == "lib/units/enemies/cop/copdamage" then
  function CopDamage:_AI_comment_death(unit, type)
    if type == "tank" then
      unit:sound():say("g30x_any", true, true)
    elseif type == "spooc" then
      unit:sound():say("g33x_any", true, true)
    elseif type == "taser" then
      unit:sound():say("g32x_any", true, true)
    elseif type == "shield" then
      unit:sound():say("g31x_any", true, true)
    elseif type == "sniper" then
      unit:sound():say("g35x_any", true, true)
    end
  end
end

if RequiredScript == "lib/units/player_team/logics/teamailogicassault" then
  TeamAILogicAssault._COVER_CHK_INTERVAL = 0

  function TeamAILogicAssault.mark_enemy(data, criminal, to_mark, play_sound, play_action)
    if play_sound then
      criminal:sound():say(to_mark:base():char_tweak().priority_shout .. "x_any", true, true)
    end

    if play_action and not criminal:movement():chk_action_forbidden("action") then
      local new_action = {
        type = "act",
        variant = "arrest",
        body_part = 3,
        align_sync = true
      }

      if criminal:brain():action_request(new_action) then
        data.internal_data.gesture_arrest = true
      end
    end

    if managers.player:has_category_upgrade("player", "special_enemy_highlight") and Global.game_settings.single_player then
      to_mark:contour():add(managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_enemy_damage_bonus" or "mark_enemy", true)
    else
      to_mark:contour():add("mark_enemy", true)
    end
  end
end

if RequiredScript == "lib/units/player_team/logics/teamailogicidle" then
  function TeamAILogicIdle._get_priority_attention(data, attention_objects, reaction_func)
    reaction_func = reaction_func or TeamAILogicBase._chk_reaction_to_attention_object

    local best_target, best_target_priority_slot, best_target_priority, best_target_reaction

    for u_key, attention_data in pairs(attention_objects) do
      local att_unit = attention_data.unit
      local crim_record = attention_data.criminal_record

      if not attention_data.identified then
      elseif attention_data.pause_expire_t then
        if data.t > attention_data.pause_expire_t then
          attention_data.pause_expire_t = nil
        end
      elseif attention_data.stare_expire_t and data.t > attention_data.stare_expire_t then
        if attention_data.settings.pause then
          attention_data.stare_expire_t = nil
          attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
        end
      else
        local distance = mvector3.distance(data.m_pos, attention_data.m_pos)
        local reaction = reaction_func(data, attention_data, not CopLogicAttack._can_move(data))
        local aimed_at = TeamAILogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)

        attention_data.aimed_at = aimed_at

        local reaction_too_mild

        if not reaction or best_target_reaction and best_target_reaction > reaction then
          reaction_too_mild = true
        elseif distance < 150 and reaction <= AIAttentionObject.REACT_SURPRISED then
          reaction_too_mild = true
        end

        if not reaction_too_mild then
          local alert_dt = attention_data.alert_t and data.t - attention_data.alert_t or 10000
          local dmg_dt = attention_data.dmg_t and data.t - attention_data.dmg_t or 10000
          local mark_dt = attention_data.mark_t and data.t - attention_data.mark_t or 10000
          local near_threshold = 800

          if data.attention_obj and data.attention_obj.u_key == u_key then
            alert_dt = alert_dt * 0.8
            dmg_dt = dmg_dt * 0.8
            mark_dt = mark_dt * 0.8
            distance = distance * 0.8
          end

          local visible = attention_data.verified
          local near = near_threshold > distance
          local has_alerted = alert_dt < 5
          local has_damaged = dmg_dt < 2
          local been_marked = mark_dt < 8
          local dangerous_special = attention_data.is_very_dangerous
          local target_priority = distance
          local target_priority_slot = 0
          local enemy_type = att_unit:base()._tweak_table

          if visible then
            if enemy_type == "shield" then
              local target_vec = data.m_pos - att_unit:movement():m_pos()
              local spin = target_vec:to_polar_with_reference(att_unit:movement():m_rot():y(), math.UP).spin

              target_priority_slot = math.abs(spin) > 90 and 1 or 7
            else
              if enemy_type == "tank" and near then
                local target_vec = data.m_pos - att_unit:movement():m_pos()
                local spin = target_vec:to_polar_with_reference(att_unit:movement():m_rot():y(), math.UP).spin

                target_priority_slot = math.abs(spin) < 90 and 1 or 3
              elseif enemy_type == "sniper" or (enemy_type == "phalanx_minion" and near) then
                target_priority_slot = 1
              elseif (dangerous_special or been_marked) and distance < 1600 then
                target_priority_slot = 2
              elseif near and (has_alerted and has_damaged or been_marked) then
                target_priority_slot = 3
              elseif near and has_alerted then
                target_priority_slot = 4
              elseif has_alerted then
                target_priority_slot = 5
              else
                target_priority_slot = 6
              end
            end
          elseif has_alerted then
            target_priority_slot = 7
          else
            target_priority_slot = 8
          end

          if reaction < AIAttentionObject.REACT_COMBAT then
            target_priority_slot = 10 + target_priority_slot + math.max(0, AIAttentionObject.REACT_COMBAT - reaction)
          end

          if target_priority_slot ~= 0 then
            local best = false

            if not best_target then
              best = true
            elseif best_target_priority_slot > target_priority_slot then
              best = true
            elseif target_priority_slot == best_target_priority_slot and best_target_priority > target_priority then
              best = true
            end

            if best then
              best_target = attention_data
              best_target_priority_slot = target_priority_slot
              best_target_priority = target_priority
              best_target_reaction = reaction
            end
          end
        end
      end
    end

    return best_target, best_target_priority_slot, best_target_reaction
  end
end

if RequiredScript == "lib/units/beings/player/states/playerbleedout" then
  function PlayerBleedOut._register_revive_SO(revive_SO_data, variant)
    if managers.player:has_category_upgrade("player", "revive_interaction_speed_multiplier") and Global.game_settings.single_player then
      tweak_data.interaction.revive.timer = 3
    end

    if revive_SO_data.SO_id or not managers.navigation:is_data_ready() then
      return
    end

    local followup_objective = {
      type = "act",
      scan = true,
      action = {
        type = "act",
        body_part = 1,
        variant = "crouch",
        blocks = {
          action = -1,
          walk = -1,
          hurt = -1,
          heavy_hurt = -1,
          aim = -1
        }
      }
    }
    local objective = {
      type = "revive",
      follow_unit = revive_SO_data.unit,
      called = true,
      destroy_clbk_key = false,
      nav_seg = revive_SO_data.unit:movement():nav_tracker():nav_segment(),
      fail_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_failed", revive_SO_data),
      complete_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_completed", revive_SO_data),
      action_start_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_started", revive_SO_data),
      interrupt_dis = 0,
      interrupt_health = 0,
      interrupt_suppression = false,
      scan = true,
      action = {
        type = "act",
        variant = variant,
        body_part = 1,
        blocks = {
          action = -1,
          walk = -1,
          light_hurt = -1,
          hurt = -1,
          heavy_hurt = -1,
          aim = -1
        },
        align_sync = true
      },
      action_duration = tweak_data.interaction[variant == "untie" and "free" or variant].timer,
      followup_objective = followup_objective
    }
    local so_descriptor = {
      objective = objective,
      base_chance = 1,
      chance_inc = 0,
      interval = 0,
      search_pos = revive_SO_data.unit:position(),
      usage_amount = 1,
      AI_group = "friendlies",
      admin_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_administered", revive_SO_data),
      verification_clbk = callback(PlayerBleedOut, PlayerBleedOut, "rescue_SO_verification", revive_SO_data.unit)
    }

    revive_SO_data.variant = variant

    local so_id = "Playerrevive"

    revive_SO_data.SO_id = so_id

    managers.groupai:state():add_special_objective(so_id, so_descriptor)

    if not revive_SO_data.deathguard_SO_id then
      revive_SO_data.deathguard_SO_id = PlayerBleedOut._register_deathguard_SO(revive_SO_data.unit)
    end
  end
end

if RequiredScript == "lib/units/player_team/logics/teamailogicdisabled" then
  function TeamAILogicDisabled._register_revive_SO(data, my_data, rescue_type)
    local followup_objective = {
      type = "act",
      scan = true,
      action = {
        type = "act",
        body_part = 1,
        variant = "crouch",
        blocks = {
          action = -1,
          walk = -1,
          hurt = -1,
          heavy_hurt = -1,
          aim = -1
        }
      }
    }
    local objective = {
      type = "revive",
      follow_unit = data.unit,
      called = true,
      scan = true,
      destroy_clbk_key = false,
      nav_seg = data.unit:movement():nav_tracker():nav_segment(),
      fail_clbk = callback(TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_failed", data),
      interrupt_dis = 0,
      interrupt_health = 0,
      interrupt_suppression = false,
      action = {
        type = "act",
        variant = rescue_type,
        body_part = 1,
        blocks = {
          action = -1,
          walk = -1,
          light_hurt = -1,
          hurt = -1,
          heavy_hurt = -1,
          aim = -1
        },
        align_sync = true
      },
      action_duration = tweak_data.interaction[data.name == "surrender" and "free" or "revive"].timer,
      followup_objective = followup_objective
    }
    local so_descriptor = {
      objective = objective,
      base_chance = 1,
      chance_inc = 0,
      interval = 0,
      search_dis_sq = 1000000,
      search_pos = mvector3.copy(data.m_pos),
      usage_amount = 1,
      AI_group = "friendlies",
      admin_clbk = callback(TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_administered", data)
    }
    local so_id = "TeamAIrevive" .. tostring(data.key)

    my_data.SO_id = so_id
    managers.groupai:state():add_special_objective(so_id, so_descriptor)
    my_data.deathguard_SO_id = PlayerBleedOut._register_deathguard_SO(data.unit)
  end
end

if RequiredScript == "lib/managers/mission/elementmissionend" then
  function ElementMissionEnd:on_executed(instigator)
    if not self._values.enabled then
      return
    end

    if self._values.state ~= "none" then
      if self._values.state == "success" then
        if managers.platform:presence() == "Playing" then
          local num_winners = managers.network:session():amount_of_alive_players()

          if Global.game_settings.single_player then
            num_winners = managers.network:session():amount_of_alive_players() + managers.groupai:state():amount_of_winning_ai_criminals()
          end

          managers.network:session():send_to_peers("mission_ended", true, num_winners)
          game_state_machine:change_state_by_name("victoryscreen", {
            num_winners = num_winners,
            personal_win = alive(managers.player:player_unit())
          })
        end
      elseif self._values.state == "failed" then
        print("No fail state yet")
      elseif self._values.state == "leave_safehouse" and managers.platform:presence() == "Playing" then
        MenuCallbackHandler:leave_safehouse()
      end
    elseif Application:editor() then
      managers.editor:output_error("Cant change to state " .. self._values.state .. " in mission end element " .. self._editor_name .. ".")
    end

    ElementMissionEnd.super.on_executed(self, instigator)
  end
end

if RequiredScript == "lib/units/enemies/cop/copbrain" then
  function CopBrain:search_for_path_to_unit(search_id, other_unit, access_neg)
    local enemy_tracker = other_unit:movement():nav_tracker()
    local pos_to = enemy_tracker:field_position()
    local params = {
      tracker_from = self._unit:movement():nav_tracker(),
      tracker_to = enemy_tracker,
      result_clbk = callback(self, self, "clbk_pathing_results", search_id),
      id = search_id,
      access_pos = self._SO_access,
      access_neg = access_neg
    }

    if not managers.groupai:state():whisper_mode() and BBMenu._data.coppath == true then
      params.access_pos = (tweak_data.character.spooc.access)
    end

    self._logic_data.active_searches[search_id] = true
    managers.navigation:search_pos_to_pos(params)

    return true
  end

  function CopBrain:search_for_path(search_id, to_pos, prio, access_neg, nav_segs)
    local params = {
      tracker_from = self._unit:movement():nav_tracker(),
      pos_to = to_pos,
      result_clbk = callback(self, self, "clbk_pathing_results", search_id),
      id = search_id,
      prio = prio,
      access_pos = self._SO_access,
      access_neg = access_neg,
      nav_segs = nav_segs
    }

    if not managers.groupai:state():whisper_mode() and BBMenu._data.coppath == true then
      params.access_pos = (tweak_data.character.spooc.access)
    end

    self._logic_data.active_searches[search_id] = true
    managers.navigation:search_pos_to_pos(params)

    return true
  end

  function CopBrain:search_for_path_from_pos(search_id, from_pos, to_pos, prio, access_neg, nav_segs)
    local params = {
      pos_from = from_pos,
      pos_to = to_pos,
      result_clbk = callback(self, self, "clbk_pathing_results", search_id),
      id = search_id,
      prio = prio,
      access_pos = self._SO_access,
      access_neg = access_neg,
      nav_segs = nav_segs
    }

    if not managers.groupai:state():whisper_mode() and BBMenu._data.coppath == true then
      params.access_pos = (tweak_data.character.spooc.access)
    end

    self._logic_data.active_searches[search_id] = true
    managers.navigation:search_pos_to_pos(params)

    return true
  end

  function CopBrain:search_for_path_to_cover(search_id, cover, offset_pos, access_neg)
    local params = {
      tracker_from = self._unit:movement():nav_tracker(),
      tracker_to = cover[3],
      result_clbk = callback(self, self, "clbk_pathing_results", search_id),
      id = search_id,
      access_pos = self._SO_access,
      access_neg = access_neg
    }

    if not managers.groupai:state():whisper_mode() and BBMenu._data.coppath == true then
      params.access_pos = (tweak_data.character.spooc.access)
    end

    self._logic_data.active_searches[search_id] = true
    managers.navigation:search_pos_to_pos(params)

    return true
  end

  function CopBrain:search_for_coarse_path(search_id, to_seg, verify_clbk, access_neg)
    local params = {
      from_tracker = self._unit:movement():nav_tracker(),
      to_seg = to_seg,
      access = { "walk" },
      id = search_id,
      results_clbk = callback(self, self, "clbk_coarse_pathing_results", search_id),
      verify_clbk = verify_clbk,
      access_pos = self._logic_data.char_tweak.access,
      access_neg = access_neg
    }

    if not managers.groupai:state():whisper_mode() and BBMenu._data.coppath == true then
      params.access_pos = (tweak_data.character.spooc.access)
    end

    self._logic_data.active_searches[search_id] = 2
    managers.navigation:search_coarse(params)

    return true
  end
end

if RequiredScript == "lib/units/player_team/teamaimovement" then
  function TeamAIMovement:tased()
    if managers.player:has_category_upgrade("player", "taser_malfunction") and Global.game_settings.single_player then
      return
    else
      return self._unit:anim_data().tased
    end
  end

  function TeamAIMovement:on_SPOOCed(enemy_unit)
    if managers.player:has_category_upgrade("player", "counter_strike_spooc") and Global.game_settings.single_player then
      return "countered"
    else
      self._unit:character_damage():on_incapacitated()
    end
  end
end

if RequiredScript == "lib/units/civilians/logics/civilianlogicsurrender" then
  local old_cls = CivilianLogicSurrender.on_alert

  function CivilianLogicSurrender.on_alert(data, alert_data)
    old_cls(self, data, alert_data)
    if CopLogicBase.is_alert_aggressive(alert_data[1]) then
      local aggressor = alert_data[5]
      if aggressor and aggressor:base() then
        local is_intimidation

        if Global.game_settings.single_player then
          if managers.player:has_category_upgrade("player", "civ_calming_alerts") then
            is_intimidation = true
          end
        else
          if aggressor:base().is_local_player then
            if managers.player:has_category_upgrade("player", "civ_calming_alerts") then
              is_intimidation = true
            end
          elseif aggressor:base().is_husk_player and aggressor:base():upgrade_value("player", "civ_calming_alerts") then
            is_intimidation = true
          end
        end
        if is_intimidation and not data.is_tied then
          data.unit:brain():on_intimidated(1, aggressor)
          return
        end
      end
    end
  end
end

function getNode(id)
  for name, script in pairs(managers.mission:scripts()) do
    if script:element(id) then
      return script:element(id)
    end
  end
end

function executeNode(id)
  local node = getNode(id)

  if node then
    node._values.trigger_times = 2
  else
    io.write("NODE DOES NOT EXIST")
  end
end

if RequiredScript == "lib/units/enemies/cop/actions/full_body/copactionwarp" then
  local old_caw = CopActionWarp.init

  function CopActionWarp:init(action_desc, common_data)
    old_caw(self, action_desc, common_data)

    if Global.game_settings.level_id == "pbr2" then
      executeNode(101020)
      executeNode(101021)
    end
  end
end

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_BB", function(peer, peer_id)
  if Network:is_server() then
    DelayedCalls:Add("DelayedWarnModBB" .. tostring(peer_id), 2, function()
      local message = "Host is running 'Better Bots': AI teammates will be tweaked and improved."
      local peer2 = managers.network:session() and managers.network:session():peer(peer_id)

      if peer2 then
        peer2:send("send_chat_message", ChatManager.GAME, message)
      end
    end)
  end
end)
