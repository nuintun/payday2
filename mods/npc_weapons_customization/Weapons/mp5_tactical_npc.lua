log("mp5_tactical_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_mp5_tactical_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["mp5_tactical_none"] = "None",
    --Barrels
    --	None, no modifications availiable.
    --Barrel Extensions
    ["mp5_tactical_g_ns_firepig"] = "Firepig",
    ["mp5_tactical_g_ns_jprifles"] = "JP Rifles",
    ["mp5_tactical_g_ns_linear"] = "Linear",
    ["mp5_tactical_g_ns_medium"] = "Medium",
    ["mp5_tactical_g_ns_pbs1"] = "PBS",
    ["mp5_tactical_g_ns_silencer_large"] = "Large Silencer",
    ["mp5_tactical_g_ns_small"] = "Small",
    ["mp5_tactical_g_ns_stubby"] = "Stubby Bastard",
    ["mp5_tactical_g_ns_surefire"] = "Surefire",
    ["mp5_tactical_g_ns_tank"] = "TANK!",
    --Body
    --	None, no modifications availiable.
    --Vertical Grips
    ["mp5_tactical_g_vg"] = "Very vertical",
    ["mp5_tactical_g_vg_afg"] = "AFG",
    ["mp5_tactical_g_vg_stubby"] = "Stubby",
    --Fore grips
    ["mp5_tactical_g_fg_mp5a4"] = "MP5A4",
    ["mp5_tactical_g_fg_mp5a5"] = "MP5A5",
    ["mp5_tactical_g_fg_mp5k"] = "MP5K",
    ["mp5_tactical_g_fg_mp5sd"] = "MP5SD",
    --Magazines
    ["mp5_tactical_g_mag_std"] = "Standard",
    ["mp5_tactical_g_mag_drum"] = "Drum",
    --Optics
    ["mp5_tactical_g_optics_aimpoint"] = "Aimpoint",
    ["mp5_tactical_g_optics_docter"] = "Docter",
    ["mp5_tactical_g_optics_eotech"] = "EOtech",
    ["mp5_tactical_g_optics_specter"] = "Specter",
    ["mp5_tactical_g_optics_t1micro"] = "t1micro",
    ["mp5_tactical_g_optics_cmore"] = "cmore",
    ["mp5_tactical_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["mp5_tactical_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["mp5_tactical_g_optics_reflex"] = "Reflex",
    ["mp5_tactical_g_optics_rx01"] = "RX01",
    ["mp5_tactical_g_optics_rx30"] = "RX30",
    ["mp5_tactical_g_optics_cs"] = "Aimpoint CS",
    ["mp5_tactical_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["mp5_tactical_g_stock_solid"] = "Solid",
    ["mp5_tactical_g_stock_ring"] = "Ring",
    ["mp5_tactical_g_stock_adjust"] = "Adjustable",
    --Attachments
    ["mp5_tactical_g_attachment_peqbox"] = "Laser Module",
    ["mp5_tactical_g_attachment_surefire"] = "Flashlight",
    ["mp5_tactical_g_attachment_laser"] = "Laser Module 2",
    ["mp5_tactical_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.mp5_tactical_npc = NPCWeap.weapons.mp5_tactical_npc or {}
NPCWeap.weapons.mp5_tactical_npc.required_reset = NPCWeap.weapons.mp5_tactical_npc.required_reset or {}
NPCWeap.weapons.mp5_tactical_npc.name_id = "mp5_tactical_npc"
NPCWeap.weapons.mp5_tactical_npc.display_name = "Tactical MP5 Player"
NPCWeap.weapons.mp5_tactical_npc.unit = "units/payday2/weapons/wpn_npc_mp5_tactical/wpn_npc_mp5_tactical"
NPCWeap.weapons.mp5_tactical_npc.object_sub = 14
NPCWeap.weapons.mp5_tactical_npc.spooci = {}
NPCWeap.loaded_options.mp5_tactical_npc = NPCWeap.loaded_options.mp5_tactical_npc or {}

NPCWeap.weapons.mp5_tactical_npc.objects_init = {
  "g_ns_small",
  "g_body_mp5",
  "g_body_rail",
  "g_fg_mp5k",
  "g_fg_mp5k_draghandle",
  "g_vg_stubby",
  "g_mag_std",
  "g_optics_cmore",
  "g_optics_cmore_gfx_lens",
  "g_stock_ring",
  "g_attachment_peq"
}

NPCWeap.weapons.mp5_tactical_npc.categories = {
  "barrel_ext",
  "magazine",
  "sight",
  "stock",
  "foregrip",
  "vertical_grip",
  "attachment"
}

NPCWeap.weapons.mp5_tactical_npc.barrel_ext = {
  [1] = "mp5_tactical_none",
  [2] = "mp5_tactical_g_ns_firepig",
  [3] = "mp5_tactical_g_ns_jprifles",
  [4] = "mp5_tactical_g_ns_linear",
  [5] = "mp5_tactical_g_ns_medium",
  [6] = "mp5_tactical_g_ns_pbs1",
  [7] = "mp5_tactical_g_ns_silencer_large",
  [8] = "mp5_tactical_g_ns_small",
  [9] = "mp5_tactical_g_ns_stubby",
  [10] = "mp5_tactical_g_ns_surefire",
  [11] = "mp5_tactical_g_ns_tank",
  [12] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.barrel_ext = NPCWeap.loaded_options.mp5_tactical_npc.barrel_ext or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_firepig = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_jprifles = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_linear = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_medium = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_silencer_large = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_small = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_stubby = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_surefire = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_tank = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.mp5_tactical_npc.g_ns_pbs1 = {}
NPCWeap.weapons.mp5_tactical_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.mp5_tactical_npc.magazine = {
  [1] = "mp5_tactical_g_mag_std",
  [2] = "mp5_tactical_g_mag_drum",
  [3] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.magazine = NPCWeap.loaded_options.mp5_tactical_npc.magazine or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.magazine = {}
NPCWeap.weapons.mp5_tactical_npc.required_reset.magazine = {
  "g_spooci"
}
NPCWeap.weapons.mp5_tactical_npc.spooci.magazine = {
  [1.5] = { "mp5_g_spooci" },
}

NPCWeap.weapons.mp5_tactical_npc.sight = {
  [1] = "mp5_tactical_none",
  [2] = "mp5_tactical_g_optics_aimpoint",
  [3] = "mp5_tactical_g_optics_docter",
  [4] = "mp5_tactical_g_optics_eotech",
  [5] = "mp5_tactical_g_optics_specter",
  [6] = "mp5_tactical_g_optics_t1micro",
  [7] = "mp5_tactical_g_optics_cmore",
  [8] = "mp5_tactical_g_optics_aimpoint_preorder",
  [9] = "mp5_tactical_g_optics_eotech_xps",
  [10] = "mp5_tactical_g_optics_reflex",
  [11] = "mp5_tactical_g_optics_rx01",
  [12] = "mp5_tactical_g_optics_rx30",
  [13] = "mp5_tactical_g_optics_cs",
  [14] = "mp5_tactical_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.mp5_tactical_npc.sight = NPCWeap.loaded_options.mp5_tactical_npc.sight or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.sight = {
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
  "g_body_rail"
}

NPCWeap.weapons.mp5_tactical_npc.stock = {
  [1] = "mp5_tactical_g_stock_solid",
  [2] = "mp5_tactical_g_stock_ring",
  [3] = "mp5_tactical_g_stock_adjust",
  [4] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.stock = NPCWeap.loaded_options.mp5_tactical_npc.stock or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.stock = {}

NPCWeap.weapons.mp5_tactical_npc.vertical_grip = {
  [1] = "mp5_tactical_none",
  [2] = "mp5_tactical_g_vg",
  [3] = "mp5_tactical_g_vg_afg",
  [4] = "mp5_tactical_g_vg_stubby",
  [5] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.vertical_grip = NPCWeap.loaded_options.mp5_tactical_npc.vertical_grip or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.mp5_tactical_npc.foregrip = {
  [1] = "mp5_tactical_g_fg_mp5a4",
  [2] = "mp5_tactical_g_fg_mp5a5",
  [3] = "mp5_tactical_g_fg_mp5k",
  [4] = "mp5_tactical_g_fg_mp5sd",
  [5] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.foregrip = NPCWeap.loaded_options.mp5_tactical_npc.foregrip or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.foregrip = {}
NPCWeap.weapons.mp5_tactical_npc.barrel_fire_offset = Vector3(0, -15.31046, 0)
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5a4 = {}
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5a4.barrel_ext = Vector3(0, 11.249462, -0.003379) --[0 21.07671 0.7489474]
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5a5 = {}
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5a5.barrel_ext = Vector3(0, 11.249462, -0.003379) --[0 21.07671 0.7489474]
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5k = {}
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5k.barrel_ext = Vector3(0, 0, 0) --[0 9.827248 0.7523264]
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5sd = {} --not compatible with barrel_ext
NPCWeap.weapons.mp5_tactical_npc.g_fg_mp5sd.barrel_ext = Vector3(0, 19.315472, -0.003379)

NPCWeap.weapons.mp5_tactical_npc.attachment = {
  [1] = "mp5_tactical_none",
  [2] = "mp5_tactical_g_attachment_surefire",
  [3] = "mp5_tactical_g_attachment_laser",
  [4] = "mp5_tactical_g_attachment_peq",
  [5] = "mp5_tactical_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.mp5_tactical_npc.attachment = NPCWeap.loaded_options.mp5_tactical_npc.attachment or 1
NPCWeap.weapons.mp5_tactical_npc.required_reset.attachment = {}

NPCWeap.weapons.mp5_tactical_npc.required = {
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_body_rail" },
  ["g_optics_acog"] = { "g_optics_acog_lens", "g_body_rail" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_body_rail" },
  ["g_optics_docter"] = { "g_optics_docter_lens", "g_body_rail" },
  ["g_optics_specter"] = { "g_optics_specter_glass", "g_body_rail" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_body_rail" },
  ["g_optics_cmore"] = { "g_optics_cmore_lens", "g_body_rail" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_body_rail" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens", "g_body_rail" },
  ["g_optics_reflex"] = { "g_optics_reflex_lens", "g_body_rail" },
  ["g_optics_rx01"] = { "g_optics_rx01_lens", "g_body_rail" },
  ["g_optics_rx30"] = { "g_optics_rx30_lens", "g_body_rail" },
  ["g_optics_cs"] = { "g_optics_cs_lens", "g_body_rail" },
  ["g_vg"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_vg_afg"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_vg_stubby"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_surefire"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_laser"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_peq"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_peqbox"] = { "g_body_ris", "g_body_ris_draghandle" },
}

NPCWeap.weapons.mp5_tactical_npc.incompatible = {
  --["mp5_tactical_g_optics_eotech"] = {"mp5_tactical_g_stock_folding"},
  ["mp5_tactical_g_fg_mp5sd"] = { "mp5_tactical_g_ns_firepig", "mp5_tactical_g_ns_jprifles", "mp5_tactical_g_ns_linear", "mp5_tactical_g_ns_medium", "mp5_tactical_g_ns_pbs1", "mp5_tactical_g_ns_silencer_large", "mp5_tactical_g_ns_small", "mp5_tactical_g_ns_stubby", "mp5_tactical_g_ns_surefire", "mp5_tactical_g_ns_tank", "mp5_tactical_g_attachment_peqbox", "mp5_tactical_g_attachment_surefire", "mp5_tactical_g_attachment_laser", "mp5_tactical_g_attachment_peq", "mp5_tactical_g_vg", "mp5_tactical_g_vg_afg", "mp5_tactical_g_vg_stubby" },
  ["mp5_tactical_g_ns_firepig"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_jprifles"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_linear"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_medium"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_pbs1"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_silencer_large"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_small"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_stubby"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_surefire"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_ns_tank"] = { "mp5_tactical_g_fg_mp5sd" },
  ["mp5_tactical_g_fg_mp5a4"] = { "mp5_tactical_g_attachment_peqbox", "mp5_tactical_g_attachment_surefire", "mp5_tactical_g_attachment_laser", "mp5_tactical_g_attachment_peq", "mp5_tactical_g_vg", "mp5_tactical_g_vg_afg", "mp5_tactical_g_vg_stubby" },
  ["mp5_tactical_g_attachment_peqbox"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_attachment_surefire"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_attachment_laser"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_attachment_peq"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_vg"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_vg_afg"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
  ["mp5_tactical_g_vg_stubby"] = { "mp5_tactical_g_fg_mp5sd", "mp5_tactical_g_fg_mp5a4" },
}

NPCWeap.weapons.mp5_tactical_npc.pos_check = {
  ["barrel_ext"] = { "foregrip" }
}

NPCWeap.weapons.mp5_tactical_npc.absolute_reset_on_update = {
  ["magazine"] = { "g_spooci" },
}
