log("ak47_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_AK_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["ak47_none"] = "None",
    --Barrels
    ["ak47_g_barrel_standard"] = "Standard",
    ["ak47_g_barrel_draco"] = "Draco",
    ["ak47_g_barrel_ak105"] = "AK105",
    ["ak47_g_barrel_zastava"] = "Застава (Zastava)",
    -- Barrel Extensions
    ["ak47_g_ns_ak105"] = "AK105",
    ["ak47_g_ns_firepig"] = "Firepig",
    ["ak47_g_ns_jprifles"] = "JP Rifles",
    ["ak47_g_ns_linear"] = "Linear",
    ["ak47_g_ns_medium"] = "Medium",
    ["ak47_g_ns_pbs1"] = "PBS",
    ["ak47_g_ns_silencer_large"] = "Large Silencer",
    ["ak47_g_ns_small"] = "Small",
    ["ak47_g_ns_stubby"] = "Stubby Bastard",
    ["ak47_g_ns_surefire"] = "Surefire",
    ["ak47_g_ns_tank"] = "TANK!",
    --Magazines
    ["ak47_g_mag"] = "Standard Magazine",
    ["ak47_g_mag_drum"] = "Drum Magazine",
    ["ak47_g_mag_quad"] = "Quad Magazine",
    ["ak47_g_mag_uspalm"] = "Uspalm",
    --Upper receivers
    ["ak47_g_body_upperreceiver"] = "Standard",
    ["ak47_g_body_upperreceiver_akm"] = "AKM",
    --Optics
    ["ak47_g_optics_aimpoint"] = "Aimpoint",
    ["ak47_g_optics_docter"] = "Docter",
    ["ak47_g_optics_eotech"] = "EOtech",
    ["ak47_g_optics_rail"] = "Rail",
    ["ak47_g_optics_specter"] = "Specter",
    ["ak47_g_optics_t1micro"] = "t1micro",
    ["ak47_g_optics_cmore"] = "cmore",
    ["ak47_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["ak47_g_optics_eotech_gage"] = "EOtech Gage Courier",
    ["ak47_g_optics_reflex"] = "Reflex",
    ["ak47_g_optics_rx01"] = "RX01",
    ["ak47_g_optics_rx30"] = "RX30",
    ["ak47_g_optics_aimpoint_cs"] = "Aimpoint CS",
    --Stocks
    ["ak47_g_stock_folding"] = "Standard",
    ["ak47_g_stock_m4"] = "M4",
    ["ak47_g_stock_m4_adapter"] = "M4 Adapter",
    ["ak47_g_stock_skfoldable"] = "SKFoldable",
    ["ak47_g_stock_crane"] = "Crane",
    ["ak47_g_stock_mk46"] = "MK46",
    ["ak47_g_stock_ubr"] = "UBR",
    ["ak47_g_stock_solid"] = "Solid Wood Stock",
    --Foregrips
    ["ak47_g_fg_lowerhandguard"] = "Standard",
    ["ak47_g_fg_combo1"] = "Combo1",
    ["ak47_g_fg_combo2"] = "Combo2",
    ["ak47_g_fg_combo3_lowerrail"] = "Combo3",
    ["ak47_g_fg_combo4_aims"] = "Combo4",
    ["ak47_g_fg_tapco"] = "Tapco",
    ["ak47_g_fg_midwest"] = "Midwest",
    ["ak47_g_fg_kerbs"] = "Kerbs",
    ["ak47_g_fg_trax"] = "Trax",
    --Grips
    ["ak47_g_grip"] = "Standard",
    ["ak47_g_grip_hgrip"] = "hgrip",
    ["ak47_g_grip_pgrip"] = "pgrip",
    ["ak47_g_grip_wgrip"] = "Wodden Grip",
    ["ak47_g_grip_rk3"] = "RK3",
    --Vertical Grips
    ["ak47_g_vertical_grip"] = "Vertical Grip",
    ["ak47_g_vertical_grip_stubby"] = "Stubby",
    --Attachments
    ["ak47_g_attachment_peqbox"] = "Laser Module",
    ["ak47_g_attachment_surefire"] = "Flashlight",
  })
end)

