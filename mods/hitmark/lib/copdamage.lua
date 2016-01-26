-- PreHook Callback
local function PreHook()
  HitMark.hooked = true
  HitMark.critshot = false
  HitMark.direct_hit = false
end

-- PostHook Callback
-- noinspection UnusedDef
local function PostHook(self, attack_data)
  if HitMark.direct_hit then
    local headshot = false
    local kill_confirmed = attack_data.result.type == "death"
    local body = attack_data.body_name or attack_data.col_ray.body:name()
    local body_key = body:key()

    if body_key then
      if body_key == Idstring("head"):key()
        or body_key == Idstring("hit_Head"):key()
        or body_key == Idstring("rag_Head"):key()
      then
        headshot = true
      end
    end

    managers.hud:on_damage_confirmed(kill_confirmed, headshot)
  end

  HitMark.hooked = false
end

-- PreHook
Hooks:PreHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_fire", "hitmark_copdamage_fire_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_tase", "hitmark_copdamage_tase_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_melee", "hitmark_copdamage_melee_pre", PreHook)
Hooks:PreHook(CopDamage, "sync_damage_explosion", "hitmark_copdamage_sync_explosion_pre", PreHook)

-- PostHook
Hooks:PostHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_fire", "hitmark_copdamage_fire", PostHook)
Hooks:PostHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion", PostHook)
Hooks:PostHook(CopDamage, "damage_tase", "hitmark_copdamage_tase", PostHook)
Hooks:PostHook(CopDamage, "damage_melee", "hitmark_copdamage_melee", PostHook)
Hooks:PostHook(CopDamage, "sync_damage_explosion", "hitmark_copdamage_sync_explosion", PostHook)
