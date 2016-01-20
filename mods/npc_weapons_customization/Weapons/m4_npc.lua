log("m4_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_M4_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["m4_none"] = "None",
    --Barrels
    ["m4_g_barrel_short"] = "Short",
    ["m4_g_barrel_medium"] = "Medium",
    ["m4_g_barrel_long"] = "Long",
    ["m4_g_barrel_sd"] = "Silencer",
    ["m4_g_barrel_beowulf"] = "Beowulf",
    --Barrel Extensions
    ["m4_g_ns_firepig"] = "Firepig",
    ["m4_g_ns_jprifles"] = "JP Rifles",
    ["m4_g_ns_linear"] = "Linear",
    ["m4_g_ns_medium"] = "Medium",
    ["m4_g_ns_silencer_large"] = "Silencer",
    ["m4_g_ns_small"] = "Small",
    ["m4_g_ns_stubby"] = "Stubby Bastard",
    ["m4_g_ns_surefire"] = "Sure, fire!",
    ["m4_g_ns_tank"] = "Tank",
    --Body
    ["m4_g_body_lower_reciever"] = "Standard",
    ["m4_g_body_reciever_bolt"] = "Standard Bolt",
    ["m4_g_body_upper_receiver_round"] = "Round",
    ["m4_g_body_upper_reciever_ballos"] = "Ballos",
    ["m4_g_body_upper_reciever_ballos_bolt"] = "Ballos Bolt",
    ["m4_g_body_lower_reciever_core"] = "Core",
    ["m4_g_body_upper_reciever_core"] = "Core",
    ["m4_g_body_upper_reciever_core_bolt"] = "Core Bolt",
    ["m4_g_body_upper_reciever_edge"] = "Edge",
    --Drag Handle
    ["m4_g_dh"] = "Standard",
    ["m4_g_dh_ballos"] = "Ballos",
    ["m4_g_dh_core"] = "Core",
    --Foregrips
    ["m4_g_fg_rail"] = "Rail",
    ["m4_g_fg_jp"] = "JP",
    ["m4_g_fg_lr300"] = "LR300",
    ["m4_g_fg_lvoa"] = "Lvoa",
    ["m4_g_fg_moe"] = "Moe",
    ["m4_g_fg_smr"] = "SMR",
    --Grips
    ["m4_g_grip_standard"] = "Standard",
    ["m4_g_grip_ergo"] = "Ergo",
    ["m4_g_grip_hgrip"] = "H-Grip",
    ["m4_g_grip_mgrip"] = "M-Grip",
    ["m4_g_grip_sniper"] = "Sniper",
    --Vertical Grips
    ["m4_g_vertical_grip"] = "Vertical",
    ["m4_g_vertical_grip_afg"] = "AFG",
    ["m4_g_vertical_grip_stubby"] = "Stubby",
    --Magazines
    ["m4_g_mag_straight"] = "Straight",
    ["m4_g_mag_standard"] = "Standard",
    ["m4_g_mag_drum"] = "Drum",
    ["m4_g_mag_emag"] = "E-Mag",
    ["m4_g_mag_l5"] = "L5",
    ["m4_g_mag_pmag"] = "P-Mag",
    ["m4_g_mag_quad"] = "Quad",
    --Optics
    ["m4_g_optics_aimpoint"] = "Aimpoint",
    ["m4_g_optics_docter"] = "Docter",
    ["m4_g_optics_eotech"] = "EOtech",
    ["m4_g_optics_flipup"] = "Rail",
    ["m4_g_optics_specter"] = "Specter",
    ["m4_g_optics_t1micro"] = "t1micro",
    ["m4_g_optics_cmore"] = "cmore",
    ["m4_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["m4_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["m4_g_optics_reflex"] = "Reflex",
    ["m4_g_optics_rx01"] = "RX01",
    ["m4_g_optics_rx30"] = "RX30",
    ["m4_optics_cs"] = "Aimpoint CS",
    ["m4_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["m4_g_stock_standard"] = "Standard",
    ["m4_g_stock_adapter"] = "Adapter",
    ["m4_g_stock_crane"] = "Crane",
    ["m4_g_stock_fold"] = "Folding",
    ["m4_g_stock_mk46"] = "MK46",
    ["m4_g_stock_pts"] = "PTS",
    ["m4_g_stock_ubr"] = "UBR",
    --Attachments
    ["m4_g_attachment_peqbox"] = "Laser Module",
    ["m4_g_attachment_surefire"] = "Flashlight",
    ["m4_g_attachment_laser"] = "Laser Module 2",
    ["m4_g_attachment_peq15"] = "PEQ15",
  })
end)