NPCWeap.weapons.ak47_npc = NPCWeap.weapons.ak47_npc or {}
NPCWeap.weapons.ak47_npc.required_reset = NPCWeap.weapons.ak47_npc.required_reset or {}
NPCWeap.weapons.ak47_npc.name_id = "ak47_npc"
NPCWeap.weapons.ak47_npc.display_name = "AK47"
NPCWeap.weapons.ak47_npc.unit = "units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47"
NPCWeap.weapons.ak47_npc.object_sub = 6
NPCWeap.loaded_options.ak47_npc = NPCWeap.loaded_options.ak47_npc or {}

NPCWeap.weapons.ak47_npc.objects_init = {
  "g_barrel_standard",
  "g_body_bolt",
  "g_body_lowerreceiver",
  "g_body_upperreceiver",
  "g_fg_lowerhandguard",
  "g_fg_upperhandguard",
  "g_grip",
  "g_mag",
  "g_stock_folding",
  "g_attachment_surefire"
}

NPCWeap.weapons.ak47_npc.categories = {
  "barrel",
  "barrel_ext",
  "magazine",
  "upper_reciever",
  "sight",
  "stock",
  "foregrip",
  "grip",
  "attachment",
  "vertical_grip",
}

NPCWeap.weapons.ak47_npc.barrel = {
  [1] = "ak47_g_barrel_standard",
  [2] = "ak47_g_barrel_draco",
  [3] = "ak47_g_barrel_ak105",
  [4] = "ak47_g_barrel_zastava",
  [5] = "random",
}
NPCWeap.loaded_options.ak47_npc.barrel = NPCWeap.loaded_options.ak47_npc.barrel or 1
NPCWeap.weapons.ak47_npc.required_reset.barrel = {}
NPCWeap.weapons.ak47_npc.barrel_fire_offset = Vector3(-0.02093119, -11.53708, -0.134225)
NPCWeap.weapons.ak47_npc.g_barrel_standard = {}
NPCWeap.weapons.ak47_npc.g_barrel_standard.barrel_ext = Vector3(0.02093119, 11.53708, 0.134225) -- [0.02093119 37.09997 0.134225]
NPCWeap.weapons.ak47_npc.g_barrel_draco = {}
NPCWeap.weapons.ak47_npc.g_barrel_draco.barrel_ext = Vector3(0, 0, 0) -- [0 25.56289 0]
NPCWeap.weapons.ak47_npc.g_barrel_ak105 = {}
NPCWeap.weapons.ak47_npc.g_barrel_ak105.barrel_ext = Vector3(0, 2.34184, 0) -- [3.469447E-18 27.90473 0]
NPCWeap.weapons.ak47_npc.g_barrel_zastava = {}
NPCWeap.weapons.ak47_npc.g_barrel_zastava.barrel_ext = Vector3(0.02093119, 29.80107, 0.134225) -- [0.02093119 55.36396 0.134225]

NPCWeap.weapons.ak47_npc.barrel_ext = {
  [1] = "ak47_none",
  [2] = "ak47_g_ns_ak105",
  [3] = "ak47_g_ns_firepig",
  [4] = "ak47_g_ns_jprifles",
  [5] = "ak47_g_ns_linear",
  [6] = "ak47_g_ns_medium",
  [7] = "ak47_g_ns_pbs1",
  [8] = "ak47_g_ns_silencer_large",
  [9] = "ak47_g_ns_small",
  [10] = "ak47_g_ns_stubby",
  [11] = "ak47_g_ns_surefire",
  [12] = "ak47_g_ns_tank",
  [13] = "random",
}
NPCWeap.loaded_options.ak47_npc.barrel_ext = NPCWeap.loaded_options.ak47_npc.barrel_ext or 1
NPCWeap.weapons.ak47_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.ak47_npc.g_ns_ak105 = {}
NPCWeap.weapons.ak47_npc.g_ns_ak105.length = Vector3(0, 6.65499, 0)
NPCWeap.weapons.ak47_npc.g_ns_firepig = {}
NPCWeap.weapons.ak47_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.ak47_npc.g_ns_jprifles = {}
NPCWeap.weapons.ak47_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.ak47_npc.g_ns_linear = {}
NPCWeap.weapons.ak47_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.ak47_npc.g_ns_medium = {}
NPCWeap.weapons.ak47_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.ak47_npc.g_ns_silencer_large = {}
NPCWeap.weapons.ak47_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.ak47_npc.g_ns_small = {}
NPCWeap.weapons.ak47_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.ak47_npc.g_ns_stubby = {}
NPCWeap.weapons.ak47_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.ak47_npc.g_ns_surefire = {}
NPCWeap.weapons.ak47_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.ak47_npc.g_ns_tank = {}
NPCWeap.weapons.ak47_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.ak47_npc.g_ns_pbs1 = {}
NPCWeap.weapons.ak47_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.ak47_npc.magazine = {
  [1] = "ak47_g_mag",
  [2] = "ak47_g_mag_drum",
  [3] = "ak47_g_mag_quad",
  [4] = "ak47_g_mag_uspalm",
  [5] = "random",
}
NPCWeap.loaded_options.ak47_npc.magazine = NPCWeap.loaded_options.ak47_npc.magazine or 1
NPCWeap.weapons.ak47_npc.required_reset.magazine = {}

