local function PreHook()
  HitMark.hooked = true
  HitMark.critshot = false
  HitMark.direct_hit = false
end

local function PostHook(self, attack_data)
  if HitMark.direct_hit then
    local death = self:dead()
    local hit_body_name = attack_data.col_ray.body and attack_data.col_ray.body:name()
    local headshot = hit_body_name
      and (hit_body_name == self._shield_body_name_ids
      or hit_body_name == self._bag_body_name_ids)

    managers.hud:on_damage_confirmed(death, headshot)
  end

  HitMark.hooked = false
end

-- PreHook
Hooks:PreHook(SentryGunDamage, "damage_bullet", "hitmark_sentrygundamage_bullet_pre", PreHook)
Hooks:PreHook(SentryGunDamage, "damage_explosion", "hitmark_sentrygundamage_explosion_pre", PreHook)

-- PostHook
Hooks:PostHook(SentryGunDamage, "damage_bullet", "hitmark_sentrygundamage_bullet", PostHook)
Hooks:PostHook(SentryGunDamage, "damage_explosion", "hitmark_sentrygundamage_explosion", PostHook)
