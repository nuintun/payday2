_G.HitMark = _G.HitMark or {}

HitMark.ModPath = ModPath

HitMark.settings = {
  hit_texture = "guis/textures/pd2/hitconfirm.texture",
  crit_texture = "guis/textures/pd2/hitconfirm_crit.texture",
  headshot_texture = "guis/textures/pd2/hitconfirm_headshot.texture"
}

function HitMark:InitSettings()
  self.settings.hit = "ff0000"
  self.settings.crit = "ff0000"
  self.settings.headshot = "ff0000"
  self.settings.hit_kill = "00ff00"
  self.settings.crit_kill = "00ff00"
  self.settings.headshot_kill = "00ff00"

  self.settings.blend_mode = "normal"
end

function HitMark:Load()
  self:InitSettings()
end

if RequiredScript then
  local hook_files = {
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