NPCWeap.weapons.ak47_npc.upper_reciever = {
  [1] = "ak47_g_body_upperreceiver",
  [2] = "ak47_g_body_upperreceiver_akm",
  [3] = "random",
}
NPCWeap.loaded_options.ak47_npc.upper_reciever = NPCWeap.loaded_options.ak47_npc.upper_reciever or 1
NPCWeap.weapons.ak47_npc.required_reset.upper_reciever = {}

NPCWeap.weapons.ak47_npc.sight = {
  [1] = "ak47_none",
  [2] = "ak47_g_optics_aimpoint",
  [3] = "ak47_g_optics_docter",
  [4] = "ak47_g_optics_eotech",
  [5] = "ak47_g_optics_specter",
  [6] = "ak47_g_optics_t1micro",
  [7] = "ak47_g_optics_cmore",
  [8] = "ak47_g_optics_aimpoint_preorder",
  [9] = "ak47_g_optics_eotech_gage",
  [10] = "ak47_g_optics_reflex",
  [11] = "ak47_g_optics_rx01",
  [12] = "ak47_g_optics_rx30",
  [13] = "ak47_g_optics_aimpoint_cs",
  [14] = "random",
}
NPCWeap.loaded_options.ak47_npc.sight = NPCWeap.loaded_options.ak47_npc.sight or 1
NPCWeap.weapons.ak47_npc.required_reset.sight = {
  "g_optics_eotech_gfx_lens",
  "g_optics_aimpoint_glass",
  "g_optics_spectre_glass",
  "g_optics_t1micro_glass",
  "g_optics_cmore_gfx_lens",
  "g_optics_aimpoint_preorder_glass",
  "g_optics_eotech_gage_gfx_lens",
  "g_optics_reflex_gfx_lens",
  "g_optics_rx01_gfx_lens",
  "g_optics_rx30_gfx_lens",
  "g_optics_rail",
}

NPCWeap.weapons.ak47_npc.stock = {
  [1] = "ak47_g_stock_folding",
  [2] = "ak47_g_stock_m4",
  [3] = "ak47_g_stock_skfoldable",
  [4] = "ak47_g_stock_crane",
  [5] = "ak47_g_stock_mk46",
  [6] = "ak47_g_stock_ubr",
  [7] = "ak47_g_stock_solid",
  [8] = "random",
}
NPCWeap.loaded_options.ak47_npc.stock = NPCWeap.loaded_options.ak47_npc.stock or 1
NPCWeap.weapons.ak47_npc.required_reset.stock = {
  "g_stock_m4_adapter",
}

NPCWeap.weapons.ak47_npc.foregrip = {
  [1] = "ak47_g_fg_lowerhandguard",
  [2] = "ak47_g_fg_combo1",
  [3] = "ak47_g_fg_combo2",
  [4] = "ak47_g_fg_combo3_lowerrail",
  [5] = "ak47_g_fg_combo4_aims",
  [6] = "ak47_g_fg_tapco",
  [7] = "ak47_g_fg_midwest",
  [8] = "ak47_g_fg_kerbs",
  [9] = "ak47_g_fg_trax",
  [10] = "random",
}
NPCWeap.loaded_options.ak47_npc.foregrip = NPCWeap.loaded_options.ak47_npc.foregrip or 1
NPCWeap.weapons.ak47_npc.required_reset.foregrip = {
  "g_fg_upperhandguard",
  "g_fg_combo1_upperrail",
  "g_fg_combo2_upperrail",
  "g_fg_combo3_upperrail",
  "g_fg_combo4_upperhandguard",
  "g_fg_tapco_upperrail",
}

