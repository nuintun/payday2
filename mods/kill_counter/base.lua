_G.KillCounter = _G.KillCounter or {}

KillCounter.ModPath = ModPath

KillCounter.icon_color = 'ffff00'
KillCounter.text_color = 'ff0000'
KillCounter.blend_mode = 'normal'

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
