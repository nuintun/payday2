--CloneClass(NPCRaycastWeaponBase)
function NPCRaycastWeaponBase:init(unit)
  RaycastWeaponBase.super.init(self, unit, false)
  self._unit = unit
  self._name_id = self.name_id or "m4_npc"
  self.name_id = nil
  self._bullet_slotmask = managers.slot:get_mask("bullet_impact_targets")
  self._blank_slotmask = managers.slot:get_mask("bullet_blank_impact_targets")
  self:_create_use_setups()
  self._setup = {}
  self._digest_values = false
  self:set_ammo_max(tweak_data.weapon[self._name_id].AMMO_MAX)
  self:set_ammo_total(self:get_ammo_max())
  self:set_ammo_max_per_clip(tweak_data.weapon[self._name_id].CLIP_AMMO_MAX)
  self:set_ammo_remaining_in_clip(self:get_ammo_max_per_clip())
  self._damage = tweak_data.weapon[self._name_id].DAMAGE
  self._next_fire_allowed = -1000
  self._obj_fire = self._unit:get_object(Idstring("fire"))
  self._sound_fire = SoundDevice:create_source("fire")
  self._sound_fire:link(self._unit:orientation_object())
  self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash or "effects/particles/test/muzzleflash_maingun")
  self._muzzle_effect_table = {
    effect = self._muzzle_effect,
    parent = self._obj_fire,
    force_synch = false
  }
  self._use_shell_ejection_effect = SystemInfo:platform() == Idstring("WIN32")

  if self._use_shell_ejection_effect then
    self._obj_shell_ejection = self._unit:get_object(Idstring("a_shell"))
    self._shell_ejection_effect = Idstring(self:weapon_tweak_data().shell_ejection or "effects/payday2/particles/weapons/shells/shell_556")
    self._shell_ejection_effect_table = {
      effect = self._shell_ejection_effect,
      parent = self._obj_shell_ejection
    }
  end

  self._trail_effect_table = {
    effect = self.TRAIL_EFFECT,
    position = Vector3(),
    normal = Vector3()
  }
  self._flashlight_light_lod_enabled = true

  --do break end
  if self._multivoice then
    if not NPCRaycastWeaponBase._next_i_voice[self._name_id] then
      NPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
    end

    self._voice = NPCRaycastWeaponBase._VOICES[NPCRaycastWeaponBase._next_i_voice[self._name_id]]

    if NPCRaycastWeaponBase._next_i_voice[self._name_id] == #NPCRaycastWeaponBase._VOICES then
      NPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
    else
      NPCRaycastWeaponBase._next_i_voice[self._name_id] = NPCRaycastWeaponBase._next_i_voice[self._name_id] + 1
    end
  else
    self._voice = "a"
  end

  if self._unit:get_object(Idstring("ls_flashlight")) then
    self._flashlight_data = {}
    self._flashlight_data.light = self._unit:get_object(Idstring("ls_flashlight"))
    self._flashlight_data.effect = self._unit:effect_spawner(Idstring("flashlight"))
    self._flashlight_data.light:set_far_range(400)
    self._flashlight_data.light:set_spot_angle_end(25)
    self._flashlight_data.light:set_multiplier(2)
  end

  if tweak_data.weapon[self._name_id].has_suppressor then
    self._sound_fire:set_switch("suppressed", tweak_data.weapon[self._name_id].has_suppressor)
  end

  if self._name_id then
    log(self._name_id)
  end

  NPCWeap:setup_weapon(self._unit, self._name_id)

  if NPCWeap.weapons[self._name_id] then
    --noinspection UnusedDef
    local truee = true
    --noinspection UnusedDef
    local falsee = false
    local object = self._unit:get_object(Idstring("g_attachment_peqbox"))

    if object then
      if object:visibility() == true then
      end
    end
  end
  --self:start_autofire()
  --World:effect_manager():spawn(self._muzzle_effect_table)
end

function NPCRaycastWeaponBase:set_laser_enabled(state, npc_weapon_customize)
  if state then
    if alive(self._laser_unit) then
      return
    end

    local spawn_rot = self._obj_fire:rotation()
    local spawn_pos = self._obj_fire:position()

    if not npc_weapon_customize then
      spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
    else
      spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
    end

    self._laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_npc_upg_fl_ass_smg_sho_peqbox/wpn_npc_upg_fl_ass_smg_sho_peqbox"), spawn_pos, spawn_rot)
    self._unit:link(self._obj_fire:name(), self._laser_unit)
    self._laser_unit:base():set_npc()
    self._laser_unit:base():set_on()
    self._laser_unit:base():set_color_by_theme("cop_sniper")
    self._laser_unit:base():set_max_distace(10000)

    if npc_weapon_customize then
      self._laser_unit:get_object(Idstring("g_peqbox")):set_visibility(false)
      self._laser_unit:get_object(Idstring("g_laser")):set_visibility(false)
      self._laser_unit:get_object(Idstring("g_indicator")):set_visibility(false)
      log("set_objects_invis")
    end
  elseif alive(self._laser_unit) then
    self._laser_unit:set_slot(0)
    self._laser_unit = nil
  end
end

function NPCRaycastWeaponBase:set_flashlight_enabled(enabled)
  if not self._flashlight_data then
    return
  end

  log("set_flashlight_enabled")

  self._flashlight_data.enabled = enabled

  if managers.game_play_central:flashlights_on() and enabled then
    self._flashlight_data.light:set_enable(self._flashlight_light_lod_enabled)
    self._flashlight_data.effect:activate()
    self._flashlight_data.on = true
  else
    self._flashlight_data.light:set_enable(false)
    self._flashlight_data.effect:kill_effect()
    self._flashlight_data.on = false
  end
end