NPCWeap.weapons.m4_npc = NPCWeap.weapons.m4_npc or {}
NPCWeap.weapons.m4_npc.required_reset = NPCWeap.weapons.m4_npc.required_reset or {}
NPCWeap.weapons.m4_npc.name_id = "m4_npc"
NPCWeap.weapons.m4_npc.display_name = "M4"
NPCWeap.weapons.m4_npc.unit = "units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"
NPCWeap.weapons.m4_npc.object_sub = 4
NPCWeap.weapons.m4_npc.spooci = {}
NPCWeap.weapons.m4_npc.fire_post = nil;
NPCWeap.loaded_options.m4_npc = NPCWeap.loaded_options.m4_npc or {}

NPCWeap.weapons.m4_npc.objects_init = {
  "g_barrel_short",
  "g_body_lower_reciever",
  "g_body_reciever_bolt",
  "g_body_upper_receiver_round",
  "g_dh",
  "g_fg_rail",
  "g_grip_standard",
  "g_mag_straight",
  "g_optics_eotech",
  "g_optics_eotech_gfx_lens",
  "g_stock_standard",
  "g_stock_adapter"
}

NPCWeap.weapons.m4_npc.categories = {
  "barrel",
  "barrel_ext",
  "magazine",
  "upper_reciever",
  "lower_receiver",
  "drag_handle",
  "sight",
  "stock",
  "foregrip",
  "grip",
  "attachment",
  "vertical_grip",
}

NPCWeap.weapons.m4_npc.barrel = {
  [1] = "m4_g_barrel_short",
  [2] = "m4_g_barrel_medium",
  [3] = "m4_g_barrel_long",
  [4] = "m4_g_barrel_sd",
  [5] = "m4_g_barrel_beowulf",
  [6] = "random",
}
NPCWeap.loaded_options.m4_npc.barrel = NPCWeap.loaded_options.m4_npc.barrel or 1
NPCWeap.weapons.m4_npc.required_reset.barrel = {}
NPCWeap.weapons.m4_npc.barrel_fire_offset = Vector3(0, 0, 0)
NPCWeap.weapons.m4_npc.g_barrel_short = {}
NPCWeap.weapons.m4_npc.g_barrel_short.barrel_ext = Vector3(0, 0, 0) --[0 29.46348 -1.204023E-06]
NPCWeap.weapons.m4_npc.g_barrel_medium = {}
NPCWeap.weapons.m4_npc.g_barrel_medium.barrel_ext = Vector3(0, 8.16465, 0) -- [0 37.62813 -1.204023E-06]
NPCWeap.weapons.m4_npc.g_barrel_long = {}
NPCWeap.weapons.m4_npc.g_barrel_long.barrel_ext = Vector3(0, 20, 0) -- [0 49.46348 -1.204023E-06]
NPCWeap.weapons.m4_npc.g_barrel_sd = {}
NPCWeap.weapons.m4_npc.g_barrel_sd.barrel_ext = Vector3(0, 0.58987, 0) -- N/A
NPCWeap.weapons.m4_npc.g_barrel_beowulf = {}
NPCWeap.weapons.m4_npc.g_barrel_beowulf.barrel_ext = Vector3(0, 35.31399, 0) -- [0 64.77747 -1.204023E-06]

NPCWeap.weapons.m4_npc.barrel_ext = {
  [1] = "m4_none",
  [2] = "m4_g_ns_firepig",
  [3] = "m4_g_ns_jprifles",
  [4] = "m4_g_ns_linear",
  [5] = "m4_g_ns_medium",
  [6] = "m4_g_ns_silencer_large",
  [7] = "m4_g_ns_small",
  [8] = "m4_g_ns_stubby",
  [9] = "m4_g_ns_surefire",
  [10] = "m4_g_ns_tank",
  [11] = "random",
}
NPCWeap.loaded_options.m4_npc.barrel_ext = NPCWeap.loaded_options.m4_npc.barrel_ext or 1
NPCWeap.weapons.m4_npc.required_reset.barrel_ext = {
  "g_ns_spooci1"
}
NPCWeap.weapons.m4_npc.g_ns_firepig = {}
NPCWeap.weapons.m4_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.m4_npc.g_ns_jprifles = {}
NPCWeap.weapons.m4_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.m4_npc.g_ns_linear = {}
NPCWeap.weapons.m4_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.m4_npc.g_ns_medium = {}
NPCWeap.weapons.m4_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.m4_npc.g_ns_silencer_large = {}
NPCWeap.weapons.m4_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.m4_npc.g_ns_small = {}
NPCWeap.weapons.m4_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.m4_npc.g_ns_stubby = {}
NPCWeap.weapons.m4_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.m4_npc.g_ns_surefire = {}
NPCWeap.weapons.m4_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.m4_npc.g_ns_tank = {}
NPCWeap.weapons.m4_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.m4_npc.g_ns_pbs1 = {}
NPCWeap.weapons.m4_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)


