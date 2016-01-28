_G.KillCounter = _G.KillCounter or {}

KillCounter.ModPath = ModPath

KillCounter.width = 100
KillCounter.height = 20
KillCounter.blend_mode = 'normal'
KillCounter.color = 'ffff00'

if RequiredScript then
  local hook_files = {
    ["lib/managers/hudmanagerpd2"] = "lib/hudmanagerpd2.lua",
    ["lib/managers/hud/hudteammate"] = "lib/hudteammate.lua",
    ["lib/managers/statisticsmanager"] = "lib/statisticsmanager.lua"
  }
  local requiredScript = RequiredScript:lower()

  if hook_files[requiredScript] then
    dofile(KillCounter.ModPath .. hook_files[requiredScript])
  end
end
