local function PreHook()
  HitMark.direct_hit = false
  HitMark.hooked = true
end

local function PostHook(self, attack_data)
  HitMark.hooked = false

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
Hooks:PreHook(CopDamage, "damage_bullet", "hit_mark_damage_bullet", PreHook)
Hooks:PreHook(CopDamage, "damage_fire", "hit_mark_damage_bullet", PreHook)
Hooks:PreHook(CopDamage, "damage_explosion", "hit_mark_damage_bullet", PreHook)
Hooks:PreHook(CopDamage, "damage_tase", "hit_mark_damage_bullet", PreHook)
Hooks:PreHook(CopDamage, "damage_melee", "hit_mark_damage_bullet", PreHook)

-- PostHook
Hooks:PostHook(CopDamage, "damage_bullet", "hit_mark_damage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_fire", "hit_mark_damage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_explosion", "hit_mark_damage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_tase", "hit_mark_damage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_melee", "hit_mark_damage_bullet", PostHook)
