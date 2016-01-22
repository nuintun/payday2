_G.teamExt = _G.teamExt or {}

teammateExtended.ModPath = ModPath

if RequiredScript then
  local hook_files = {
    ["lib/managers/hudmanagerpd2"] = "lib/hudmanagerpd2.lua",
    ["lib/managers/hudmanager"] = "lib/hudmanager.lua",
    ["lib/managers/hud/hudhitconfirm"] = "lib/hudhitconfirm.lua",
    ["lib/managers/hud/hudinteraction"] = "lib/hudinteraction.lua",
    ["lib/managers/hud/hudmissionbriefing"] = "lib/hudmissionbriefing.lua",
    ["lib/managers/hud/hudsuspicion"] = "lib/hudsuspicion.lua",
    ["lib/managers/hud/hudteammate"] = "lib/hudteammate.lua",
    ["lib/units/beings/player/huskplayermovement"] = "lib/huskplayermovement.lua",
    ["lib/managers/menu/contractboxgui"] = "lib/contractboxgui.lua",
    ["lib/units/enemies/cop/copdamage"] = "lib/copdamage.lua",
    ["lib/managers/menu/missionbriefinggui"] = "lib/missionbriefinggui.lua",
    ["lib/units/beings/player/playerdamage"] = "lib/playerdamage.lua",
    ["lib/units/beings/player/playermovement"] = "lib/playermovement.lua",
    ["lib/units/beings/player/states/playerstandard"] = "lib/playerstandard.lua",
    ["lib/managers/statisticsmanager"] = "lib/statisticsmanager.lua",
    ["lib/units/props/timergui"] = "lib/timergui.lua",
    ["lib/network/handlers/unitnetworkhandler"] = "lib/unitnetworkhandler.lua"
  }
  local requiredScript = RequiredScript:lower()

  if hook_files[requiredScript] then
    dofile(teamExt.ModPath .. hook_files[requiredScript])
  end
end
