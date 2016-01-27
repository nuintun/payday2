--- 爆头标识
local head = Idstring("head"):key()
local hit_head = Idstring("hit_Head"):key()
local rag_head = Idstring("rag_Head"):key()

--- 前置钩子函数
local function PreHook()
  HitMark.hooked = true
  HitMark.critshot = false
  HitMark.direct_hit = false
end

--- 后置钩子函数
-- @param self
-- @param attack_data
local function PostHook(self, attack_data)
  if HitMark.direct_hit then
    local death = attack_data.result.type == "death"
    local body = attack_data.body_name or attack_data.col_ray.body:name()
    local body_key = body and body:key()
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

--- 监听函数挂接前置钩子
Hooks:PreHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_fire", "hitmark_copdamage_fire_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_tase", "hitmark_copdamage_tase_pre", PreHook)
Hooks:PreHook(CopDamage, "damage_melee", "hitmark_copdamage_melee_pre", PreHook)

--- 监听函数挂接后置钩子
Hooks:PostHook(CopDamage, "damage_bullet", "hitmark_copdamage_bullet", PostHook)
Hooks:PostHook(CopDamage, "damage_fire", "hitmark_copdamage_fire", PostHook)
Hooks:PostHook(CopDamage, "damage_explosion", "hitmark_copdamage_explosion", PostHook)
Hooks:PostHook(CopDamage, "damage_tase", "hitmark_copdamage_tase", PostHook)
Hooks:PostHook(CopDamage, "damage_melee", "hitmark_copdamage_melee", PostHook)
