local head = Idstring("head"):key()
local hit_head = Idstring("hit_Head"):key()
local rag_head = Idstring("rag_Head"):key()

local function PreHook()
  HitMark.hooked = true
  HitMark.critshot = false
  HitMark.direct_hit = false
end

local function PostHook(self, attack_data)
  if not attack_data.attacker_unit
    or attack_data.attacker_unit
    and attack_data.attacker_unit ~= managers.player:player_unit() then
    return
  end

  if HitMark.direct_hit then
    local death = attack_data.result.type == "death"
    local body = attack_data.body_name or attack_data.col_ray.body:name()
    local body_key = body:key()
    local headshot = false

    if body_key then
      if body_key == head
        or body_key == hit_head
        or body_key == rag_head then
        headshot = true
      end
    end

    managers.hud:on_damage_confirmed(death, headshot)
  end
end

-- PreHook
Hooks:PreHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_fire", "hitmark_copdamage_fire_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_tase", "hitmark_copdamage_tase_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_melee", "hitmark_copdamage_melee_pre", PreHook)

-- PostHook
Hooks:PostHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet", function(self, attack_data)
  HitMark.hooked = false

  if self._dead or self._invulnerable then return end
  if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then return end

  PostHook(self, attack_data)
end)
Hooks:PostHook(CopDamage, "damage_fire", "hitmark_copdamage_fire", function(self, attack_data)
  HitMark.hooked = false

  if self._dead then return end

  PostHook(self, attack_data)
end)
Hooks:PostHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion", function(self, attack_data)
  HitMark.hooked = false

  if self._dead or self._invulnerable then return end

  PostHook(self, attack_data)
end)
Hooks:PostHook(CopDamage, "damage_tase", "hitmark_copdamage_tase", function(self, attack_data)
  HitMark.hooked = false

  if self._dead or self._invulnerable then return end
  if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then return end

  PostHook(self, attack_data)
end)
Hooks:PostHook(CopDamage, "damage_melee", "hitmark_copdamage_melee", function(self, attack_data)
  HitMark.hooked = false

  if self._dead or self._invulnerable then return end
  if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then return end

  PostHook(self, attack_data)
end)
