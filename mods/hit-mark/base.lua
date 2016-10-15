--- 模组命名空间
_G.HitMark = _G.HitMark or {}

--- 模组路径
HitMark.ModPath = ModPath

--- 配置
-- @field width 击中标识图标宽度
-- @field height 击中标识图标高度
-- @field hit 普通伤害颜色
-- @field crit 暴击伤害颜色
-- @field headshot 爆头伤害颜色
-- @field kill 击杀伤害颜色
-- @field blend_mode 颜色混合模式
-- @field hit_texture 击中标识图标
-- @field crit_texture 暴击标识图标
-- @field headshot_texture 爆头标识图标
HitMark.settings = {
  width = 16,
  height = 16,
  hit = "ff6666",
  crit = "ffff00",
  headshot = "00ff00",
  kill = "ff00ff",
  blend_mode = "normal",
  hit_texture = "guis/textures/pd2/hitconfirm",
  crit_texture = "guis/textures/pd2/hitconfirm_crit",
  headshot_texture = "guis/textures/pd2/hitconfirm_headshot"
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