NPCWeap.weapons.m4_npc.spooci.barrel_ext = {
  [0.5] = { "m4_g_ns_spooci1" },
}

NPCWeap.weapons.m4_npc.magazine = {
  [1] = "m4_g_mag_standard",
  [2] = "m4_g_mag_straight",
  [3] = "m4_g_mag_drum",
  [4] = "m4_g_mag_emag",
  [5] = "m4_g_mag_l5",
  [6] = "m4_g_mag_pmag",
  [7] = "m4_g_mag_quad",
  [8] = "random",
}
NPCWeap.loaded_options.m4_npc.magazine = NPCWeap.loaded_options.m4_npc.magazine or 1
NPCWeap.weapons.m4_npc.required_reset.magazine = {
  "g_mag_spooci1",
  "g_mag_spooci1_band",
  "g_mag_spooci1_bullets"
}
NPCWeap.weapons.m4_npc.spooci.magazine = {
  [1.0] = { "m4_g_mag_spooci1" },
}

NPCWeap.weapons.m4_npc.upper_reciever = {
  [1] = "m4_g_body_upper_receiver_round",
  [2] = "m4_g_body_upper_reciever_ballos",
  [3] = "m4_g_body_upper_reciever_core",
  [4] = "m4_g_body_upper_reciever_edge",
  [5] = "random",
}
NPCWeap.loaded_options.m4_npc.upper_reciever = NPCWeap.loaded_options.m4_npc.upper_reciever or 1
NPCWeap.weapons.m4_npc.required_reset.upper_reciever = {
  "g_body_reciever_bolt",
  "g_body_upper_reciever_ballos_bolt",
  "g_body_upper_reciever_core_bolt",
}

NPCWeap.weapons.m4_npc.lower_receiver = {
  [1] = "m4_g_body_lower_reciever",
  [2] = "m4_g_body_lower_reciever_core",
  [3] = "random",
}
NPCWeap.loaded_options.m4_npc.lower_receiver = NPCWeap.loaded_options.m4_npc.lower_receiver or 1
NPCWeap.weapons.m4_npc.required_reset.lower_receiver = {}

NPCWeap.weapons.m4_npc.drag_handle = {
  [1] = "m4_g_dh",
  [2] = "m4_g_dh_ballos",
  [3] = "m4_g_dh_core",
  [4] = "random",
}
NPCWeap.loaded_options.m4_npc.drag_handle = NPCWeap.loaded_options.m4_npc.drag_handle or 1
NPCWeap.weapons.m4_npc.required_reset.drag_handle = {}

NPCWeap.weapons.m4_npc.sight = {
  [1] = "m4_none",
  [2] = "m4_g_optics_flipup",
  [3] = "m4_g_optics_aimpoint",
  [4] = "m4_g_optics_docter",
  [5] = "m4_g_optics_eotech",
  [6] = "m4_g_optics_specter",
  [7] = "m4_g_optics_t1micro",
  [8] = "m4_g_optics_cmore",
  [9] = "m4_g_optics_aimpoint_preorder",
  [10] = "m4_g_optics_eotech_xps",
  [11] = "m4_g_optics_reflex",
  [12] = "m4_g_optics_rx01",
  [13] = "m4_g_optics_rx30",
  [14] = "m4_g_optics_cs",
  [15] = "m4_g_optics_acog",
  [16] = "random"
}
NPCWeap.loaded_options.m4_npc.sight = NPCWeap.loaded_options.m4_npc.sight or 1
NPCWeap.weapons.m4_npc.required_reset.sight = {
  "g_optics_eotech_gfx_lens",
  "g_optics_acog_lens",
  "g_optics_aimpoint_glass",
  "g_optics_docter_lens",
  "g_optics_specter_glass",
  "g_optics_t1micro_glass",
  "g_optics_cmore_lens",
  "g_optics_aimpoint_preorder_glass",
  "g_optics_eotech_xps_lens",
  "g_optics_reflex_lens",
  "g_optics_rx01_lens",
  "g_optics_rx30_lens",
  "g_optics_cs_lens"
}

NPCWeap.weapons.m4_npc.stock = {
  [1] = "m4_g_stock_standard",
  [2] = "m4_g_stock_crane",
  [3] = "m4_g_stock_fold",
  [4] = "m4_g_stock_mk46",
  [5] = "m4_g_stock_pts",
  [6] = "m4_g_stock_ubr",
  [7] = "random",
}
NPCWeap.loaded_options.m4_npc.stock = NPCWeap.loaded_options.m4_npc.stock or 1
NPCWeap.weapons.m4_npc.required_reset.stock = {
  "g_stock_adapter",
}

