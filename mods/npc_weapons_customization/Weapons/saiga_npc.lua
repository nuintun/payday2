log("saiga_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_saiga_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["saiga_none"] = "None",
    --Barrels
    --	None, no modifications availiable
    --Barrel Extensions
    ["saiga_g_ns_shark"] = "Shark",
    ["saiga_g_ns_thick"] = "Thick",
    ["saiga_g_ns_king"] = "THE King",
    --Body
    --	None, no modifications availiable
    --Foregrips
    ["saiga_g_fg_std"] = "Standard",
    ["saiga_g_fg_rail"] = "Railed",
    --Grips
    ["saiga_g_grip_hgrip"] = "H-Grip",
    ["saiga_g_grip_pgrip"] = "P-Grip",
    ["saiga_g_grip_rk3"] = "RK3",
    ["saiga_g_grip_wgrip"] = "W-Grip",
    ["saiga_g_grip_std"] = "Standard",
    --Magazines
    ["saiga_g_mag_5rnd"] = "Standard",
    ["saiga_g_mag_drum"] = "Drum",
    --Optics
    ["saiga_g_optics_aimpoint"] = "Aimpoint",
    ["saiga_g_optics_docter"] = "Docter",
    ["saiga_g_optics_eotech"] = "EOtech",
    ["saiga_g_optics_specter"] = "Specter",
    ["saiga_g_optics_t1micro"] = "t1micro",
    ["saiga_g_optics_cmore"] = "cmore",
    ["saiga_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["saiga_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["saiga_g_optics_reflex"] = "Reflex",
    ["saiga_g_optics_rx01"] = "RX01",
    ["saiga_g_optics_rx30"] = "RX30",
    ["saiga_g_optics_cs"] = "Aimpoint CS",
    ["saiga_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["saiga_g_stock_solid"] = "Solid",
    ["saiga_g_stock_folding"] = "Folding",
    ["saiga_g_stock_skfoldable"] = "Foldable Skeletor",
    ["saiga_g_stock_adapter"] = "M4 Adapter",
    ["saiga_g_stock_nostock"] = "No Stock",
    ["saiga_g_stock_m4_crane"] = "M4 Crane",
    ["saiga_g_stock_m4_mk46"] = "M4 MK46",
    ["saiga_g_stock_m4_pts"] = "M4 PTS",
    ["saiga_g_stock_m4_std"] = "M4 Standard",
    ["saiga_g_stock_m4_ubr"] = "M4 UBR",
    --Attachments
    ["saiga_g_attachment_peqbox"] = "Laser Module",
    ["saiga_g_attachment_surefire"] = "Flashlight",
    ["saiga_g_attachment_laser"] = "Laser Module 2",
    ["saiga_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.saiga_npc = NPCWeap.weapons.saiga_npc or {}
NPCWeap.weapons.saiga_npc.required_reset = NPCWeap.weapons.saiga_npc.required_reset or {}
NPCWeap.weapons.saiga_npc.name_id = "saiga_npc"
NPCWeap.weapons.saiga_npc.display_name = "Saiga"
NPCWeap.weapons.saiga_npc.unit = "units/payday2/weapons/wpn_npc_saiga/wpn_npc_saiga"
NPCWeap.weapons.saiga_npc.object_sub = 7
NPCWeap.weapons.saiga_npc.spooci = {}
NPCWeap.loaded_options.saiga_npc = NPCWeap.loaded_options.saiga_npc or {}

NPCWeap.weapons.saiga_npc.objects_init = {
  "g_barrel",
  "g_body_bolt",
  "g_body_lowerreceiver",
  "g_body_upperreceiver",
  "g_fg_std",
  "g_grip_pgrip",
  "g_mag_5rnd",
  "g_stock_solid"
}

NPCWeap.weapons.saiga_npc.categories = {
  "barrel_ext",
  "magazine",
  "sight",
  "stock",
  "foregrip",
  "grip",
  "attachment",
}

NPCWeap.weapons.saiga_npc.barrel_ext = {
  [1] = "saiga_none",
  [2] = "saiga_g_ns_shark",
  [3] = "saiga_g_ns_thick",
  [4] = "saiga_g_ns_king",
  [5] = "random",
}
NPCWeap.loaded_options.saiga_npc.barrel_ext = NPCWeap.loaded_options.saiga_npc.barrel_ext or 1
NPCWeap.weapons.saiga_npc.required_reset.barrel_ext = {
  "g_ns_spooci1"
}
NPCWeap.weapons.saiga_npc.g_ns_shark = {}
NPCWeap.weapons.saiga_npc.g_ns_shark.length = Vector3(0, 6.7632, 0)
NPCWeap.weapons.saiga_npc.g_ns_thick = {}
NPCWeap.weapons.saiga_npc.g_ns_thick.length = Vector3(0, 17.40295, 0)
NPCWeap.weapons.saiga_npc.g_ns_king = {}
NPCWeap.weapons.saiga_npc.g_ns_king.length = Vector3(0, 7.6996, 0)

NPCWeap.weapons.saiga_npc.spooci.barrel_ext = {
  [0.5] = { "saiga_g_ns_spooci1" },
}

NPCWeap.weapons.saiga_npc.magazine = {
  [1] = "saiga_g_mag_5rnd",
  [2] = "saiga_g_mag_drum",
  [3] = "random",
}
NPCWeap.loaded_options.saiga_npc.magazine = NPCWeap.loaded_options.saiga_npc.magazine or 1
NPCWeap.weapons.saiga_npc.required_reset.magazine = {}

NPCWeap.weapons.saiga_npc.sight = {
  [1] = "saiga_none",
  [2] = "saiga_g_optics_aimpoint",
  [3] = "saiga_g_optics_docter",
  [4] = "saiga_g_optics_eotech",
  [5] = "saiga_g_optics_specter",
  [6] = "saiga_g_optics_t1micro",
  [7] = "saiga_g_optics_cmore",
  [8] = "saiga_g_optics_aimpoint_preorder",
  [9] = "saiga_g_optics_eotech_xps",
  [10] = "saiga_g_optics_reflex",
  [11] = "saiga_g_optics_rx01",
  [12] = "saiga_g_optics_rx30",
  [13] = "saiga_g_optics_cs",
  [14] = "saiga_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.saiga_npc.sight = NPCWeap.loaded_options.saiga_npc.sight or 1
NPCWeap.weapons.saiga_npc.required_reset.sight = {
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

NPCWeap.weapons.saiga_npc.stock = {
  [1] = "saiga_g_stock_solid",
  [2] = "saiga_g_stock_folding",
  [3] = "saiga_g_stock_skfoldable",
  [4] = "saiga_g_stock_nostock",
  [5] = "saiga_g_stock_m4_crane",
  [6] = "saiga_g_stock_m4_mk46",
  [7] = "saiga_g_stock_m4_pts",
  [8] = "saiga_g_stock_m4_std",
  [9] = "saiga_g_stock_m4_ubr",
  [10] = "random",
}
NPCWeap.loaded_options.saiga_npc.stock = NPCWeap.loaded_options.saiga_npc.stock or 1
NPCWeap.weapons.saiga_npc.required_reset.stock = {
  "g_stock_adapter",
}

NPCWeap.weapons.saiga_npc.foregrip = {
  [1] = "saiga_g_fg_std",
  [2] = "saiga_g_fg_rail",
  [3] = "random",
}
NPCWeap.loaded_options.saiga_npc.foregrip = NPCWeap.loaded_options.saiga_npc.foregrip or 1
NPCWeap.weapons.saiga_npc.required_reset.foregrip = {}

NPCWeap.weapons.saiga_npc.grip = {
  [1] = "saiga_g_grip_hgrip",
  [2] = "saiga_g_grip_pgrip",
  [3] = "saiga_g_grip_rk3",
  [4] = "saiga_g_grip_wgrip",
  [5] = "saiga_g_grip_std",
  [6] = "random",
}
NPCWeap.loaded_options.saiga_npc.grip = NPCWeap.loaded_options.saiga_npc.grip or 1
NPCWeap.weapons.saiga_npc.required_reset.grip = {}

NPCWeap.weapons.saiga_npc.attachment = {
  [1] = "saiga_none",
  [2] = "saiga_g_attachment_surefire",
  [3] = "saiga_g_attachment_laser",
  [4] = "saiga_g_attachment_peq",
  [5] = "saiga_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.saiga_npc.attachment = NPCWeap.loaded_options.saiga_npc.attachment or 1
NPCWeap.weapons.saiga_npc.required_reset.attachment = {}

NPCWeap.weapons.saiga_npc.required = {
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
  ["g_stock_m4_crane"] = { "g_stock_adapter" },
  ["g_stock_m4_mk46"] = { "g_stock_adapter" },
  ["g_stock_m4_pts"] = { "g_stock_adapter" },
  ["g_stock_m4_std"] = { "g_stock_adapter" },
  ["g_stock_m4_ubr"] = { "g_stock_adapter" },
}

NPCWeap.weapons.saiga_npc.absolute_reset_on_update = {
  ["barrel_ext"] = { "g_ns_spooci1" },
}

NPCWeap.weapons.saiga_npc.incompatible = {
  ["saiga_g_fg_std"] = { "saiga_g_attachment_peqbox", "saiga_g_attachment_surefire", "saiga_g_attachment_laser", "saiga_g_attachment_peq" },
  ["saiga_g_attachment_peqbox"] = { "saiga_g_fg_std" },
  ["saiga_g_attachment_surefire"] = { "saiga_g_fg_std" },
  ["saiga_g_attachment_laser"] = { "saiga_g_fg_std" },
  ["saiga_g_attachment_peq"] = { "saiga_g_fg_std" },
}

NPCWeap.weapons.saiga_npc.pos_check = {}
