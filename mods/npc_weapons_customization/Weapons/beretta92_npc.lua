log("beretta92_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_beretta92_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["beretta92_none"] = "None",
    --Barrels
    ["beretta92_none_barrel"] = "None",
    ["beretta92_g_barrel_co1"] = "CO1",
    ["beretta92_g_barrel_co2"] = "CO2",
    --Barrel Extensions
    ["beretta92_g_ns_ipsccomp"] = "IPSC Complemenraty",
    ["beretta92_g_ns_meatgrinder"] = "Meatgrinder",
    ["beretta92_g_ns_flash"] = "Flash Hider",
    ["beretta92_g_ns_medium_slim"] = "The \"Medium Slim\"",
    ["beretta92_g_ns_medium_gem"] = "The GEM",
    ["beretta92_g_ns_large_kac"] = "Large KAC",
    ["beretta92_g_ns_small"] = "Small",
    ["beretta92_g_ns_medium"] = "Medium",
    ["beretta92_g_ns_large"] = "Large",
    --Body
    ["beretta92_g_body_hammer"] = "Trigger Hammer",
    ["beretta92_g_body_rail"] = "Attachment Rail",
    ["beretta92_g_body_beretta"] = "Standard Body",
    --Grips
    ["beretta92_g_grip_std"] = "Standard",
    ["beretta92_g_grip_ergo"] = "ERGO",
    --Magazines
    ["beretta92_g_mag_std"] = "Standard",
    ["beretta92_g_mag_extended"] = "Extended",
    --Optics
    ["beretta92_g_optics_rmr"] = "RMR Scope",
    ["beretta92_g_optics_marksmansight_rear"] = "Marksman sight",
    ["beretta92_g_optics_ironsight"] = "Ironsight",
    --Slides
    ["beretta92_g_slide_std"] = "Standard",
    ["beretta92_g_slide_brigadier"] = "Brigadier",
    --Attachments
    ["beretta92_g_attachment_x400w"] = "X400W",
    ["beretta92_g_attachment_crimson"] = "Crimson",
    ["beretta92_g_attachment_tlr1"] = "TLR1",
    ["beretta92_g_attachment_pistol_laser"] = "Pistol Laser",
  })
end)

NPCWeap.weapons.beretta92_npc = NPCWeap.weapons.beretta92_npc or {}
NPCWeap.weapons.beretta92_npc.required_reset = NPCWeap.weapons.beretta92_npc.required_reset or {}
NPCWeap.weapons.beretta92_npc.name_id = "beretta92_npc"
NPCWeap.weapons.beretta92_npc.display_name = "Beretta 92"
NPCWeap.weapons.beretta92_npc.unit = "units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92"
NPCWeap.weapons.beretta92_npc.object_sub = 11
NPCWeap.loaded_options.beretta92_npc = NPCWeap.loaded_options.beretta92_npc or {}

NPCWeap.weapons.beretta92_npc.objects_init = {
  "g_barrel_standard",
  "g_body_beretta",
  "g_body_hammer",
  "g_body_rail",
  "g_grip_std",
  "g_mag_std",
  "g_optics_ironsight",
  "g_slide_std",
  "g_attachment_tlr1"
}

NPCWeap.weapons.beretta92_npc.categories = {
  "slide",
  "barrel",
  "barrel_ext",
  "magazine",
  "sight",
  "grip",
  "attachment",
}

NPCWeap.weapons.beretta92_npc.slide = {
  [1] = "beretta92_g_slide_std",
  [2] = "beretta92_g_slide_brigadier",
  [3] = "random",
}
NPCWeap.loaded_options.beretta92_npc.slide = NPCWeap.loaded_options.beretta92_npc.slide or 1
NPCWeap.weapons.beretta92_npc.required_reset.slide = {}

NPCWeap.weapons.beretta92_npc.barrel = {
  [1] = "beretta92_none_barrel",
  [2] = "beretta92_g_barrel_co1",
  [3] = "beretta92_g_barrel_co2",
  [4] = "random",
}
NPCWeap.loaded_options.beretta92_npc.barrel = NPCWeap.loaded_options.beretta92_npc.barrel or 1
NPCWeap.weapons.beretta92_npc.required_reset.barrel = {}
NPCWeap.weapons.beretta92_npc.none_barrel = {}
NPCWeap.weapons.beretta92_npc.none_barrel.barrel_ext = Vector3(0, 0, 0) -- [0 0 0]
NPCWeap.weapons.beretta92_npc.g_barrel_co1 = {}
NPCWeap.weapons.beretta92_npc.g_barrel_co1.barrel_ext = Vector3(0, 5.701938, 0) -- [0 5.701938 0]
NPCWeap.weapons.beretta92_npc.g_barrel_co2 = {}
NPCWeap.weapons.beretta92_npc.g_barrel_co2.barrel_ext = Vector3(0, 7.78167, 0) -- [0 7.78167 0]


