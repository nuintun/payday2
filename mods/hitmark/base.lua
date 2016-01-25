_G.HitMark = _G.HitMark or {}

HitMark.ModPath = ModPath
HitMark.settings = {
  hit_texture = "guis/textures/pd2/hitmark.texture",
  kill_texture = "guis/textures/pd2/TdlQ.texture",
  head_texture = "guis/textures/pd2/headmark.texture"
}

if RequiredScript then
  local hook_files = {
    ["lib/managers/menumanager"] = "lib/menumanager.lua",
    ["lib/managers/hudmanagerpd2"] = "lib/hudmanagerpd2.lua",
    ["lib/managers/hud/hudhitconfirm"] = "lib/hudhitconfirm.lua",
    ["lib/units/enemies/cop/copdamage"] = "lib/copdamage.lua",
    ["lib/units/equipment/sentry_gun/sentrygundamage"] = "lib/sentrygundamage.lua"
  }
  local requiredScript = RequiredScript:lower()

  if hook_files[requiredScript] then
    dofile(HitMark.ModPath .. hook_files[requiredScript])
  end
end


