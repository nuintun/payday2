function CopDamage:eh_damage_hub(attack_data, original_function)
  EnhancedHitmarkers.direct_hit = false

  EnhancedHitmarkers.hooked = true
  local result = original_function(self, attack_data)
  EnhancedHitmarkers.hooked = false

  if EnhancedHitmarkers.direct_hit then
    local headshot = self._head_body_name and attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
    local kill_confirmed = attack_data.result.type == "death"
    managers.hud:on_damage_confirmed(kill_confirmed, headshot)
  end

  return result
end

local eh_original_copdamage_damagebullet = CopDamage.damage_bullet
function CopDamage:damage_bullet(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_copdamage_damagebullet)
end

local eh_original_copdamage_damagefire = CopDamage.damage_fire
function CopDamage:damage_fire(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_copdamage_damagefire)
end

local eh_original_copdamage_damageexplosion = CopDamage.damage_explosion
function CopDamage:damage_explosion(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_copdamage_damageexplosion)
end

local eh_original_copdamage_damagetase = CopDamage.damage_tase
function CopDamage:damage_tase(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_copdamage_damagetase)
end

local eh_original_copdamage_damagemelee = CopDamage.damage_melee
function CopDamage:damage_melee(attack_data)
  return self:eh_damage_hub(attack_data, eh_original_copdamage_damagemelee)
end