NPCWeap.weapons.beretta92_npc.barrel_ext = {
  [1] = "beretta92_none",
  [2] = "beretta92_g_ns_small",
  [3] = "beretta92_g_ns_medium",
  [4] = "beretta92_g_ns_large",
  [5] = "beretta92_g_ns_ipsccomp",
  [6] = "beretta92_g_ns_meatgrinder",
  [7] = "beretta92_g_ns_medium_slim",
  [8] = "beretta92_g_ns_medium_gem",
  [9] = "beretta92_g_ns_large_kac",
  [10] = "beretta92_g_ns_flash",
  [11] = "random",
}
NPCWeap.loaded_options.beretta92_npc.barrel_ext = NPCWeap.loaded_options.beretta92_npc.barrel_ext or 1
NPCWeap.weapons.beretta92_npc.required_reset.barrel_ext = {}

NPCWeap.weapons.beretta92_npc.g_ns_small = {}
NPCWeap.weapons.beretta92_npc.g_ns_small.length = Vector3(0, 10.52681, 0)
NPCWeap.weapons.beretta92_npc.g_ns_medium = {}
NPCWeap.weapons.beretta92_npc.g_ns_medium.length = Vector3(0, 14.54988, 0)
NPCWeap.weapons.beretta92_npc.g_ns_large = {}
NPCWeap.weapons.beretta92_npc.g_ns_large.length = Vector3(0, 21.56491, 0)
NPCWeap.weapons.beretta92_npc.g_ns_ipsccomp = {}
NPCWeap.weapons.beretta92_npc.g_ns_ipsccomp.length = Vector3(0, 10.13249, 0)
NPCWeap.weapons.beretta92_npc.g_ns_meatgrinder = {}
NPCWeap.weapons.beretta92_npc.g_ns_meatgrinder.length = Vector3(0, 6.061, 0)
NPCWeap.weapons.beretta92_npc.g_ns_medium_slim = {}
NPCWeap.weapons.beretta92_npc.g_ns_medium_slim.length = Vector3(0, 16.88992, 0)
NPCWeap.weapons.beretta92_npc.g_ns_medium_gem = {}
NPCWeap.weapons.beretta92_npc.g_ns_medium_gem.length = Vector3(0, 16.77759, 0)
NPCWeap.weapons.beretta92_npc.g_ns_large_kac = {}
NPCWeap.weapons.beretta92_npc.g_ns_large_kac.length = Vector3(0, 20.65003, 0)
NPCWeap.weapons.beretta92_npc.g_ns_flash = {}
NPCWeap.weapons.beretta92_npc.g_ns_flash.length = Vector3(0, 4.87549, 0)

NPCWeap.weapons.beretta92_npc.magazine = {
  [1] = "beretta92_g_mag_std",
  [2] = "beretta92_g_mag_extended",
  [3] = "random",
}
NPCWeap.loaded_options.beretta92_npc.magazine = NPCWeap.loaded_options.beretta92_npc.magazine or 1
NPCWeap.weapons.beretta92_npc.required_reset.magazine = {}


NPCWeap.weapons.beretta92_npc.sight = {
  [1] = "beretta92_none",
  [2] = "beretta92_g_optics_ironsight",
  [3] = "beretta92_g_optics_marksmansight_rear",
  [4] = "beretta92_g_optics_rmr",
  [5] = "random"
}
NPCWeap.loaded_options.beretta92_npc.sight = NPCWeap.loaded_options.beretta92_npc.sight or 1
NPCWeap.weapons.beretta92_npc.required_reset.sight = {
  "g_optics_rmr_gfx_lens",
}

NPCWeap.weapons.beretta92_npc.grip = {
  [1] = "beretta92_g_grip_std",
  [2] = "beretta92_g_grip_ergo",
  [3] = "random",
}
NPCWeap.loaded_options.beretta92_npc.grip = NPCWeap.loaded_options.beretta92_npc.grip or 1
NPCWeap.weapons.beretta92_npc.required_reset.grip = {}

NPCWeap.weapons.beretta92_npc.attachment = {
  [1] = "beretta92_none",
  [2] = "beretta92_g_attachment_pistol_laser",
  [3] = "beretta92_g_attachment_tlr1",
  [4] = "beretta92_g_attachment_crimson",
  [5] = "beretta92_g_attachment_x400w",
  [6] = "random",
}
NPCWeap.loaded_options.beretta92_npc.attachment = NPCWeap.loaded_options.beretta92_npc.attachment or 1
NPCWeap.weapons.beretta92_npc.required_reset.attachment = {
  "g_body_rail"
}

NPCWeap.weapons.beretta92_npc.required = {
  ["g_optics_rmr"] = { "g_optics_rmr_gfx_lens" },
  ["g_attachment_x400w"] = { "g_body_rail" },
  ["g_attachment_crimson"] = { "g_body_rail" },
  ["g_attachment_tlr1"] = { "g_body_rail" },
  ["g_attachment_pistol_laser"] = { "g_body_rail" },
}

NPCWeap.weapons.beretta92_npc.incompatible = {}

NPCWeap.weapons.beretta92_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
