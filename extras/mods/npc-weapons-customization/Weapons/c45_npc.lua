log("c45_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_c45_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["c45_none"] = "None",
    --Barrels
    --	None, no modifications availiable
    --Barrel Extensions
    ["c45_g_ns_ipsccomp"] = "IPSC Complemenraty",
    ["c45_g_ns_meatgrinder"] = "Meatgrinder",
    ["c45_g_ns_flash"] = "Flash Hider",
    ["c45_g_ns_medium_slim"] = "The \"Medium Slim\"",
    ["c45_g_ns_medium_gem"] = "The GEM",
    ["c45_g_ns_large_kac"] = "Large KAC",
    ["c45_g_ns_small"] = "Small",
    ["c45_g_ns_medium"] = "Medium",
    ["c45_g_ns_large"] = "Large",
    --Body
    --	None, no modifications availiable
    --Grips
    ["c45_g_grip_gripforce"] = "Force",
    ["c45_g_grip_laser"] = "Laser",
    --Magazines
    --	None, no modifications availiable
    --Optics
    ["c45_g_optics_rmr"] = "RMR Scope",
    --Slides
    --	None, no modifications availiable
    --Attachments
    ["c45_g_attachment_x400w"] = "X400W",
    ["c45_g_attachment_crimson"] = "Crimson",
    ["c45_g_attachment_tlr1"] = "TLR1",
    ["c45_g_attachment_pistol_laser"] = "Pistol Laser",
  })
end)

NPCWeap.weapons.c45_npc = NPCWeap.weapons.c45_npc or {}
NPCWeap.weapons.c45_npc.required_reset = NPCWeap.weapons.c45_npc.required_reset or {}
NPCWeap.weapons.c45_npc.name_id = "c45_npc"
NPCWeap.weapons.c45_npc.display_name = "Chimano"
NPCWeap.weapons.c45_npc.unit = "units/payday2/weapons/wpn_npc_c45/wpn_npc_c45"
NPCWeap.weapons.c45_npc.object_sub = 5
NPCWeap.loaded_options.c45_npc = NPCWeap.loaded_options.c45_npc or {}

NPCWeap.weapons.c45_npc.objects_init = {
  "g_body_barrel",
  "g_body_frame",
  "g_mag",
  "g_slide",
  "g_attachment_tlr1"
}

NPCWeap.weapons.c45_npc.categories = {
  "barrel_ext",
  "sight",
  "grip",
  "attachment",
}

NPCWeap.weapons.c45_npc.barrel_ext = {
  [1] = "c45_none",
  [2] = "c45_g_ns_small",
  [3] = "c45_g_ns_medium",
  [4] = "c45_g_ns_large",
  [5] = "c45_g_ns_ipsccomp",
  [6] = "c45_g_ns_meatgrinder",
  [7] = "c45_g_ns_medium_slim",
  [8] = "c45_g_ns_medium_gem",
  [9] = "c45_g_ns_large_kac",
  [10] = "c45_g_ns_flash",
  [11] = "random",
}
NPCWeap.loaded_options.c45_npc.barrel_ext = NPCWeap.loaded_options.c45_npc.barrel_ext or 1
NPCWeap.weapons.c45_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.c45_npc.g_ns_small = {}
NPCWeap.weapons.c45_npc.g_ns_small.length = Vector3(0, 10.52681, 0)
NPCWeap.weapons.c45_npc.g_ns_medium = {}
NPCWeap.weapons.c45_npc.g_ns_medium.length = Vector3(0, 14.54988, 0)
NPCWeap.weapons.c45_npc.g_ns_large = {}
NPCWeap.weapons.c45_npc.g_ns_large.length = Vector3(0, 21.56491, 0)
NPCWeap.weapons.c45_npc.g_ns_ipsccomp = {}
NPCWeap.weapons.c45_npc.g_ns_ipsccomp.length = Vector3(0, 10.13249, 0)
NPCWeap.weapons.c45_npc.g_ns_meatgrinder = {}
NPCWeap.weapons.c45_npc.g_ns_meatgrinder.length = Vector3(0, 6.061, 0)
NPCWeap.weapons.c45_npc.g_ns_medium_slim = {}
NPCWeap.weapons.c45_npc.g_ns_medium_slim.length = Vector3(0, 16.88992, 0)
NPCWeap.weapons.c45_npc.g_ns_medium_gem = {}
NPCWeap.weapons.c45_npc.g_ns_medium_gem.length = Vector3(0, 16.77759, 0)
NPCWeap.weapons.c45_npc.g_ns_large_kac = {}
NPCWeap.weapons.c45_npc.g_ns_large_kac.length = Vector3(0, 20.65003, 0)
NPCWeap.weapons.c45_npc.g_ns_flash = {}
NPCWeap.weapons.c45_npc.g_ns_flash.length = Vector3(0, 4.87549, 0)

NPCWeap.weapons.c45_npc.sight = {
  [1] = "c45_none",
  [2] = "c45_g_optics_rmr",
  [3] = "random"
}
NPCWeap.loaded_options.c45_npc.sight = NPCWeap.loaded_options.c45_npc.sight or 1
NPCWeap.weapons.c45_npc.required_reset.sight = {
  "g_optics_rmr_gfx_lens",
}

NPCWeap.weapons.c45_npc.grip = {
  [1] = "c45_none",
  [2] = "c45_g_grip_gripforce",
  [3] = "c45_g_grip_laser",
  [4] = "random",
}
NPCWeap.loaded_options.c45_npc.grip = NPCWeap.loaded_options.c45_npc.grip or 1
NPCWeap.weapons.c45_npc.required_reset.grip = {}

NPCWeap.weapons.c45_npc.attachment = {
  [1] = "c45_none",
  [2] = "c45_g_attachment_pistol_laser",
  [3] = "c45_g_attachment_tlr1",
  [4] = "c45_g_attachment_crimson",
  [5] = "c45_g_attachment_x400w",
  [6] = "random",
}
NPCWeap.loaded_options.c45_npc.attachment = NPCWeap.loaded_options.c45_npc.attachment or 1
NPCWeap.weapons.c45_npc.required_reset.attachment = {}

NPCWeap.weapons.c45_npc.required = {
  ["g_optics_rmr"] = { "g_optics_rmr_gfx_lens" },
}

NPCWeap.weapons.c45_npc.incompatible = {}

NPCWeap.weapons.c45_npc.pos_check = {}
