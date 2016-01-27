local function PreHook()
  HitMark.hooked = true
  HitMark.critshot = false
  HitMark.direct_hit = false
end

local function PostHook(self, attack_data)
  if HitMark.direct_hit then
    local kill_confirmed = attack_data.result.type == "death"
    local headshot = self._head_body_name
      and attack_data.col_ray.body
      and self._head_body_key
      and attack_data.col_ray.body:key() == self._head_body_key

    managers.hud:on_damage_confirmed(kill_confirmed, headshot)
  end

  HitMark.hooked = false
end

-- PreHook
Hooks:PreHook(NpcVehicleDamage, "damage_bullet", "hitmark_npcvehicledamage_bullet_pre", PreHook)
Hooks:PreHook(NpcVehicleDamage, "sync_damage_fire", "hitmark_npcvehicledamage_sync_fire_pre", PreHook)
Hooks:PreHook(NpcVehicleDamage, "sync_damage_explosion", "hitmark_npcvehicledamage_sync_explosion_pre", PreHook)

-- PostHook
Hooks:PostHook(NpcVehicleDamage, "damage_bullet", "hitmark_npcvehicledamage_bullet", PostHook)
Hooks:PostHook(NpcVehicleDamage, "sync_damage_fire", "hitmark_npcvehicledamage_sync_fire", PostHook)
Hooks:PostHook(NpcVehicleDamage, "sync_damage_explosion", "hitmark_npcvehicledamage_sync_explosion", PostHook)
