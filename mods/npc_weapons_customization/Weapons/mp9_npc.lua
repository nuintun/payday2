log("mp9_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_mp9_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["mp9_none"] = "None",
    --Barrels
    ["mp9_g_barrel_short"] = "Short",
    ["mp9_g_barrel_medium"] = "Medium",
    ["mp9_g_barrel_long"] = "Long",
    --Barrel Extensions
    ["mp9_g_ns_firepig"] = "Firepig",
    ["mp9_g_ns_jprifles"] = "JP Rifles",
    ["mp9_g_ns_linear"] = "Linear",
    ["mp9_g_ns_medium"] = "Medium",
    ["mp9_g_ns_silencer_large"] = "Silencer",
    ["mp9_g_ns_small"] = "Small",
    ["mp9_g_ns_stubby"] = "Stubby Bastard",
    ["mp9_g_ns_surefire"] = "Sure, fire!",
    ["mp9_g_ns_tank"] = "Tank",
    --Body
    --	No modifications availiable.
    --Foregrips
    --	No modifications availiable.
    --Grips
    --	No modifications availiable.
    --Vertical Grips
    ["mp9_g_vertical_grip"] = "VG",
    ["mp9_g_vg_stubby"] = "Stubby",
    --Magazines
    ["mp9_g_mag_short"] = "Short",
    ["mp9_g_mag_extended"] = "Extended",
    --Optics
    ["mp9_g_optics_aimpoint"] = "Aimpoint",
    ["mp9_g_optics_docter"] = "Docter",
    ["mp9_g_optics_eotech"] = "EOtech",
    ["mp9_g_optics_flipup"] = "Flipup",
    ["mp9_g_optics_specter"] = "Specter",
    ["mp9_g_optics_t1micro"] = "t1micro",
    ["mp9_g_optics_cmore"] = "cmore",
    ["mp9_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["mp9_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["mp9_g_optics_reflex"] = "Reflex",
    ["mp9_g_optics_rx01"] = "RX01",
    ["mp9_g_optics_rx30"] = "RX30",
    ["mp9_g_optics_cs"] = "Aimpoint CS",
    ["mp9_g_optics_acog"] = "Acog Sight",
    ["mp9_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["mp9_g_stock_skeletal"] = "Skeletor",
    ["mp9_g_stock_foldable"] = "Foldable",
    --Attachments
    ["mp9_g_attachment_peqbox"] = "Laser Module",
    ["mp9_g_attachment_surefire"] = "Flashlight",
    ["mp9_g_attachment_laser"] = "Laser Module 2",
    ["mp9_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.mp9_npc = NPCWeap.weapons.mp9_npc or {}
NPCWeap.weapons.mp9_npc.required_reset = NPCWeap.weapons.mp9_npc.required_reset or {}
NPCWeap.weapons.mp9_npc.name_id = "mp9_npc"
NPCWeap.weapons.mp9_npc.display_name = "MP9 Player"
NPCWeap.weapons.mp9_npc.unit = "units/payday2/weapons/wpn_npc_smg_mp9/wpn_npc_smg_mp9"
NPCWeap.weapons.mp9_npc.object_sub = 5
NPCWeap.loaded_options.mp9_npc = NPCWeap.loaded_options.mp9_npc or {}

NPCWeap.weapons.mp9_npc.objects_init = {
  "g_body_charging_handle",
  "g_body_mp9",
  "g_body_cover",
  "g_mag_extended",
  "g_optics_flipup",
  "g_optics_flipup_up",
  "g_stock_foldable"
}

NPCWeap.weapons.mp9_npc.categories = {
  "barrel_ext",
  "sight",
  "stock",
  "attachment",
  "vertical_grip",
}

NPCWeap.weapons.mp9_npc.barrel_ext = {
  [1] = "mp9_none",
  [2] = "mp9_g_ns_firepig",
  [3] = "mp9_g_ns_jprifles",
  [4] = "mp9_g_ns_linear",
  [5] = "mp9_g_ns_medium",
  [6] = "mp9_g_ns_silencer_large",
  [7] = "mp9_g_ns_small",
  [8] = "mp9_g_ns_stubby",
  [9] = "mp9_g_ns_surefire",
  [10] = "mp9_g_ns_tank",
  [11] = "random",
}
NPCWeap.loaded_options.mp9_npc.barrel_ext = NPCWeap.loaded_options.mp9_npc.barrel_ext or 1
NPCWeap.weapons.mp9_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.mp9_npc.g_ns_firepig = {}
NPCWeap.weapons.mp9_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.mp9_npc.g_ns_jprifles = {}
NPCWeap.weapons.mp9_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mp9_npc.g_ns_linear = {}
NPCWeap.weapons.mp9_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.mp9_npc.g_ns_medium = {}
NPCWeap.weapons.mp9_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.mp9_npc.g_ns_silencer_large = {}
NPCWeap.weapons.mp9_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.mp9_npc.g_ns_small = {}
NPCWeap.weapons.mp9_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.mp9_npc.g_ns_stubby = {}
NPCWeap.weapons.mp9_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.mp9_npc.g_ns_surefire = {}
NPCWeap.weapons.mp9_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.mp9_npc.g_ns_tank = {}
NPCWeap.weapons.mp9_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.mp9_npc.g_ns_pbs1 = {}
NPCWeap.weapons.mp9_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.mp9_npc.sight = {
  [1] = "mp9_none",
  [2] = "mp9_g_optics_aimpoint",
  [3] = "mp9_g_optics_docter",
  [4] = "mp9_g_optics_eotech",
  [5] = "mp9_g_optics_specter",
  [6] = "mp9_g_optics_t1micro",
  [7] = "mp9_g_optics_cmore",
  [8] = "mp9_g_optics_aimpoint_preorder",
  [9] = "mp9_g_optics_eotech_xps",
  [10] = "mp9_g_optics_reflex",
  [11] = "mp9_g_optics_rx01",
  [12] = "mp9_g_optics_rx30",
  [13] = "mp9_g_optics_cs",
  [14] = "mp9_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.mp9_npc.sight = NPCWeap.loaded_options.mp9_npc.sight or 1
NPCWeap.weapons.mp9_npc.required_reset.sight = {
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
  "g_optics_cs_lens",
}

NPCWeap.weapons.mp9_npc.stock = {
  [1] = "mp9_g_stock_skeletal",
  [2] = "mp9_g_stock_foldable",
  [3] = "random",
}
NPCWeap.loaded_options.mp9_npc.stock = NPCWeap.loaded_options.mp9_npc.stock or 1
NPCWeap.weapons.mp9_npc.required_reset.stock = {}

NPCWeap.weapons.mp9_npc.attachment = {
  [1] = "mp9_none",
  [2] = "mp9_g_attachment_peqbox",
  [3] = "mp9_g_attachment_surefire",
  [4] = "mp9_g_attachment_laser",
  [5] = "mp9_g_attachment_peq",
  [6] = "random",
}
NPCWeap.loaded_options.mp9_npc.attachment = NPCWeap.loaded_options.mp9_npc.attachment or 1
NPCWeap.weapons.mp9_npc.required_reset.attachment = {}

NPCWeap.weapons.mp9_npc.vertical_grip = {
  [1] = "mp9_none",
  [2] = "mp9_g_vertical_grip",
  [3] = "mp9_g_vg_stubby",
  [4] = "random",
}
NPCWeap.loaded_options.mp9_npc.vertical_grip = NPCWeap.loaded_options.mp9_npc.vertical_grip or 1
NPCWeap.weapons.mp9_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.mp9_npc.required = {
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

NPCWeap.weapons.mp9_npc.absolute_reset_on_update = {}

NPCWeap.weapons.mp9_npc.incompatible = {}

NPCWeap.weapons.mp9_npc.pos_check = {}
