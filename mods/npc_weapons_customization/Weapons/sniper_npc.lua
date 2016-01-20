log("m14_sniper_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_sniper_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["sniper_none"] = "None",
    --Barrels
    ["sniper_g_barrel_long"] = "Long",
    ["sniper_g_barrel_medium"] = "Medium",
    ["sniper_g_barrel_short"] = "Short",
    ["sniper_g_barrel_suppressed"] = "Supressed",
    --Barrel Extensions
    --	None, no modifications availiable.
    --Body
    ["sniper_g_bipod"] = "Bipod",
    --Grips
    ["sniper_g_grip_hgrip"] = "H-Grip",
    ["sniper_g_grip_mgrip_g_grip"] = "M-Grip",
    ["sniper_g_grip_ergo"] = "Ergo",
    ["sniper_g_grip_sniper"] = "Sniper",
    ["sniper_g_grip_m4_std"] = "Standard",
    --Optics
    ["sniper_g_optics_aimpoint"] = "Aimpoint",
    ["sniper_g_optics_docter"] = "Docter",
    ["sniper_g_optics_eotech"] = "EOtech",
    ["sniper_g_optics_specter"] = "Specter",
    ["sniper_g_optics_t1micro"] = "t1micro",
    ["sniper_g_optics_cmore"] = "cmore",
    ["sniper_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["sniper_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["sniper_g_optics_reflex"] = "Reflex",
    ["sniper_g_optics_rx01"] = "RX01",
    ["sniper_g_optics_rx30"] = "RX30",
    ["sniper_g_optics_cs"] = "Aimpoint CS",
    ["sniper_g_optics_acog"] = "Acog Sight",
    ["sniper_g_optics_leupold"] = "Leupold",
    ["sniper_g_optics_shortdot"] = "Shortdot",
    --Stocks
    --	None, no modifications availiable.
    --Attachments
    ["sniper_g_attachment_peqbox"] = "Laser Module",
    ["sniper_g_attachment_surefire"] = "Flashlight",
    ["sniper_g_attachment_laser"] = "Laser Module 2",
    ["sniper_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.m14_sniper_npc = NPCWeap.weapons.m14_sniper_npc or {}
NPCWeap.weapons.m14_sniper_npc.required_reset = NPCWeap.weapons.m14_sniper_npc.required_reset or {}
NPCWeap.weapons.m14_sniper_npc.name_id = "m14_sniper_npc"
NPCWeap.weapons.m14_sniper_npc.display_name = "Thanatos"
NPCWeap.weapons.m14_sniper_npc.unit = "units/payday2/weapons/wpn_npc_sniper/wpn_npc_sniper"
NPCWeap.weapons.m14_sniper_npc.object_sub = 8
NPCWeap.weapons.m14_sniper_npc.spooci = {}
NPCWeap.loaded_options.m14_sniper_npc = NPCWeap.loaded_options.m14_sniper_npc or {}

NPCWeap.weapons.m14_sniper_npc.objects_init = {
  "g_barrel_medium",
  "g_barrel_medium_barrel",
  "g_bipod",
  "g_bipod_pin",
  "g_body_bolt",
  "g_body_bolt_handle",
  "g_body_lower",
  "g_body_pin",
  "g_body_upper",
  "g_grip_m4_std",
  "g_mag_bullets",
  "g_mag_clip",
  "g_optics_shortdot",
  "g_optics_shortdot_gfx_lens",
  "g_optics_shortdot_inside",
  "g_optics_shortdot_reticle",
  "g_attachment_laser"
}

NPCWeap.weapons.m14_sniper_npc.categories = {
  "barrel",
  "sight",
  "grip",
  "attachment",
}

NPCWeap.weapons.m14_sniper_npc.barrel = {
  [1] = "sniper_g_barrel_long",
  [2] = "sniper_g_barrel_medium",
  [3] = "sniper_g_barrel_short",
  [4] = "sniper_g_barrel_suppressed",
  [5] = "random",
}
NPCWeap.loaded_options.m14_sniper_npc.barrel = NPCWeap.loaded_options.m14_sniper_npc.barrel or 1
NPCWeap.weapons.m14_sniper_npc.required_reset.barrel = {
  "g_barrel_medium_barrel",
  "g_barrel_short_muzzle",
}
NPCWeap.weapons.m14_sniper_npc.barrel_fire_offset = Vector3(0, -77.98917, 0)
NPCWeap.weapons.m14_sniper_npc.g_barrel_long = {}
NPCWeap.weapons.m14_sniper_npc.g_barrel_long.barrel_ext = Vector3(0, 112.52249, 0)
NPCWeap.weapons.m14_sniper_npc.g_barrel_medium = {}
NPCWeap.weapons.m14_sniper_npc.g_barrel_medium.barrel_ext = Vector3(0, 77.98917, 0)
NPCWeap.weapons.m14_sniper_npc.g_barrel_short = {}
NPCWeap.weapons.m14_sniper_npc.g_barrel_short.barrel_ext = Vector3(0, 45.06871, 0)
NPCWeap.weapons.m14_sniper_npc.g_barrel_suppressed = {}
NPCWeap.weapons.m14_sniper_npc.g_barrel_suppressed.barrel_ext = Vector3(0, 89.04673, 0)

NPCWeap.weapons.m14_sniper_npc.sight = {
  [1] = "sniper_none",
  [2] = "sniper_g_optics_aimpoint",
  [3] = "sniper_g_optics_docter",
  [4] = "sniper_g_optics_eotech",
  [5] = "sniper_g_optics_specter",
  [6] = "sniper_g_optics_t1micro",
  [7] = "sniper_g_optics_cmore",
  [8] = "sniper_g_optics_aimpoint_preorder",
  [9] = "sniper_g_optics_eotech_xps",
  [10] = "sniper_g_optics_reflex",
  [11] = "sniper_g_optics_rx01",
  [12] = "sniper_g_optics_rx30",
  [13] = "sniper_g_optics_cs",
  [14] = "sniper_g_optics_acog",
  [15] = "sniper_g_optics_leupold",
  [16] = "sniper_g_optics_shortdot",
  [17] = "random"
}
NPCWeap.loaded_options.m14_sniper_npc.sight = NPCWeap.loaded_options.m14_sniper_npc.sight or 1
NPCWeap.weapons.m14_sniper_npc.required_reset.sight = {
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
  "g_optics_shortdot_gfx_lens",
  "g_optics_shortdot_inside",
  "g_optics_shortdot_reticle",
  "g_optics_leupold_gfx_lens",
  "g_optics_leupold_illum",
  "g_optics_leupold_inside",
  "g_optics_leupold_reticle",
}

NPCWeap.weapons.m14_sniper_npc.grip = {
  [1] = "sniper_g_grip_hgrip",
  [2] = "sniper_g_grip_mgrip_g_grip",
  [3] = "sniper_g_grip_ergo",
  [4] = "sniper_g_grip_sniper",
  [5] = "sniper_g_grip_m4_std",
  [6] = "random",
}
NPCWeap.loaded_options.m14_sniper_npc.grip = NPCWeap.loaded_options.m14_sniper_npc.grip or 1
NPCWeap.weapons.m14_sniper_npc.required_reset.grip = {}

NPCWeap.weapons.m14_sniper_npc.attachment = {
  [1] = "sniper_none",
  [2] = "sniper_g_attachment_surefire",
  [3] = "sniper_g_attachment_laser",
  [4] = "sniper_g_attachment_peq",
  [5] = "sniper_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.m14_sniper_npc.attachment = NPCWeap.loaded_options.m14_sniper_npc.attachment or 1
NPCWeap.weapons.m14_sniper_npc.required_reset.attachment = {}

NPCWeap.weapons.m14_sniper_npc.required = {
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
  ["g_optics_leupold"] = { "g_optics_leupold_gfx_lens", "g_optics_leupold_illum", "g_optics_leupold_inside", "g_optics_leupold_reticle" },
  ["g_optics_shortdot"] = { "g_optics_shortdot_gfx_lens", "g_optics_shortdot_inside", "g_optics_shortdot_reticle" },
  ["g_barrel_medium"] = { "g_barrel_medium_barrel" },
  ["g_barrel_short"] = { "g_barrel_short_muzzle" },
}

NPCWeap.weapons.m14_sniper_npc.absolute_reset_on_update = {}

NPCWeap.weapons.m14_sniper_npc.incompatible = {}

NPCWeap.weapons.m14_sniper_npc.pos_check = {}
