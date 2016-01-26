_G.HitMark = _G.HitMark or {}

HitMark.ModPath = ModPath

HitMark.settings = {
  hit_texture = "guis/textures/pd2/hitconfirm",
  crit_texture = "guis/textures/pd2/hitconfirm_crit",
  headshot_texture = "guis/textures/pd2/hitconfirm_headshot",
  hit = "ff0000",
  crit = "ff0000",
  headshot = "ff0000",
  hit_kill = "00ff00",
  crit_kill = "00ff00",
  headshot_kill = "00ff00",
  blend_mode = "normal"
}

function HitMark:custom_texture_loaded()
  --TODO custom texture loaded
end

function HitMark:load()
  TextureCache:request(HitMark.settings.headshot_texture, "NORMAL", callback(self, self, "custom_texture_loaded"), 100)
end

HitMark:load()

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
