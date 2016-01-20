log("raging_bull_npc loaded")
--noinspection UnusedDef
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_raging_bull_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["raging_bull_none"] = "None",
    --Barrels
    ["raging_bull_g_barrel_long"] = "Long",
    ["raging_bull_g_barrel_short"] = "Short",
    ["raging_bull_g_barrel_standard"] = "Standard",
    ["raging_bull_g_barrel_comp1"] = "Comp1",
    ["raging_bull_g_barrel_comp2"] = "Comp2",
    --Barrel Extensions
    ["raging_bull_g_ns_flash"] = "Flashy",
    --Body
    ["raging_bull_g_body_cylinder"] = "Standard",
    ["raging_bull_g_body_cylinder_smooth"] = "Silky Smooth",
    --Grips
    ["raging_bull_g_grip_std"] = "Standard",
    ["raging_bull_g_grip_ergo"] = "ERGO",
    --Optics
    ["raging_bull_g_optics_aimpoint"] = "Aimpoint",
    ["raging_bull_g_optics_docter"] = "Docter",
    ["raging_bull_g_optics_eotech"] = "EOtech",
    ["raging_bull_g_optics_specter"] = "Specter",
    ["raging_bull_g_optics_t1micro"] = "t1micro",
    ["raging_bull_g_optics_cmore"] = "cmore",
    ["raging_bull_g_optics_aimpoint_preorder"] = "Aimpoint preorder",
    ["raging_bull_g_optics_eotech_xps"] = "EOtech Gage Courier",
    ["raging_bull_g_optics_reflex"] = "Reflex",
    ["raging_bull_g_optics_rx01"] = "RX01",
    ["raging_bull_g_optics_rx30"] = "RX30",
    ["raging_bull_g_optics_cs"] = "Aimpoint CS",
  })
end)

NPCWeap.weapons.raging_bull_npc = NPCWeap.weapons.raging_bull_npc or {}
NPCWeap.weapons.raging_bull_npc.required_reset = NPCWeap.weapons.raging_bull_npc.required_reset or {}
NPCWeap.weapons.raging_bull_npc.name_id = "raging_bull_npc"
NPCWeap.weapons.raging_bull_npc.display_name = "Bronco"
NPCWeap.weapons.raging_bull_npc.unit = "units/payday2/weapons/wpn_npc_raging_bull/wpn_npc_raging_bull"
NPCWeap.weapons.raging_bull_npc.object_sub = 13
NPCWeap.loaded_options.raging_bull_npc = NPCWeap.loaded_options.raging_bull_npc or {}

NPCWeap.weapons.raging_bull_npc.objects_init = {
  "g_barrel_long",
  "g_body_bullets",
  "g_body_cylinder",
  "g_body_hammer",
  "g_body_lock",
  "g_body_sight",
  "g_body_std",
  "g_grip_std"
}

NPCWeap.weapons.raging_bull_npc.categories = {
  "body",
  "barrel",
  "barrel_ext",
  "sight",
  "grip",
}

NPCWeap.weapons.raging_bull_npc.body = {
  [1] = "raging_bull_g_body_cylinder",
  [2] = "raging_bull_g_body_cylinder_smooth",
  [3] = "random",
}
NPCWeap.loaded_options.raging_bull_npc.body = NPCWeap.loaded_options.raging_bull_npc.body or 1
NPCWeap.weapons.raging_bull_npc.required_reset.body = {}

NPCWeap.weapons.raging_bull_npc.barrel = {
  [1] = "raging_bull_g_barrel_standard",
  [2] = "raging_bull_g_barrel_short",
  [3] = "raging_bull_g_barrel_long",
  [4] = "raging_bull_g_barrel_comp1",
  [5] = "raging_bull_g_barrel_comp2",
  [6] = "random",
}
NPCWeap.loaded_options.raging_bull_npc.barrel = NPCWeap.loaded_options.raging_bull_npc.barrel or 1
NPCWeap.weapons.raging_bull_npc.required_reset.barrel = {}
NPCWeap.weapons.raging_bull_npc.barrel_fire_offset = Vector3(-0.06345347, -23.64157, -0.4078691)
NPCWeap.weapons.raging_bull_npc.g_barrel_standard = {}
NPCWeap.weapons.raging_bull_npc.g_barrel_standard.barrel_ext = Vector3(0.06345347, 15.84543, 0.4078691) -- [0.06345347 15.84543 0.4078691]
NPCWeap.weapons.raging_bull_npc.g_barrel_short = {}
NPCWeap.weapons.raging_bull_npc.g_barrel_short.barrel_ext = Vector3(0.06345347, 8.787053, 0.4078691) -- [0.06345347 8.787053 0.4078691]
NPCWeap.weapons.raging_bull_npc.g_barrel_long = {}
NPCWeap.weapons.raging_bull_npc.g_barrel_long.barrel_ext = Vector3(0.06345347, 23.64157, 0.4078691) -- [0.06345347 23.64157 0.4078691]
NPCWeap.weapons.raging_bull_npc.g_barrel_comp1 = {}
NPCWeap.weapons.raging_bull_npc.g_barrel_comp1.barrel_ext = Vector3(0.06345347, 19.29396, 0.4078691) -- [0.06345347 19.29396 0.4078691]
NPCWeap.weapons.raging_bull_npc.g_barrel_comp2 = {}
NPCWeap.weapons.raging_bull_npc.g_barrel_comp2.barrel_ext = Vector3(0.06345347, 16.50861, 0.4078691) -- [0.06345347 16.50861 0.4078691]


