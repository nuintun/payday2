log("mac11_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_mac11_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["mac11_none"] = "None",
    --Barrels
    --	None, no modifications availiable.
    --Barrel Extensions
    ["mac11_g_ns_firepig"] = "Firepig",
    ["mac11_g_ns_jprifles"] = "JP Rifles",
    ["mac11_g_ns_linear"] = "Linear",
    ["mac11_g_ns_medium"] = "Medium",
    ["mac11_g_ns_pbs1"] = "PBS",
    ["mac11_g_ns_silencer_large"] = "Large Silencer",
    ["mac11_g_ns_small"] = "Small",
    ["mac11_g_ns_stubby"] = "Stubby Bastard",
    ["mac11_g_ns_surefire"] = "Surefire",
    ["mac11_g_ns_tank"] = "TANK!",
    --Body
    --	None, no modifications availiable.
    --Vertical Grips
    ["mac11_g_vg"] = "Very vertical",
    ["mac11_g_vg_afg"] = "AFG",
    ["mac11_g_vg_stubby"] = "Stubby",
    --Magazines
    ["mac11_g_mag_short"] = "Standard",
    ["mac11_g_mag_extended"] = "Extended",
    --Optics
    ["mac11_g_optics_aimpoint"] = "Aimpoint",
    ["mac11_g_optics_docter"] = "Docter",
    ["mac11_g_optics_eotech"] = "EOtech",
    ["mac11_g_optics_specter"] = "Specter",
    ["mac11_g_optics_t1micro"] = "t1micro",
    ["mac11_g_optics_cmore"] = "cmore",
    ["mac11_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["mac11_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["mac11_g_optics_reflex"] = "Reflex",
    ["mac11_g_optics_rx01"] = "RX01",
    ["mac11_g_optics_rx30"] = "RX30",
    ["mac11_g_optics_cs"] = "Aimpoint CS",
    ["mac11_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["mac11_g_s_fold"] = "Foldable",
    ["mac11_g_s_skel"] = "Skeletor",
    --Attachments
    ["mac11_g_attachment_peqbox"] = "Laser Module",
    ["mac11_g_attachment_surefire"] = "Flashlight",
    ["mac11_g_attachment_laser"] = "Laser Module 2",
    ["mac11_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.mac11_npc = NPCWeap.weapons.mac11_npc or {}
NPCWeap.weapons.mac11_npc.required_reset = NPCWeap.weapons.mac11_npc.required_reset or {}
NPCWeap.weapons.mac11_npc.name_id = "mac11_npc"
NPCWeap.weapons.mac11_npc.display_name = "Macintosh 11"
NPCWeap.weapons.mac11_npc.unit = "units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11"
NPCWeap.weapons.mac11_npc.object_sub = 7
NPCWeap.loaded_options.mac11_npc = NPCWeap.loaded_options.mac11_npc or {}

NPCWeap.weapons.mac11_npc.objects_init = {
  "g_body_base",
  "g_body_draghandle",
  "g_mag_extended"
}

NPCWeap.weapons.mac11_npc.categories = {
  "barrel_ext",
  "magazine",
  "sight",
  "stock",
  "vertical_grip",
  "attachment"
}

NPCWeap.weapons.mac11_npc.barrel_ext = {
  [1] = "mac11_none",
  [2] = "mac11_g_ns_firepig",
  [3] = "mac11_g_ns_jprifles",
  [4] = "mac11_g_ns_linear",
  [5] = "mac11_g_ns_medium",
  [6] = "mac11_g_ns_pbs1",
  [7] = "mac11_g_ns_silencer_large",
  [8] = "mac11_g_ns_small",
  [9] = "mac11_g_ns_stubby",
  [10] = "mac11_g_ns_surefire",
  [11] = "mac11_g_ns_tank",
  [12] = "random",
}
NPCWeap.loaded_options.mac11_npc.barrel_ext = NPCWeap.loaded_options.mac11_npc.barrel_ext or 1
NPCWeap.weapons.mac11_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.mac11_npc.g_ns_firepig = {}
NPCWeap.weapons.mac11_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.mac11_npc.g_ns_jprifles = {}
NPCWeap.weapons.mac11_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mac11_npc.g_ns_linear = {}
NPCWeap.weapons.mac11_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mac11_npc.g_ns_medium = {}
NPCWeap.weapons.mac11_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.mac11_npc.g_ns_silencer_large = {}
NPCWeap.weapons.mac11_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.mac11_npc.g_ns_small = {}
NPCWeap.weapons.mac11_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.mac11_npc.g_ns_stubby = {}
NPCWeap.weapons.mac11_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.mac11_npc.g_ns_surefire = {}
NPCWeap.weapons.mac11_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.mac11_npc.g_ns_tank = {}
NPCWeap.weapons.mac11_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.mac11_npc.g_ns_pbs1 = {}
NPCWeap.weapons.mac11_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.mac11_npc.magazine = {
  [1] = "mac11_g_mag_short",
  [2] = "mac11_g_mag_extended",
  [3] = "random",
}
NPCWeap.loaded_options.mac11_npc.magazine = NPCWeap.loaded_options.mac11_npc.magazine or 1
NPCWeap.weapons.mac11_npc.required_reset.magazine = {}

NPCWeap.weapons.mac11_npc.sight = {
  [1] = "mac11_none",
  [2] = "mac11_g_optics_aimpoint",
  [3] = "mac11_g_optics_docter",
  [4] = "mac11_g_optics_eotech",
  [5] = "mac11_g_optics_specter",
  [6] = "mac11_g_optics_t1micro",
  [7] = "mac11_g_optics_cmore",
  [8] = "mac11_g_optics_aimpoint_preorder",
  [9] = "mac11_g_optics_eotech_xps",
  [10] = "mac11_g_optics_reflex",
  [11] = "mac11_g_optics_rx01",
  [12] = "mac11_g_optics_rx30",
  [13] = "mac11_g_optics_cs",
  [14] = "mac11_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.mac11_npc.sight = NPCWeap.loaded_options.mac11_npc.sight or 1
NPCWeap.weapons.mac11_npc.required_reset.sight = {
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
  "g_body_ris",
  "g_body_ris_draghandle"
}

NPCWeap.weapons.mac11_npc.stock = {
  [1] = "mac11_none",
  [2] = "mac11_g_s_fold",
  [3] = "mac11_g_s_skel",
  [4] = "random",
}
NPCWeap.loaded_options.mac11_npc.stock = NPCWeap.loaded_options.mac11_npc.stock or 1
NPCWeap.weapons.mac11_npc.required_reset.stock = {}

NPCWeap.weapons.mac11_npc.vertical_grip = {
  [1] = "mac11_none",
  [2] = "mac11_g_vg",
  [3] = "mac11_g_vg_afg",
  [4] = "mac11_g_vg_stubby",
  [5] = "random",
}
NPCWeap.loaded_options.mac11_npc.vertical_grip = NPCWeap.loaded_options.mac11_npc.vertical_grip or 1
NPCWeap.weapons.mac11_npc.required_reset.vertical_grip = {
  "g_body_ris",
  "g_body_ris_draghandle"
}

NPCWeap.weapons.mac11_npc.attachment = {
  [1] = "mac11_none",
  [2] = "mac11_g_attachment_surefire",
  [3] = "mac11_g_attachment_laser",
  [4] = "mac11_g_attachment_peq",
  [5] = "mac11_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.mac11_npc.attachment = NPCWeap.loaded_options.mac11_npc.attachment or 1
NPCWeap.weapons.mac11_npc.required_reset.attachment = {
  "g_body_ris",
  "g_body_ris_draghandle"
}

NPCWeap.weapons.mac11_npc.required = {
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_acog"] = { "g_optics_acog_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_docter"] = { "g_optics_docter_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_specter"] = { "g_optics_specter_glass", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_cmore"] = { "g_optics_cmore_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_reflex"] = { "g_optics_reflex_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_rx01"] = { "g_optics_rx01_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_rx30"] = { "g_optics_rx30_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_optics_cs"] = { "g_optics_cs_lens", "g_body_ris", "g_body_ris_draghandle" },
  ["g_vg"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_vg_afg"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_vg_stubby"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_surefire"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_laser"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_peq"] = { "g_body_ris", "g_body_ris_draghandle" },
  ["g_attachment_peqbox"] = { "g_body_ris", "g_body_ris_draghandle" },
}

NPCWeap.weapons.mac11_npc.incompatible = {}

NPCWeap.weapons.mac11_npc.pos_check = {}