NPCWeap.weapons.ak47_npc.grip = {
  [1] = "ak47_g_grip",
  [2] = "ak47_g_grip_hgrip",
  [3] = "ak47_g_grip_pgrip",
  [4] = "ak47_g_grip_wgrip",
  [5] = "random",
}
NPCWeap.loaded_options.ak47_npc.grip = NPCWeap.loaded_options.ak47_npc.grip or 1
NPCWeap.weapons.ak47_npc.required_reset.grip = {}

NPCWeap.weapons.ak47_npc.attachment = {
  [1] = "ak47_none",
  [2] = "ak47_g_attachment_peqbox",
  [3] = "ak47_g_attachment_surefire",
  [4] = "random",
}
NPCWeap.loaded_options.ak47_npc.attachment = NPCWeap.loaded_options.ak47_npc.attachment or 1
NPCWeap.weapons.ak47_npc.required_reset.attachment = {}

NPCWeap.weapons.ak47_npc.vertical_grip = {
  [1] = "ak47_none",
  [2] = "ak47_g_vertical_grip",
  [3] = "ak47_g_vertical_grip_stubby",
  [4] = "random",
}
NPCWeap.loaded_options.ak47_npc.vertical_grip = NPCWeap.loaded_options.ak47_npc.vertical_grip or 1
NPCWeap.weapons.ak47_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.ak47_npc.required = {
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_optics_rail" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_optics_rail" },
  ["g_optics_docter"] = { "g_optics_rail" },
  ["g_optics_specter"] = { "g_optics_spectre_glass", "g_optics_rail" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_optics_rail" },
  ["g_optics_cmore"] = { "g_optics_cmore_gfx_lens", "g_optics_rail" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_optics_rail" },
  ["g_optics_eotech_gage"] = { "g_optics_eotech_gage_gfx_lens", "g_optics_rail" },
  ["g_optics_reflex"] = { "g_optics_reflex_gfx_lens", "g_optics_rail" },
  ["g_optics_rx01"] = { "g_optics_rx01_gfx_lens", "g_optics_rail" },
  ["g_optics_rx30"] = { "g_optics_rx30_gfx_lens", "g_optics_rail" },
  ["g_optics_aimpoint_cs"] = { "g_optics_rail" },
  ["g_stock_m4"] = { "g_stock_m4_adapter" },
  ["g_stock_crane"] = { "g_stock_m4_adapter" },
  ["g_stock_mk46"] = { "g_stock_m4_adapter" },
  ["g_stock_ubr"] = { "g_stock_m4_adapter" },
  ["g_fg_lowerhandguard"] = { "g_fg_upperhandguard" },
  ["g_fg_combo1"] = { "g_fg_combo1_upperrail" },
  ["g_fg_combo2"] = { "g_fg_combo2_upperrail" },
  ["g_fg_combo3_lowerrail"] = { "g_fg_combo3_upperrail" },
  ["g_fg_combo4_aims"] = { "g_fg_combo4_upperhandguard" },
  ["g_fg_tapco"] = { "g_fg_tapco_upperrail" },
}

NPCWeap.weapons.ak47_npc.incompatible = {
  ["ak47_g_attachment_peqbox"] = { "ak47_g_fg_combo1", "ak47_g_fg_combo4_aims" },
  ["ak47_g_attachment_surefire"] = { "ak47_g_fg_combo1", "ak47_g_fg_combo4_aims" },
  ["ak47_g_fg_combo1"] = { "ak47_g_attachment_peqbox", "ak47_g_attachment_surefire", "ak47_g_vertical_grip", "ak47_g_vertical_grip_stubby" },
  ["ak47_g_fg_combo4_aims"] = { "ak47_g_attachment_peqbox", "ak47_g_attachment_surefire", "ak47_g_vertical_grip", "ak47_g_vertical_grip_stubby" },
  ["ak47_g_vertical_grip"] = { "ak47_g_fg_combo1", "ak47_g_fg_combo4_aims" },
  ["ak47_g_vertical_grip_stubby"] = { "ak47_g_fg_combo1", "ak47_g_fg_combo4_aims" },
}

NPCWeap.weapons.ak47_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
