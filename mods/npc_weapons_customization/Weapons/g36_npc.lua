log("g36_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_g36_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["g36_none"] = "None",
    --Barrels
    ["g36_g_barrel_long"] = "Long",
    ["g36_g_barrel_short"] = "Short",
    --Barrel Extensions
    ["g36_g_ns_firepig"] = "Firepig",
    ["g36_g_ns_jprifles"] = "JP Rifles",
    ["g36_g_ns_linear"] = "Linear",
    ["g36_g_ns_medium"] = "Medium",
    ["g36_g_ns_pbs1"] = "PBS",
    ["g36_g_ns_silencer_large"] = "Large Silencer",
    ["g36_g_ns_small"] = "Small",
    ["g36_g_ns_stubby"] = "Stubby Bastard",
    ["g36_g_ns_surefire"] = "Surefire",
    ["g36_g_ns_tank"] = "TANK!",
    --Body
    ["g36_g_body_default"] = "Standard",
    ["g36_g_body_base_sl8"] = "SL8",
    --Foregrips
    ["g36_g_fg_c"] = "C",
    ["g36_g_fg_k"] = "K",
    ["g36_g_fg_ksk"] = "KSK",
    --Vertical grips
    ["g36_g_vg_afg"] = "AFK",
    ["g36_g_vg_standard"] = "Standard",
    ["g36_g_vg_stubby"] = "Stubby",
    --Grips
    --	None, no modifications availiable.
    --Magazines
    --	None, no modifications availiable.
    --Optics
    ["g36_g_optics_aimpoint"] = "Aimpoint",
    ["g36_g_optics_docter"] = "Docter",
    ["g36_g_optics_eotech"] = "EOtech",
    ["g36_g_optics_specter"] = "Specter",
    ["g36_g_optics_t1micro"] = "t1micro",
    ["g36_g_optics_cmore"] = "cmore",
    ["g36_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["g36_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["g36_g_optics_reflex"] = "Reflex",
    ["g36_g_optics_rx01"] = "RX01",
    ["g36_g_optics_rx30"] = "RX30",
    ["g36_g_optics_cs"] = "Aimpoint CS",
    ["g36_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["g36_g_stock_kv"] = "KV",
    ["g36_g_stock_sl8"] = "SL8",
    ["g36_g_stock_standard"] = "Standard",
    --Attachments
    ["g36_g_attachment_peqbox"] = "Laser Module",
    ["g36_g_attachment_surefire"] = "Flashlight",
    ["g36_g_attachment_laser"] = "Laser Module 2",
    ["g36_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.g36_npc = NPCWeap.weapons.g36_npc or {}
NPCWeap.weapons.g36_npc.required_reset = NPCWeap.weapons.g36_npc.required_reset or {}
NPCWeap.weapons.g36_npc.name_id = "g36_npc"
NPCWeap.weapons.g36_npc.display_name = "JP36"
NPCWeap.weapons.g36_npc.unit = "units/payday2/weapons/wpn_npc_g36/wpn_npc_g36"
NPCWeap.weapons.g36_npc.object_sub = 5
NPCWeap.loaded_options.g36_npc = NPCWeap.loaded_options.g36_npc or {}

NPCWeap.weapons.g36_npc.objects_init = {
  "g_barrel_short",
  "g_body_bolt",
  "g_body_default",
  "g_body_handle",
  "g_grip",
  "g_fg_k",
  "g_mag",
  "g_optics_specter",
  "g_optics_spectre_glass",
  "g_stock_kv",
  "g_attachment_surefire"
}

NPCWeap.weapons.g36_npc.categories = {
  "barrel",
  "barrel_ext",
  "sight",
  "stock",
  "foregrip",
  "vertical_grip",
  "attachment",
}

NPCWeap.weapons.g36_npc.barrel = {
  [1] = "g36_g_barrel_long",
  [2] = "g36_g_barrel_short",
  [3] = "random",
}
NPCWeap.loaded_options.g36_npc.barrel = NPCWeap.loaded_options.g36_npc.barrel or 1
NPCWeap.weapons.g36_npc.required_reset.barrel = {}
NPCWeap.weapons.g36_npc.barrel_fire_offset = Vector3(-0.06016494, -7.789139, 0.08964011)
NPCWeap.weapons.g36_npc.g_barrel_short = {}
NPCWeap.weapons.g36_npc.g_barrel_short.barrel_ext = Vector3(0.06016494, 7.789139, -0.08964011) --[0.06016494 7.789139 -0.08964011]
NPCWeap.weapons.g36_npc.g_barrel_long = {}
NPCWeap.weapons.g36_npc.g_barrel_long.barrel_ext = Vector3(0.06016494, 11.60303, -0.08964011) --[0.06016494 11.60303 -0.08964011]

NPCWeap.weapons.g36_npc.barrel_ext = {
  [1] = "g36_none",
  [2] = "g36_g_ns_firepig",
  [3] = "g36_g_ns_jprifles",
  [4] = "g36_g_ns_linear",
  [5] = "g36_g_ns_medium",
  [6] = "g36_g_ns_pbs1",
  [7] = "g36_g_ns_silencer_large",
  [8] = "g36_g_ns_small",
  [9] = "g36_g_ns_stubby",
  [10] = "g36_g_ns_surefire",
  [11] = "g36_g_ns_tank",
  [12] = "random",
}
NPCWeap.loaded_options.g36_npc.barrel_ext = NPCWeap.loaded_options.g36_npc.barrel_ext or 1
NPCWeap.weapons.g36_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.g36_npc.g_ns_firepig = {}
NPCWeap.weapons.g36_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.g36_npc.g_ns_jprifles = {}
NPCWeap.weapons.g36_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.g36_npc.g_ns_linear = {}
NPCWeap.weapons.g36_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.g36_npc.g_ns_medium = {}
NPCWeap.weapons.g36_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.g36_npc.g_ns_silencer_large = {}
NPCWeap.weapons.g36_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.g36_npc.g_ns_small = {}
NPCWeap.weapons.g36_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.g36_npc.g_ns_stubby = {}
NPCWeap.weapons.g36_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.g36_npc.g_ns_surefire = {}
NPCWeap.weapons.g36_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.g36_npc.g_ns_tank = {}
NPCWeap.weapons.g36_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.g36_npc.g_ns_pbs1 = {}
NPCWeap.weapons.g36_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.g36_npc.sight = {
  [1] = "g36_none",
  [2] = "g36_g_optics_aimpoint",
  [3] = "g36_g_optics_docter",
  [4] = "g36_g_optics_eotech",
  [5] = "g36_g_optics_specter",
  [6] = "g36_g_optics_t1micro",
  [7] = "g36_g_optics_cmore",
  [8] = "g36_g_optics_aimpoint_preorder",
  [9] = "g36_g_optics_eotech_xps",
  [10] = "g36_g_optics_reflex",
  [11] = "g36_g_optics_rx01",
  [12] = "g36_g_optics_rx30",
  [13] = "g36_g_optics_cs",
  [14] = "g36_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.g36_npc.sight = NPCWeap.loaded_options.g36_npc.sight or 1
NPCWeap.weapons.g36_npc.required_reset.sight = {
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

NPCWeap.weapons.g36_npc.stock = {
  [1] = "g36_g_stock_standard",
  [2] = "g36_g_stock_kv",
  [3] = "g36_g_stock_sl8",
  [4] = "random",
}
NPCWeap.loaded_options.g36_npc.stock = NPCWeap.loaded_options.g36_npc.stock or 1
NPCWeap.weapons.g36_npc.required_reset.stock = {
  "g_body_base_sl8",
  "g_body_default",
  "g_grip"
}

NPCWeap.weapons.g36_npc.foregrip = {
  [1] = "g36_g_fg_c",
  [2] = "g36_g_fg_k",
  [3] = "g36_g_fg_ksk",
  [4] = "random",
}
NPCWeap.loaded_options.g36_npc.foregrip = NPCWeap.loaded_options.g36_npc.foregrip or 1
NPCWeap.weapons.g36_npc.required_reset.foregrip = {}

NPCWeap.weapons.g36_npc.vertical_grip = {
  [1] = "g36_none",
  [2] = "g36_g_vg_standard",
  [3] = "g36_g_vg_afg",
  [4] = "g36_g_vg_stubby",
  [5] = "random",
}
NPCWeap.loaded_options.g36_npc.vertical_grip = NPCWeap.loaded_options.g36_npc.vertical_grip or 1
NPCWeap.weapons.g36_npc.required_reset.vertical_grip = {}

NPCWeap.weapons.g36_npc.attachment = {
  [1] = "g36_none",
  [2] = "g36_g_attachment_surefire",
  [3] = "g36_g_attachment_laser",
  [4] = "g36_g_attachment_peq",
  [5] = "g36_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.g36_npc.attachment = NPCWeap.loaded_options.g36_npc.attachment or 1
NPCWeap.weapons.g36_npc.required_reset.attachment = {}

NPCWeap.weapons.g36_npc.required = {
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
  ["g_body_default"] = { "g_grip" },
  ["g_stock_sl8"] = { "g_body_base_sl8" },
  ["g_stock_standard"] = { "g_body_default", "g_grip" },
  ["g_stock_kv"] = { "g_body_default", "g_grip" },
}

NPCWeap.weapons.g36_npc.incompatible = {
  ["g36_g_barrel_short"] = { "g36_g_fg_k", "g36_g_fg_ksk" },
  ["g36_g_fg_k"] = { "g36_g_barrel_short" },
  ["g36_g_fg_ksk"] = { "g36_g_barrel_short" },
}

NPCWeap.weapons.g36_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
