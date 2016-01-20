log("ump_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_ump_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["ump_none"] = "None",
    --Barrels
    --	None, no modifications availiable.
    --Barrel Extensions
    ["ump_g_ns_firepig"] = "Firepig",
    ["ump_g_ns_jprifles"] = "JP Rifles",
    ["ump_g_ns_linear"] = "Linear",
    ["ump_g_ns_medium"] = "Medium",
    ["ump_g_ns_pbs1"] = "PBS",
    ["ump_g_ns_silencer_large"] = "Large Silencer",
    ["ump_g_ns_small"] = "Small",
    ["ump_g_ns_stubby"] = "Stubby Bastard",
    ["ump_g_ns_surefire"] = "Surefire",
    ["ump_g_ns_tank"] = "TANK!",
    --Body
    --	None, no modifications availiable.
    --Vertical Grips
    ["ump_g_vg"] = "Very vertical",
    ["ump_g_vg_stubby"] = "Stubby",
    --Fore grips
    --	None, no modifications availiable.
    --Magazines
    ["ump_g_mag"] = "Standard",
    ["ump_g_mag_drum"] = "Drum",
    --Optics
    ["ump_g_optics_aimpoint"] = "Aimpoint",
    ["ump_g_optics_docter"] = "Docter",
    ["ump_g_optics_eotech"] = "EOtech",
    ["ump_g_optics_specter"] = "Specter",
    ["ump_g_optics_t1micro"] = "t1micro",
    ["ump_g_optics_cmore"] = "cmore",
    ["ump_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["ump_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["ump_g_optics_reflex"] = "Reflex",
    ["ump_g_optics_rx01"] = "RX01",
    ["ump_g_optics_rx30"] = "RX30",
    ["ump_g_optics_cs"] = "Aimpoint CS",
    ["ump_g_optics_acog"] = "Acog Sight",
    --Stocks
    --	None, no modifications availiable.
    --Attachments
    ["ump_g_attachment_peqbox"] = "Laser Module",
    ["ump_g_attachment_surefire"] = "Flashlight",
    ["ump_g_attachment_laser"] = "Laser Module 2",
    ["ump_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.ump_npc = NPCWeap.weapons.ump_npc or {}
NPCWeap.weapons.ump_npc.required_reset = NPCWeap.weapons.ump_npc.required_reset or {}
NPCWeap.weapons.ump_npc.name_id = "ump_npc"
NPCWeap.weapons.ump_npc.display_name = "UMP 45"
NPCWeap.weapons.ump_npc.unit = "units/payday2/weapons/wpn_npc_ump/wpn_npc_ump"
NPCWeap.weapons.ump_npc.object_sub = 5
NPCWeap.loaded_options.ump_npc = NPCWeap.loaded_options.ump_npc or {}

NPCWeap.weapons.ump_npc.objects_init = {
  "g_body_ump",
  "g_mag",
  "g_optics_cmore",
  "g_optics_cmore_lens",
  "g_attachment_laser"
}

NPCWeap.weapons.ump_npc.categories = {
  "barrel_ext",
  "magazine",
  "sight",
  "vertical_grip",
  "attachment",
}

NPCWeap.weapons.ump_npc.barrel_ext = {
  [1] = "ump_none",
  [2] = "ump_g_ns_firepig",
  [3] = "ump_g_ns_jprifles",
  [4] = "ump_g_ns_linear",
  [5] = "ump_g_ns_medium",
  [6] = "ump_g_ns_pbs1",
  [7] = "ump_g_ns_silencer_large",
  [8] = "ump_g_ns_small",
  [9] = "ump_g_ns_stubby",
  [10] = "ump_g_ns_surefire",
  [11] = "ump_g_ns_tank",
  [12] = "random",
}
NPCWeap.loaded_options.ump_npc.barrel_ext = NPCWeap.loaded_options.ump_npc.barrel_ext or 1
NPCWeap.weapons.ump_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.ump_npc.g_ns_firepig = {}
NPCWeap.weapons.ump_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.ump_npc.g_ns_jprifles = {}
NPCWeap.weapons.ump_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.ump_npc.g_ns_linear = {}
NPCWeap.weapons.ump_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.ump_npc.g_ns_medium = {}
NPCWeap.weapons.ump_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.ump_npc.g_ns_silencer_large = {}
NPCWeap.weapons.ump_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.ump_npc.g_ns_small = {}
NPCWeap.weapons.ump_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.ump_npc.g_ns_stubby = {}
NPCWeap.weapons.ump_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.ump_npc.g_ns_surefire = {}
NPCWeap.weapons.ump_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.ump_npc.g_ns_tank = {}
NPCWeap.weapons.ump_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.ump_npc.g_ns_pbs1 = {}
NPCWeap.weapons.ump_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.ump_npc.magazine = {
  [1] = "ump_g_mag",
  [2] = "ump_g_mag_drum",
  [3] = "random",
}
NPCWeap.loaded_options.ump_npc.magazine = NPCWeap.loaded_options.ump_npc.magazine or 1
NPCWeap.weapons.ump_npc.required_reset.magazine = {}

NPCWeap.weapons.ump_npc.sight = {
  [1] = "ump_none",
  [2] = "ump_g_optics_aimpoint",
  [3] = "ump_g_optics_docter",
  [4] = "ump_g_optics_eotech",
  [5] = "ump_g_optics_specter",
  [6] = "ump_g_optics_t1micro",
  [7] = "ump_g_optics_cmore",
  [8] = "ump_g_optics_aimpoint_preorder",
  [9] = "ump_g_optics_eotech_xps",
  [10] = "ump_g_optics_reflex",
  [11] = "ump_g_optics_rx01",
  [12] = "ump_g_optics_rx30",
  [13] = "ump_g_optics_cs",
  [14] = "ump_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.ump_npc.sight = NPCWeap.loaded_options.ump_npc.sight or 1
NPCWeap.weapons.ump_npc.required_reset.sight = {
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
  "g_optics_t1micro_glass"
}

NPCWeap.weapons.ump_npc.vertical_grip = {
  [1] = "ump_none",
  [2] = "ump_g_vg",
  [3] = "ump_g_vg_stubby",
  [4] = "random",
}
NPCWeap.loaded_options.ump_npc.vertical_grip = NPCWeap.loaded_options.ump_npc.vertical_grip or 1
NPCWeap.weapons.ump_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.ump_npc.attachment = {
  [1] = "ump_none",
  [2] = "ump_g_attachment_surefire",
  [3] = "ump_g_attachment_laser",
  [4] = "ump_g_attachment_peq",
  [5] = "ump_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.ump_npc.attachment = NPCWeap.loaded_options.ump_npc.attachment or 1
NPCWeap.weapons.ump_npc.required_reset.attachment = {}

NPCWeap.weapons.ump_npc.required = {
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
}

NPCWeap.weapons.ump_npc.incompatible = {}

NPCWeap.weapons.ump_npc.pos_check = {}
