local was_dead

local function PreHook()
  HitMark.critshot = false
  HitMark.direct_hit = false
end

local function PostHook(self, attack_data)
  if HitMark.direct_hit then
    local kill_confirmed = self.dead()
    local hit_body_name = attack_data.col_ray.body and attack_data.col_ray.body:name()
    local headshot = hit_body_name
      and (hit_body_name == self._shield_body_name_ids
      or hit_body_name == self._bag_body_name_ids)

    managers.hud:on_damage_confirmed(kill_confirmed, headshot)
  end
end

-- PreHook
Hooks:PreHook(SentryGunDamage, "damage_bullet", "hitmark_sentrygundamage_bullet", PreHook)
Hooks:PreHook(SentryGunDamage, "damage_fire", "hitmark_sentrygundamage_fire", PreHook)
Hooks:PreHook(SentryGunDamage, "damage_explosion", "hitmark_sentrygundamage_explosion", PreHook)

-- PostHook
Hooks:PostHook(SentryGunDamage, "damage_bullet", "hitmark_sentrygundamage_bullet", PostHook)
Hooks:PostHook(SentryGunDamage, "damage_fire", "hitmark_sentrygundamage_fire", PostHook)
Hooks:PostHook(SentryGunDamage, "damage_explosion", "hitmark_sentrygundamage_explosion", PostHook)
