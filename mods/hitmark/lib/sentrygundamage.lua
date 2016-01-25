function SentryGunDamage:eh_damage_hub(attack_data, original_function)
  local was_dead = self._dead
  HitMark.direct_hit = false

  HitMark.hooked = true
  local result = original_function(self, attack_data)
  HitMark.hooked = false

  if HitMark.direct_hit then
    local hit_body_name = attack_data.col_ray.body and attack_data.col_ray.body:name()
    local headshot = hit_body_name and (hit_body_name == self._shield_body_name_ids or hit_body_name == self._bag_body_name_ids)
    local kill_confirmed = was_dead ~= self._dead
    managers.hud:on_damage_confirmed(kill_confirmed, headshot)
  end

  return result
end

local eh_original_sentrygundamage_damagebullet = SentryGunDamage.damage_bullet
function SentryGunDamage:damage_bullet(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_sentrygundamage_damagebullet)
end

local eh_original_sentrygundamage_damagefire = SentryGunDamage.damage_fire
function SentryGunDamage:damage_fire(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_sentrygundamage_damagefire)
end

local eh_original_sentrygundamage_damageexplosion = SentryGunDamage.damage_explosion
function SentryGunDamage:damage_explosion(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_sentrygundamage_damageexplosion)
end
