local function PreHook()
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
end

-- PreHook
Hooks:PreHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet", PreHook)
Hooks:PreHook(CopDamage, "damage_fire", "hitmark_copdamage_fire", PreHook)
Hooks:PreHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion", PreHook)
Hooks:PreHook(CopDamage, "damage_tase", "hitmark_copdamage_tase", PreHook)
Hooks:PreHook(CopDamage, "damage_melee", "hitmark_copdamage_melee", PreHook)

-- PostHook
Hooks:PostHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_fire", "hitmark_copdamage_fire", PostHook)
Hooks:PostHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion", PostHook)
Hooks:PostHook(CopDamage, "damage_tase", "hitmark_copdamage_tase", PostHook)
Hooks:PostHook(CopDamage, "damage_melee", "hitmark_copdamage_melee", PostHook)