NPCWeap.weapons.m4_npc.foregrip = {
  [1] = "m4_g_fg_rail",
  [2] = "m4_g_fg_jp",
  [3] = "m4_g_fg_lr300",
  [4] = "m4_g_fg_lvoa",
  [5] = "m4_g_fg_moe",
  [6] = "m4_g_fg_smr",
  [7] = "random",
}
NPCWeap.loaded_options.m4_npc.foregrip = NPCWeap.loaded_options.m4_npc.foregrip or 1
NPCWeap.weapons.m4_npc.required_reset.foregrip = {}

NPCWeap.weapons.m4_npc.grip = {
  [1] = "m4_g_grip_standard",
  [2] = "m4_g_grip_ergo",
  [3] = "m4_g_grip_hgrip",
  [4] = "m4_g_grip_mgrip",
  [5] = "m4_g_grip_sniper",
  [6] = "random",
}
NPCWeap.loaded_options.m4_npc.grip = NPCWeap.loaded_options.m4_npc.grip or 1
NPCWeap.weapons.m4_npc.required_reset.grip = {}

NPCWeap.weapons.m4_npc.attachment = {
  [1] = "m4_none",
  [2] = "m4_g_attachment_peqbox",
  [3] = "m4_g_attachment_surefire",
  [4] = "m4_g_attachment_laser",
  [5] = "m4_g_attachment_peq15",
  [6] = "random",
}
NPCWeap.loaded_options.m4_npc.attachment = NPCWeap.loaded_options.m4_npc.attachment or 1
NPCWeap.weapons.m4_npc.required_reset.attachment = {}

NPCWeap.weapons.m4_npc.vertical_grip = {
  [1] = "m4_none",
  [2] = "m4_g_vertical_grip",
  [3] = "m4_g_vertical_grip_afg",
  [4] = "m4_g_vertical_grip_stubby",
  [5] = "random",
}
NPCWeap.loaded_options.m4_npc.vertical_grip = NPCWeap.loaded_options.m4_npc.vertical_grip or 1
NPCWeap.weapons.m4_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.m4_npc.required = {
  ["g_body_lower_reciever"] = { "g_body_reciever_bolt" },
  ["g_body_upper_receiver_round"] = { "g_body_reciever_bolt" },
  ["g_body_upper_reciever_ballos"] = { "g_body_upper_reciever_ballos_bolt" },
  ["g_body_upper_reciever_core"] = { "g_body_upper_reciever_core_bolt" },
  ["g_body_upper_reciever_edge"] = { "g_body_reciever_bolt" },
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens" },
  ["g_optics_acog"] = { "g_optics_acog_lens" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass" },
  ["g_optics_docter"] = { "g_optics_docter_lens" },
  ["g_optics_specter"] = { "g_optics_specter_glass" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass" },
  ["g_optics_cmore"] = { "g_optics_cmore_lens" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens" },
  ["g_optics_reflex"] = { "g_optics_reflex_lens" },
  ["g_optics_rx01"] = { "g_optics_rx01_lens" },
  ["g_optics_rx30"] = { "g_optics_rx30_lens" },
  ["g_optics_cs"] = { "g_optics_cs_lens" },
  ["g_stock_standard"] = { "g_stock_adapter" },
  ["g_stock_crane"] = { "g_stock_adapter" },
  ["g_stock_mk46"] = { "g_stock_adapter" },
  ["g_stock_pts"] = { "g_stock_adapter" },
  ["g_stock_ubr"] = { "g_stock_adapter" },
  ["g_mag_spooci1"] = { "g_mag_spooci1_band", "g_mag_spooci1_bullets" },
}

NPCWeap.weapons.m4_npc.absolute_reset_on_update = {
  ["barrel_ext"] = { "g_ns_spooci1" },
  ["magazine"] = { "g_mag_spooci1", "g_mag_spooci1_band", "g_mag_spooci1_bullets" },
}

NPCWeap.weapons.m4_npc.incompatible = {
  ["m4_g_barrel_sd"] = { "m4_g_ns_firepig", "m4_g_ns_jprifles", "m4_g_ns_linear", "m4_g_ns_medium", "m4_g_ns_silencer_large", "m4_g_ns_small", "m4_g_ns_stubby", "m4_g_ns_surefire", "m4_g_ns_tank" },
  ["m4_g_ns_firepig"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_jprifles"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_linear"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_medium"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_silencer_large"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_small"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_stubby"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_surefire"] = { "m4_g_barrel_sd" },
  ["m4_g_ns_tank"] = { "m4_g_barrel_sd" },
}

NPCWeap.weapons.m4_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