NPCWeap.weapons.raging_bull_npc.barrel_ext = {
  [1] = "raging_bull_none",
  [2] = "raging_bull_g_ns_flash",
  [3] = "random",
}
NPCWeap.loaded_options.raging_bull_npc.barrel_ext = NPCWeap.loaded_options.raging_bull_npc.barrel_ext or 1
NPCWeap.weapons.raging_bull_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.raging_bull_npc.g_ns_flash = {}
NPCWeap.weapons.raging_bull_npc.g_ns_flash.length = Vector3(0, 4.87549, 0)

NPCWeap.weapons.raging_bull_npc.sight = {
  [1] = "raging_bull_none",
  [2] = "raging_bull_g_optics_aimpoint",
  [3] = "raging_bull_g_optics_docter",
  [4] = "raging_bull_g_optics_eotech",
  [5] = "raging_bull_g_optics_specter",
  [6] = "raging_bull_g_optics_t1micro",
  [7] = "raging_bull_g_optics_cmore",
  [8] = "raging_bull_g_optics_aimpoint_preorder",
  [9] = "raging_bull_g_optics_eotech_xps",
  [10] = "raging_bull_g_optics_reflex",
  [11] = "raging_bull_g_optics_rx01",
  [12] = "raging_bull_g_optics_rx30",
  [13] = "raging_bull_g_optics_cs",
  [14] = "random",
}
NPCWeap.loaded_options.raging_bull_npc.sight = NPCWeap.loaded_options.raging_bull_npc.sight or 1
NPCWeap.weapons.raging_bull_npc.required_reset.sight = {
  "g_optics_eotech_gfx_lens",
  "g_optics_aimpoint_glass",
  "g_optics_spectre_glass",
  "g_optics_t1micro_glass",
  "g_optics_cmore_gfx_lens",
  "g_optics_aimpoint_preorder_glass",
  "g_optics_eotech_xps_lens",
  "g_optics_reflex_gfx_lens",
  "g_optics_rx01_gfx_lens",
  "g_optics_rx30_gfx_lens",
  "g_optics_cs_lens",
  "g_optics_adapter",
}

NPCWeap.weapons.raging_bull_npc.grip = {
  [1] = "raging_bull_g_grip_std",
  [2] = "raging_bull_g_grip_ergo",
  [3] = "random",
}
NPCWeap.loaded_options.raging_bull_npc.grip = NPCWeap.loaded_options.raging_bull_npc.grip or 1
NPCWeap.weapons.raging_bull_npc.required_reset.grip = {}

NPCWeap.weapons.raging_bull_npc.required = {
  ["g_optics_eotech"] = { "g_optics_eotech_gfx_lens", "g_optics_adapter" },
  ["g_optics_aimpoint"] = { "g_optics_aimpoint_glass", "g_optics_adapter" },
  ["g_optics_docter"] = { "g_optics_adapter" },
  ["g_optics_specter"] = { "g_optics_spectre_glass", "g_optics_adapter" },
  ["g_optics_t1micro"] = { "g_optics_t1micro_glass", "g_optics_adapter" },
  ["g_optics_cmore"] = { "g_optics_cmore_gfx_lens", "g_optics_adapter" },
  ["g_optics_aimpoint_preorder"] = { "g_optics_aimpoint_preorder_glass", "g_optics_adapter" },
  ["g_optics_eotech_xps"] = { "g_optics_eotech_xps_lens", "g_optics_adapter" },
  ["g_optics_reflex"] = { "g_optics_reflex_gfx_lens", "g_optics_adapter" },
  ["g_optics_rx01"] = { "g_optics_rx01_gfx_lens", "g_optics_adapter" },
  ["g_optics_rx30"] = { "g_optics_rx30_gfx_lens", "g_optics_adapter" },
  ["g_optics_cs"] = { "g_optics_cs_lens", "g_optics_adapter" },
}

NPCWeap.weapons.raging_bull_npc.incompatible = {}

NPCWeap.weapons.raging_bull_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
