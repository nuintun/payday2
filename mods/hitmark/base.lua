--- 模组命名空间
_G.HitMark = _G.HitMark or {}

--- 模组路径
HitMark.ModPath = ModPath

--- 配置
-- @field hit_texture 击中标识图标
-- @field crit_texture 击杀标识图标
-- @field hit 普通伤害颜色
-- @field crit 暴击伤害颜色
-- @field headshot 爆头伤害颜色
-- @field blend_mode 颜色混合模式
HitMark.settings = {
  hit_texture = "guis/textures/pd2/hitconfirm",
  crit_texture = "guis/textures/pd2/hitconfirm_crit",
  hit = "ff0000",
  crit = "ffff00",
  headshot = "00ff00",
  blend_mode = "normal"
}

--- 添加钩子文件
if RequiredScript then
  local hook_files = {
    ["lib/units/enemies/cop/copdamage"] = "lib/copdamage.lua",
    ["lib/managers/hud/hudhitconfirm"] = "lib/hudhitconfirm.lua",
    ["lib/managers/hudmanagerpd2"] = "lib/hudmanagerpd2.lua"
  }
  local requiredScript = RequiredScript:lower()

  if hook_files[requiredScript] then
    dofile(HitMark.ModPath .. hook_files[requiredScript])
  end
end
