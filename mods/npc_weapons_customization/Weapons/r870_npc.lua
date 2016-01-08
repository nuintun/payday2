log("r870_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_R870_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["r870_none"] = "None",
    --Barrels
    ["r870_g_barrel_long"] = "Long",
    ["r870_g_barrel_short"] = "Short",
    --Barrel Extensions
    ["r870_g_ns_shark"] = "Shark",
    ["r870_g_ns_thick"] = "Thick",
    ["r870_g_ns_king"] = "THE King",
    --Body
    ["r870_g_body_standard"] = "Standard",
    ["r870_g_body_big_rail"] = "Big Rail",
    ["r870_g_body_rail_single"] = "Single Rail",
    ["r870_g_body_shellrack"] = "Shellrack",
    --Foregrips
    ["r870_g_fg_bigpump"] = "Big Pump",
    ["r870_g_fg_railedpump"] = "Railed Pump",
    ["r870_g_fg_smallpump"] = "Small Pump",
    ["r870_g_fg_wood"] = "Wooden PIMP",
    --Grips
    ["r870_g_grip_hgrip"] = "H-Grip",
    ["r870_g_grip_mgrip"] = "M-Grip",
    ["r870_g_grip_m4_ergo"] = "Ergo",
    ["r870_g_grip_m4_sniper"] = "Sniper",
    ["r870_g_grip_m4_standard"] = "Standard",
    --Magazines
    ["r870_g_mag_extension_tube"] = "Extended",
    --Optics
    ["r870_g_optics_aimpoint"] = "Aimpoint",
    ["r870_g_optics_docter"] = "Docter",
    ["r870_g_optics_eotech"] = "EOtech",
    ["r870_g_optics_specter"] = "Specter",
    ["r870_g_optics_t1micro"] = "t1micro",
    ["r870_g_optics_cmore"] = "cmore",
    ["r870_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["r870_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["r870_g_optics_reflex"] = "Reflex",
    ["r870_g_optics_rx01"] = "RX01",
    ["r870_g_optics_rx30"] = "RX30",
    ["r870_g_optics_cs"] = "Aimpoint CS",
    ["r870_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["r870_g_stock_solid"] = "Solid",
    ["r870_g_stock_folding"] = "Folding",
    ["r870_g_stock_m4_adapter"] = "M4 Adapter",
    ["r870_g_stock_nostock"] = "No Stock",
    ["r870_g_stock_m4_crane"] = "M4 Crane",
    ["r870_g_stock_m4_mk46"] = "M4 MK46",
    ["r870_g_stock_m4_pts"] = "M4 PTS",
    ["r870_g_stock_m4_standard"] = "M4 Standard",
    ["r870_g_stock_m4_ubr"] = "M4 UBR",
    --Attachments
    ["r870_g_attachment_rail"] = "Attachment Rail",
    ["r870_g_attachment_peqbox"] = "Laser Module",
    ["r870_g_attachment_surefire"] = "Flashlight",
    ["r870_g_attachment_laser"] = "Laser Module 2",
    ["r870_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.r870_npc = NPCWeap.weapons.r870_npc or {}
NPCWeap.weapons.r870_npc.required_reset = NPCWeap.weapons.r870_npc.required_reset or {}
NPCWeap.weapons.r870_npc.name_id = "r870_npc"
NPCWeap.weapons.r870_npc.display_name = "Remington 870"
NPCWeap.weapons.r870_npc.unit = "units/payday2/weapons/wpn_npc_r870/wpn_npc_r870"
NPCWeap.weapons.r870_npc.object_sub = 6
NPCWeap.weapons.r870_npc.spooci = {}
NPCWeap.loaded_options.r870_npc = NPCWeap.loaded_options.r870_npc or {}

NPCWeap.weapons.r870_npc.objects_init = {
  "g_barrel_long",
  "g_body_standard",
  "g_fg_bigpump",
  "g_grip_hgrip",
  "g_stock_solid",
  "g_attachment_rail",
  "g_attachment_surefire"
}

NPCWeap.weapons.r870_npc.categories = {
  "barrel",
  "barrel_ext",
  "magazine",
  "rail",
  "upper_reciever",
  "sight",
  "stock",
  "foregrip",
  "grip",
  "attachment",
}

NPCWeap.weapons.r870_npc.barrel = {
  [1] = "r870_g_barrel_long",
  [2] = "r870_g_barrel_short",
  [3] = "random",
}
NPCWeap.loaded_options.r870_npc.barrel = NPCWeap.loaded_options.r870_npc.barrel or 1
NPCWeap.weapons.r870_npc.required_reset.barrel = {}
NPCWeap.weapons.r870_npc.g_barrel_short = {}
NPCWeap.weapons.r870_npc.g_barrel_short.attachment = Vector3(0, -8.00924, 0)
NPCWeap.weapons.r870_npc.g_barrel_short.magazine = Vector3(0, -33.25088, 0)
NPCWeap.weapons.r870_npc.g_barrel_short.barrel_ext = Vector3(0, -33.25088, 0)
NPCWeap.weapons.r870_npc.g_barrel_long = {}
NPCWeap.weapons.r870_npc.g_barrel_long.attachment = Vector3(0, 0, 0)
NPCWeap.weapons.r870_npc.g_barrel_long.magazine = Vector3(0, 0, 0)
NPCWeap.weapons.r870_npc.g_barrel_long.barrel_ext = Vector3(0, 0, 0)

NPCWeap.weapons.r870_npc.barrel_ext = {
  [1] = "r870_none",
  [2] = "r870_g_ns_shark",
  [3] = "r870_g_ns_thick",
  [4] = "r870_g_ns_king",
  [5] = "random",
}
NPCWeap.loaded_options.r870_npc.barrel_ext = NPCWeap.loaded_options.r870_npc.barrel_ext or 1
NPCWeap.weapons.r870_npc.required_reset.barrel_ext = {
  "g_ns_spooci1"
}
NPCWeap.weapons.r870_npc.g_ns_shark = {}
NPCWeap.weapons.r870_npc.g_ns_shark.length = Vector3(0, 6.7632, 0)
NPCWeap.weapons.r870_npc.g_ns_thick = {}
NPCWeap.weapons.r870_npc.g_ns_thick.length = Vector3(0, 17.40295, 0)
NPCWeap.weapons.r870_npc.g_ns_king = {}
NPCWeap.weapons.r870_npc.g_ns_king.length = Vector3(0, 7.6996, 0)

NPCWeap.weapons.r870_npc.spooci.barrel_ext = {
  [0.5] = { "r870_g_ns_spooci1" },
}

NPCWeap.weapons.r870_npc.magazine = {
  [1] = "r870_none",
  [2] = "r870_g_mag_extension_tube",
  [3] = "random",
}
NPCWeap.loaded_options.r870_npc.magazine = NPCWeap.loaded_options.r870_npc.magazine or 1
NPCWeap.weapons.r870_npc.required_reset.magazine = {}

NPCWeap.weapons.r870_npc.rail = {
  [1] = "r870_none",
  [2] = "r870_g_body_big_rail",
  [3] = "r870_g_body_rail_single",
  [4] = "random",
}
NPCWeap.loaded_options.r870_npc.rail = NPCWeap.loaded_options.r870_npc.rail or 1
NPCWeap.weapons.r870_npc.required_reset.rail = {}

NPCWeap.weapons.r870_npc.upper_reciever = {
  [1] = "r870_none",
  [2] = "r870_g_body_shellrack",
  [3] = "random",
}
NPCWeap.loaded_options.r870_npc.upper_reciever = NPCWeap.loaded_options.r870_npc.upper_reciever or 1
NPCWeap.weapons.r870_npc.required_reset.upper_reciever = {
  "g_body_shellrack_slug",
  "g_body_shellrack_slug1",
  "g_body_shellrack_slug2",
  "g_body_shellrack_slug3",
  "g_body_shellrack_slug4"
}

NPCWeap.weapons.r870_npc.sight = {
  [1] = "r870_none",
  [2] = "r870_g_optics_aimpoint",
  [3] = "r870_g_optics_docter",
  [4] = "r870_g_optics_eotech",
  [5] = "r870_g_optics_specter",
  [6] = "r870_g_optics_t1micro",
  [7] = "r870_g_optics_cmore",
  [8] = "r870_g_optics_aimpoint_preorder",
  [9] = "r870_g_optics_eotech_xps",
  [10] = "r870_g_optics_reflex",
  [11] = "r870_g_optics_rx01",
  [12] = "r870_g_optics_rx30",
  [13] = "r870_g_optics_cs",
  [14] = "r870_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.r870_npc.sight = NPCWeap.loaded_options.r870_npc.sight or 1
NPCWeap.weapons.r870_npc.required_reset.sight = {
  "g_optics_eotech_gfx_lens",
  "g_optics_acog_lens",
  "g_optics_aimpoint_glass",
  "g_optics_aimpoint_preorder_glass",
  "g_optics_cmore_lens",
  "g_optics_cs_lens",
  "g_optics_docter_lens",
  "g_optics_eotech_xps_lens",
  "g_optics_reflex_lens",
  "g_optics_rx01_lens",
  "g_optics_rx30_lens",
  "g_optics_specter_glass",
  "g_optics_t1micro_glass",
  "g_optics_adapter",
}

NPCWeap.weapons.r870_npc.stock = {
  [1] = "r870_g_stock_solid",
  [2] = "r870_g_stock_folding",
  [3] = "r870_g_stock_m4_crane",
  [4] = "r870_g_stock_m4_mk46",
  [5] = "r870_g_stock_m4_pts",
  [6] = "r870_g_stock_m4_standard",
  [7] = "r870_g_stock_m4_ubr",
  [8] = "r870_g_stock_nostock",
  [9] = "random",
}
NPCWeap.loaded_options.r870_npc.stock = NPCWeap.loaded_options.r870_npc.stock or 1
NPCWeap.weapons.r870_npc.required_reset.stock = {
  "g_stock_m4_adapter",
}

NPCWeap.weapons.r870_npc.foregrip = {
  [1] = "r870_g_fg_bigpump",
  [2] = "r870_g_fg_railedpump",
  [3] = "r870_g_fg_smallpump",
  [4] = "r870_g_fg_wood",
  [5] = "random",
}
NPCWeap.loaded_options.r870_npc.foregrip = NPCWeap.loaded_options.r870_npc.foregrip or 1
NPCWeap.weapons.r870_npc.required_reset.foregrip = {}

NPCWeap.weapons.r870_npc.grip = {
  [1] = "r870_g_grip_hgrip",
  [2] = "r870_g_grip_mgrip",
  [3] = "r870_g_grip_m4_ergo",
  [4] = "r870_g_grip_m4_sniper",
  [5] = "r870_g_grip_m4_standard",
  [6] = "random",
}
NPCWeap.loaded_options.r870_npc.grip = NPCWeap.loaded_options.r870_npc.grip or 1
NPCWeap.weapons.r870_npc.required_reset.grip = {}

NPCWeap.weapons.r870_npc.attachment = {
  [1] = "r870_none",
  [2] = "r870_g_attachment_surefire",
  [3] = "r870_g_attachment_laser",
  [4] = "r870_g_attachment_peq",
  [5] = "r870_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.r870_npc.attachment = NPCWeap.loaded_options.r870_npc.attachment or 1
NPCWeap.weapons.r870_npc.required_reset.attachment = {
  "g_attachment_rail"
}

NPCWeap.weapons.r870_npc.required = {
  ["g_body_shellrack"] = { "g_body_shellrack_slug", "g_body_shellrack_slug1", "g_body_shellrack_slug2", "g_body_shellrack_slug3", "g_body_shellrack_slug4" },
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_optics_adapter" },
  ["g_optics_acog"] = { "g_optics_acog_lens", "g_optics_adapter" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_optics_adapter" },
  ["g_optics_docter"] = { "g_optics_docter_lens", "g_optics_adapter" },
  ["g_optics_specter"] = { "g_optics_specter_glass", "g_optics_adapter" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_optics_adapter" },
  ["g_optics_cmore"] = { "g_optics_cmore_lens", "g_optics_adapter" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_optics_adapter" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens", "g_optics_adapter" },
  ["g_optics_reflex"] = { "g_optics_reflex_lens", "g_optics_adapter" },
  ["g_optics_rx01"] = { "g_optics_rx01_lens", "g_optics_adapter" },
  ["g_optics_rx30"] = { "g_optics_rx30_lens", "g_optics_adapter" },
  ["g_optics_cs"] = { "g_optics_cs_lens", "g_optics_adapter" },
  ["g_stock_m4_crane"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_mk46"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_pts"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_standard"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_ubr"] = { "g_stock_m4_adapter" },
  ["g_attachment_surefire"] = { "g_attachment_rail" },
  ["g_attachment_laser"] = { "g_attachment_rail" },
  ["g_attachment_peq"] = { "g_attachment_rail" },
  ["g_attachment_peqbox"] = { "g_attachment_rail" },
}

NPCWeap.weapons.r870_npc.absolute_reset_on_update = {
  ["barrel_ext"] = { "g_ns_spooci1" },
}

NPCWeap.weapons.r870_npc.incompatible = {
  ["r870_g_optics_eotech"] = { "r870_g_stock_folding" },
  ["r870_g_optics_acog"] = { "r870_g_stock_folding" },
  ["r870_g_optics_aimpoint"] = { "r870_g_stock_folding" },
  ["r870_g_optics_docter"] = { "r870_g_stock_folding" },
  ["r870_g_optics_specter"] = { "r870_g_stock_folding" },
  ["r870_g_optics_t1micro"] = { "r870_g_stock_folding" },
  ["r870_g_optics_cmore"] = { "r870_g_stock_folding" },
  ["r870_g_optics_aimpoint_preorder"] = { "r870_g_stock_folding" },
  ["r870_g_optics_eotech_xps"] = { "r870_g_stock_folding" },
  ["r870_g_optics_reflex"] = { "r870_g_stock_folding" },
  ["r870_g_optics_rx01"] = { "r870_g_stock_folding" },
  ["r870_g_optics_rx30"] = { "r870_g_stock_folding" },
  ["r870_g_optics_cs"] = { "r870_g_stock_folding" },
  ["r870_g_stock_folding"] = { "r870_g_optics_eotech", "r870_g_optics_acog", "r870_g_optics_aimpoint", "r870_g_optics_docter", "r870_g_optics_specter", "r870_g_optics_t1micro", "r870_g_optics_cmore", "r870_g_optics_aimpoint_preorder", "r870_g_optics_eotech_xps", "r870_g_optics_reflex", "r870_g_optics_rx01", "r870_g_optics_rx30", "r870_g_optics_cs" },
  ["r870_g_barrel_short"] = { "r870_g_body_big_rail", "r870_g_fg_wood", "r870_g_fg_bigpump" },
  ["r870_g_body_big_rail"] = { "r870_g_barrel_short" },
  ["r870_g_fg_wood"] = { "r870_g_barrel_short" },
  ["r870_g_fg_bigpump"] = { "r870_g_barrel_short" },
}

NPCWeap.weapons.r870_npc.pos_check = {
  ["attachment"] = { "barrel" },
  ["magazine"] = { "barrel" },
  ["barrel_ext"] = { "barrel" }
}
