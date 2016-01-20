log("benelli_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_benelli_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["benelli_none"] = "None",
    --Barrels
    ["benelli_g_barrel_std"] = "Standard",
    ["benelli_g_barrel_short"] = "Short",
    ["benelli_g_barrel_long"] = "Long",
    --Barrel Extensions
    ["benelli_g_ns_shark"] = "Shark",
    ["benelli_g_ns_thick"] = "Thick",
    ["benelli_g_ns_king"] = "THE King",
    --Body
    --	None, body can't be modified
    --Foregrips
    --	None, foregrips can't be modified
    --Optics
    ["benelli_g_optics_aimpoint"] = "Aimpoint",
    ["benelli_g_optics_docter"] = "Docter",
    ["benelli_g_optics_eotech"] = "EOtech",
    ["benelli_g_optics_specter"] = "Specter",
    ["benelli_g_optics_t1micro"] = "t1micro",
    ["benelli_g_optics_cmore"] = "cmore",
    ["benelli_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["benelli_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["benelli_g_optics_reflex"] = "Reflex",
    ["benelli_g_optics_rx01"] = "RX01",
    ["benelli_g_optics_rx30"] = "RX30",
    ["benelli_g_optics_cs"] = "Aimpoint CS",
    ["benelli_g_optics_acog"] = "Acog Sight",
    --Stocks
    ["benelli_g_stock_solid"] = "Solid",
    ["benelli_g_stock_collapsable"] = "Collapsable",
    ["benelli_g_stock_collapsabled"] = "Collaps'd",
    --Attachments
    ["benelli_g_attachment_rail"] = "Attachment Rail",
    ["benelli_g_attachment_peqbox"] = "Laser Module",
    ["benelli_g_attachment_surefire"] = "Flashlight",
    ["benelli_g_attachment_laser"] = "Laser Module 2",
    ["benelli_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.benelli_npc = NPCWeap.weapons.benelli_npc or {}
NPCWeap.weapons.benelli_npc.required_reset = NPCWeap.weapons.benelli_npc.required_reset or {}
NPCWeap.weapons.benelli_npc.name_id = "benelli_npc"
NPCWeap.weapons.benelli_npc.display_name = "XM1014"
NPCWeap.weapons.benelli_npc.unit = "units/payday2/weapons/wpn_npc_benelli/wpn_npc_benelli"
NPCWeap.weapons.benelli_npc.object_sub = 9
NPCWeap.loaded_options.benelli_npc = NPCWeap.loaded_options.benelli_npc or {}

NPCWeap.weapons.benelli_npc.objects_init = {
  "g_barrel_std",
  "g_body_std",
  "g_body_bolt",
  "g_fg_std",
  "g_stock_solid",
  "g_attachment_rail",
  "g_attachment_surefire",
}

NPCWeap.weapons.benelli_npc.categories = {
  "barrel",
  "barrel_ext",
  "sight",
  "stock",
  "attachment",
}

NPCWeap.weapons.benelli_npc.barrel = {
  [1] = "benelli_g_barrel_std",
  [2] = "benelli_g_barrel_short",
  [3] = "benelli_g_barrel_long",
  [4] = "random",
}
NPCWeap.loaded_options.benelli_npc.barrel = NPCWeap.loaded_options.benelli_npc.barrel or 1
NPCWeap.weapons.benelli_npc.required_reset.barrel = {}
NPCWeap.weapons.benelli_npc.barrel_fire_offset = Vector3(0, -43.09261, -0.3042422)
NPCWeap.weapons.benelli_npc.g_barrel_std = {}
NPCWeap.weapons.benelli_npc.g_barrel_std.barrel_ext = Vector3(0, 43.09261, 0.3042422) -- [0 43.09261 0.30424]
NPCWeap.weapons.benelli_npc.g_barrel_short = {}
NPCWeap.weapons.benelli_npc.g_barrel_short.barrel_ext = Vector3(0, 32.37598, 0.3042422) --[0 32.37598 0.3042422]
NPCWeap.weapons.benelli_npc.g_barrel_long = {}
NPCWeap.weapons.benelli_npc.g_barrel_long.barrel_ext = Vector3(0, 49.22952, 0.3042422) -- [0 49.22952 0.3042422]

NPCWeap.weapons.benelli_npc.barrel_ext = {
  [1] = "benelli_none",
  [2] = "benelli_g_ns_shark",
  [3] = "benelli_g_ns_thick",
  [4] = "benelli_g_ns_king",
  [5] = "random",
}
NPCWeap.loaded_options.benelli_npc.barrel_ext = NPCWeap.loaded_options.benelli_npc.barrel_ext or 1
NPCWeap.weapons.benelli_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.benelli_npc.g_ns_shark = {}
NPCWeap.weapons.benelli_npc.g_ns_shark.length = Vector3(0, 6.7632, 0)
NPCWeap.weapons.benelli_npc.g_ns_thick = {}
NPCWeap.weapons.benelli_npc.g_ns_thick.length = Vector3(0, 17.40295, 0)
NPCWeap.weapons.benelli_npc.g_ns_king = {}
NPCWeap.weapons.benelli_npc.g_ns_king.length = Vector3(0, 7.6996, 0)

NPCWeap.weapons.benelli_npc.sight = {
  [1] = "benelli_none",
  [2] = "benelli_g_optics_aimpoint",
  [3] = "benelli_g_optics_docter",
  [4] = "benelli_g_optics_eotech",
  [5] = "benelli_g_optics_specter",
  [6] = "benelli_g_optics_t1micro",
  [7] = "benelli_g_optics_cmore",
  [8] = "benelli_g_optics_aimpoint_preorder",
  [9] = "benelli_g_optics_eotech_xps",
  [10] = "benelli_g_optics_reflex",
  [11] = "benelli_g_optics_rx01",
  [12] = "benelli_g_optics_rx30",
  [13] = "benelli_g_optics_cs",
  [14] = "benelli_g_optics_acog",
  [15] = "random"
}
NPCWeap.loaded_options.benelli_npc.sight = NPCWeap.loaded_options.benelli_npc.sight or 1
NPCWeap.weapons.benelli_npc.required_reset.sight = {
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

NPCWeap.weapons.benelli_npc.stock = {
  [1] = "benelli_g_stock_solid",
  [2] = "benelli_g_stock_collapsable",
  [3] = "benelli_g_stock_collapsabled",
  [4] = "random",
}
NPCWeap.loaded_options.benelli_npc.stock = NPCWeap.loaded_options.benelli_npc.stock or 1
NPCWeap.weapons.benelli_npc.required_reset.stock = {}

NPCWeap.loaded_options.benelli_npc.foregrip = NPCWeap.loaded_options.benelli_npc.foregrip or 1
NPCWeap.weapons.benelli_npc.required_reset.foregrip = {}

NPCWeap.weapons.benelli_npc.attachment = {
  [1] = "benelli_none",
  [2] = "benelli_g_attachment_surefire",
  [3] = "benelli_g_attachment_laser",
  [4] = "benelli_g_attachment_peq",
  [5] = "benelli_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.benelli_npc.attachment = NPCWeap.loaded_options.benelli_npc.attachment or 1
NPCWeap.weapons.benelli_npc.required_reset.attachment = {
  "g_attachment_rail"
}

NPCWeap.weapons.benelli_npc.required = {
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
  ["g_attachment_surefire"] = { "g_attachment_rail" },
  ["g_attachment_laser"] = { "g_attachment_rail" },
  ["g_attachment_peq"] = { "g_attachment_rail" },
  ["g_attachment_peqbox"] = { "g_attachment_rail" },
}

NPCWeap.weapons.benelli_npc.incompatible = {}

NPCWeap.weapons.benelli_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
