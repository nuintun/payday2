log("scar_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_scar_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["scar_none"] = "None",
    --Barrels
    ["scar_g_barrel_short"] = "Short",
    ["scar_g_barrel_medium"] = "Medium",
    ["scar_g_barrel_long"] = "Long",
    --Barrel Extensions
    ["scar_g_ns_firepig"] = "Firepig",
    ["scar_g_ns_jprifles"] = "JP Rifles",
    ["scar_g_ns_linear"] = "Linear",
    ["scar_g_ns_medium"] = "Medium",
    ["scar_g_ns_silencer_large"] = "Silencer",
    ["scar_g_ns_small"] = "Small",
    ["scar_g_ns_stubby"] = "Stubby Bastard",
    ["scar_g_ns_surefire"] = "Sure, fire!",
    ["scar_g_ns_tank"] = "Tank",
    ["scar_g_ns_pbs1"] = "PBS1",
    ["scar_g_ns_flashhider"] = "Flashhider",
    --Body
    --	No modifications availiable.
    --Foregrips
    ["scar_g_fg_ext"] = "Extended",
    --Grips
    ["scar_g_grip_m4"] = "M4 Grip",
    ["scar_g_grip_ergo"] = "Ergo",
    ["scar_g_grip_hgrip"] = "H-Grip",
    ["scar_g_grip_mgrip"] = "M-Grip",
    --Vertical Grips
    ["scar_g_vg_afg"] = "AFG",
    --Magazines
    --	No modifications availiable
    --Optics
    ["scar_g_optics_aimpoint"] = "Aimpoint",
    ["scar_g_optics_docter"] = "Docter",
    ["scar_g_optics_eotech"] = "EOtech",
    ["scar_g_optics_flipup"] = "Flipup",
    ["scar_g_optics_specter"] = "Specter",
    ["scar_g_optics_t1micro"] = "t1micro",
    ["scar_g_optics_cmore"] = "cmore",
    ["scar_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["scar_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["scar_g_optics_reflex"] = "Reflex",
    ["scar_g_optics_rx01"] = "RX01",
    ["scar_g_optics_rx30"] = "RX30",
    ["scar_optics_cs"] = "Aimpoint CS",
    ["scar_g_optics_acog"] = "Acog Sight",
    ["scar_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["scar_g_stock_std"] = "Standard",
    ["scar_g_stock_sniper"] = "Sniper",
    --Attachments
    ["scar_g_attachment_peqbox"] = "Laser Module",
    ["scar_g_attachment_surefire"] = "Flashlight",
    ["scar_g_attachment_laser"] = "Laser Module 2",
    ["scar_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.scar_npc = NPCWeap.weapons.scar_npc or {}
NPCWeap.weapons.scar_npc.required_reset = NPCWeap.weapons.scar_npc.required_reset or {}
NPCWeap.weapons.scar_npc.name_id = "scar_npc"
NPCWeap.weapons.scar_npc.display_name = "Murkywater Scar"
NPCWeap.weapons.scar_npc.unit = "units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater"
NPCWeap.weapons.scar_npc.object_sub = 6
NPCWeap.loaded_options.scar_npc = NPCWeap.loaded_options.scar_npc or {}

NPCWeap.weapons.scar_npc.objects_init = {
  "g_barrel_medium",
  "g_ns_flashhider",
  "g_body_upper",
  "g_body_lower",
  "g_body_cover",
  "g_body_bolt",
  "g_fg_ext",
  "g_grip_m4",
  "g_mag",
  "g_optics_flipup",
  "g_optics_flipup_up",
  "g_stock_sniper",
  "g_attachment_surefire"
}

NPCWeap.weapons.scar_npc.categories = {
  "barrel",
  "barrel_ext",
  "sight",
  "stock",
  "foregrip",
  "grip",
  "attachment",
  "vertical_grip",
}

NPCWeap.weapons.scar_npc.barrel = {
  [1] = "scar_g_barrel_short",
  [2] = "scar_g_barrel_medium",
  [3] = "scar_g_barrel_long",
  [4] = "random",
}
NPCWeap.loaded_options.scar_npc.barrel = NPCWeap.loaded_options.scar_npc.barrel or 1
NPCWeap.weapons.scar_npc.required_reset.barrel = {}
NPCWeap.weapons.scar_npc.barrel_fire_offset = Vector3(0, -10.04417, 0)
NPCWeap.weapons.scar_npc.g_barrel_short = {}
NPCWeap.weapons.scar_npc.g_barrel_short.barrel_ext = Vector3(0, -3.8448, 0) --[0 12.91083 -0.007203754]
NPCWeap.weapons.scar_npc.g_barrel_medium = {}
NPCWeap.weapons.scar_npc.g_barrel_medium.barrel_ext = Vector3(0, 0, 0) --[0 16.75563 -0.007203754]
NPCWeap.weapons.scar_npc.g_barrel_long = {}
NPCWeap.weapons.scar_npc.g_barrel_long.barrel_ext = Vector3(0, 8.21512, 0) --[0 24.97075 -0.007203754]

NPCWeap.weapons.scar_npc.barrel_ext = {
  [1] = "scar_none",
  [2] = "scar_g_ns_firepig",
  [3] = "scar_g_ns_jprifles",
  [4] = "scar_g_ns_linear",
  [5] = "scar_g_ns_medium",
  [6] = "scar_g_ns_silencer_large",
  [7] = "scar_g_ns_small",
  [8] = "scar_g_ns_stubby",
  [9] = "scar_g_ns_surefire",
  [10] = "scar_g_ns_tank",
  [11] = "scar_g_ns_pbs1",
  [12] = "scar_g_ns_flashhider",
  [13] = "random",
}
NPCWeap.loaded_options.scar_npc.barrel_ext = NPCWeap.loaded_options.scar_npc.barrel_ext or 1
NPCWeap.weapons.scar_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.scar_npc.g_ns_firepig = {}
NPCWeap.weapons.scar_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.scar_npc.g_ns_jprifles = {}
NPCWeap.weapons.scar_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.scar_npc.g_ns_linear = {}
NPCWeap.weapons.scar_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.scar_npc.g_ns_medium = {}
NPCWeap.weapons.scar_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.scar_npc.g_ns_silencer_large = {}
NPCWeap.weapons.scar_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.scar_npc.g_ns_small = {}
NPCWeap.weapons.scar_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.scar_npc.g_ns_stubby = {}
NPCWeap.weapons.scar_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.scar_npc.g_ns_surefire = {}
NPCWeap.weapons.scar_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.scar_npc.g_ns_tank = {}
NPCWeap.weapons.scar_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.scar_npc.g_ns_pbs1 = {}
NPCWeap.weapons.scar_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)
NPCWeap.weapons.scar_npc.g_ns_flashhider = {}
NPCWeap.weapons.scar_npc.g_ns_flashhider.length = Vector3(0, 10.04417, 0)


NPCWeap.weapons.scar_npc.sight = {
  [1] = "scar_none",
  [2] = "scar_g_optics_flipup",
  [3] = "scar_g_optics_aimpoint",
  [4] = "scar_g_optics_docter",
  [5] = "scar_g_optics_eotech",
  [6] = "scar_g_optics_specter",
  [7] = "scar_g_optics_t1micro",
  [8] = "scar_g_optics_cmore",
  [9] = "scar_g_optics_aimpoint_preorder",
  [10] = "scar_g_optics_eotech_xps",
  [11] = "scar_g_optics_reflex",
  [12] = "scar_g_optics_rx01",
  [13] = "scar_g_optics_rx30",
  [14] = "scar_g_optics_cs",
  [15] = "scar_g_optics_acog",
  [16] = "random"
}
NPCWeap.loaded_options.scar_npc.sight = NPCWeap.loaded_options.scar_npc.sight or 1
NPCWeap.weapons.scar_npc.required_reset.sight = {
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
  "g_optics_flipup_up",
  "g_optics_flipup_down",
}

NPCWeap.weapons.scar_npc.stock = {
  [1] = "scar_g_stock_std",
  [2] = "scar_g_stock_sniper",
  [3] = "random",
}
NPCWeap.loaded_options.scar_npc.stock = NPCWeap.loaded_options.scar_npc.stock or 1
NPCWeap.weapons.scar_npc.required_reset.stock = {}

NPCWeap.weapons.scar_npc.foregrip = {
  [1] = "scar_none",
  [2] = "scar_g_fg_ext",
  [3] = "random",
}
NPCWeap.loaded_options.scar_npc.foregrip = NPCWeap.loaded_options.scar_npc.foregrip or 1
NPCWeap.weapons.scar_npc.required_reset.foregrip = {}

NPCWeap.weapons.scar_npc.grip = {
  [1] = "scar_g_grip_m4",
  [2] = "scar_g_grip_ergo",
  [3] = "scar_g_grip_hgrip",
  [4] = "scar_g_grip_mgrip",
  [5] = "random",
}
NPCWeap.loaded_options.scar_npc.grip = NPCWeap.loaded_options.scar_npc.grip or 1
NPCWeap.weapons.scar_npc.required_reset.grip = {}

NPCWeap.weapons.scar_npc.attachment = {
  [1] = "scar_none",
  [2] = "scar_g_attachment_peqbox",
  [3] = "scar_g_attachment_surefire",
  [4] = "scar_g_attachment_laser",
  [5] = "scar_g_attachment_peq",
  [6] = "random",
}
NPCWeap.loaded_options.scar_npc.attachment = NPCWeap.loaded_options.scar_npc.attachment or 1
NPCWeap.weapons.scar_npc.required_reset.attachment = {}

NPCWeap.weapons.scar_npc.vertical_grip = {
  [1] = "scar_none",
  [2] = "scar_g_vg_afg",
  [3] = "random",
}
NPCWeap.loaded_options.scar_npc.vertical_grip = NPCWeap.loaded_options.scar_npc.vertical_grip or 1
NPCWeap.weapons.scar_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.scar_npc.required = {
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_optics_flipup_down" },
  ["g_optics_acog"] = { "g_optics_acog_lens", "g_optics_flipup_down" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_optics_flipup_down" },
  ["g_optics_docter"] = { "g_optics_docter_lens", "g_optics_flipup_down" },
  ["g_optics_specter"] = { "g_optics_specter_glass", "g_optics_flipup_down" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_optics_flipup_down" },
  ["g_optics_cmore"] = { "g_optics_cmore_lens", "g_optics_flipup_down" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_optics_flipup_down" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens", "g_optics_flipup_down" },
  ["g_optics_reflex"] = { "g_optics_reflex_lens", "g_optics_flipup_down" },
  ["g_optics_rx01"] = { "g_optics_rx01_lens", "g_optics_flipup_down" },
  ["g_optics_rx30"] = { "g_optics_rx30_lens", "g_optics_flipup_down" },
  ["g_optics_cs"] = { "g_optics_cs_lens", "g_optics_flipup_down" },
  ["g_optics_flipup"] = { "g_optics_flipup_up" },
}

NPCWeap.weapons.scar_npc.absolute_reset_on_update = {}

NPCWeap.weapons.scar_npc.incompatible = {}

NPCWeap.weapons.scar_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
