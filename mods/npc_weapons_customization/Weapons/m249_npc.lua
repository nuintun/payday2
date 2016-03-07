log("m249_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_m249_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["m249_none"] = "None",
    --Barrels
    ["m249_g_barrel_long"] = "Long",
    ["m249_g_barrel_short"] = "Short",
    --Barrel Extensions
    ["m249_g_ns_firepig"] = "Firepig",
    ["m249_g_ns_jprifles"] = "JP Rifles",
    ["m249_g_ns_linear"] = "Linear",
    ["m249_g_ns_medium"] = "Medium",
    ["m249_g_ns_pbs1"] = "PBS",
    ["m249_g_ns_silencer_large"] = "Large Silencer",
    ["m249_g_ns_small"] = "Small",
    ["m249_g_ns_stubby"] = "Stubby Bastard",
    ["m249_g_ns_surefire"] = "Surefire",
    ["m249_g_ns_tank"] = "TANK!",
    --Body
    --	None, no modifications availiable.
    --Foregrips
    ["m249_g_fg_std"] = "Standard",
    ["m249_g_fg_mk46"] = "MK46",
    --Grips
    --	None, no modifications availiable.
    --Magazines
    ["m249_g_mag_lid"] = "Lid",
    --Optics
    --	None, no modifications availiable.
    --Stocks
    ["m249_g_stock_solid"] = "Solid",
    ["m249_g_stock_para"] = "Para",
    ["m249_g_stock_m4_crane"] = "M4 Crane",
    ["m249_g_stock_m4_mk46"] = "M4 MK46",
    ["m249_g_stock_m4_pts"] = "M4 PTS",
    ["m249_g_stock_m4_std"] = "M4 Standard",
    ["m249_g_stock_m4_ubr"] = "M4 UBR",
    --Attachments
    ["m249_g_attachment_peqbox"] = "Laser Module",
    ["m249_g_attachment_surefire"] = "Flashlight",
    ["m249_g_attachment_laser"] = "Laser Module 2",
    ["m249_g_attachment_peq"] = "PEQ15",
  })
end)

NPCWeap.weapons.m249_npc = NPCWeap.weapons.m249_npc or {}
NPCWeap.weapons.m249_npc.required_reset = NPCWeap.weapons.m249_npc.required_reset or {}
NPCWeap.weapons.m249_npc.name_id = "m249_npc"
NPCWeap.weapons.m249_npc.display_name = "Mice249"
NPCWeap.weapons.m249_npc.unit = "units/payday2/weapons/wpn_npc_lmg_m249/wpn_npc_lmg_m249"
NPCWeap.weapons.m249_npc.object_sub = 6
NPCWeap.loaded_options.m249_npc = NPCWeap.loaded_options.m249_npc or {}

NPCWeap.weapons.m249_npc.objects_init = {
  "g_barrel_short",
  "g_body_bipod",
  "g_body_bolt",
  "g_body_carryhandle",
  "g_body_dustcover",
  "g_body_rearsight",
  "g_body_standard",
  "g_fg_std",
  "g_mag",
  "g_mag_lid",
  "g_mag_band_1",
  "g_mag_band_2",
  "g_mag_band_3",
  "g_mag_band_4",
  "g_mag_bullet_1",
  "g_mag_bullet_2",
  "g_mag_bullet_3",
  "g_mag_bullet_4",
  "g_mag_bullet_5",
  "g_mag_bullet_6",
  "g_mag_bullet_7",
  "g_mag_bullet_8",
  "g_mag_bullet_9",
  "g_mag_bullet_10",
  "g_mag_bullet_11",
  "g_mag_bullet_12",
  "g_mag_bullet_13",
  "g_mag_bullet_14",
  "g_mag_bullet_15",
  "g_stock_solid"
}

NPCWeap.weapons.m249_npc.categories = {
  "barrel",
  "barrel_ext",
  "magazine",
  "stock",
  "foregrip",
  "attachment",
}

NPCWeap.weapons.m249_npc.barrel = {
  [1] = "m249_g_barrel_long",
  [2] = "m249_g_barrel_short",
  [3] = "random",
}
NPCWeap.loaded_options.m249_npc.barrel = NPCWeap.loaded_options.m249_npc.barrel or 1
NPCWeap.weapons.m249_npc.required_reset.barrel = {}
NPCWeap.weapons.m249_npc.barrel_fire_offset = Vector3(0, -3.460175, 0.141226)
NPCWeap.weapons.m249_npc.g_barrel_short = {}
NPCWeap.weapons.m249_npc.g_barrel_short.barrel_ext = Vector3(0, 3.460175, -0.141226) --[0 3.460175 -0.141226]
NPCWeap.weapons.m249_npc.g_barrel_long = {}
NPCWeap.weapons.m249_npc.g_barrel_long.barrel_ext = Vector3(0, 8.102806, -0.141226) --[0 8.102806 -0.141226]

NPCWeap.weapons.m249_npc.barrel_ext = {
  [1] = "m249_none",
  [2] = "m249_g_ns_firepig",
  [3] = "m249_g_ns_jprifles",
  [4] = "m249_g_ns_linear",
  [5] = "m249_g_ns_medium",
  [6] = "m249_g_ns_pbs1",
  [7] = "m249_g_ns_silencer_large",
  [8] = "m249_g_ns_small",
  [9] = "m249_g_ns_stubby",
  [10] = "m249_g_ns_surefire",
  [11] = "m249_g_ns_tank",
  [12] = "random",
}
NPCWeap.loaded_options.m249_npc.barrel_ext = NPCWeap.loaded_options.m249_npc.barrel_ext or 1
NPCWeap.weapons.m249_npc.required_reset.barrel_ext = {}
NPCWeap.weapons.m249_npc.g_ns_firepig = {}
NPCWeap.weapons.m249_npc.g_ns_firepig.length = Vector3(0, 8.11474, 0)
NPCWeap.weapons.m249_npc.g_ns_jprifles = {}
NPCWeap.weapons.m249_npc.g_ns_jprifles.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.m249_npc.g_ns_linear = {}
NPCWeap.weapons.m249_npc.g_ns_linear.length = Vector3(0, 8.0442, 0)
NPCWeap.weapons.m249_npc.g_ns_medium = {}
NPCWeap.weapons.m249_npc.g_ns_medium.length = Vector3(0, 19.41887, 0)
NPCWeap.weapons.m249_npc.g_ns_silencer_large = {}
NPCWeap.weapons.m249_npc.g_ns_silencer_large.length = Vector3(0, 24.89792, 0)
NPCWeap.weapons.m249_npc.g_ns_small = {}
NPCWeap.weapons.m249_npc.g_ns_small.length = Vector3(0, 15.31046, 0)
NPCWeap.weapons.m249_npc.g_ns_stubby = {}
NPCWeap.weapons.m249_npc.g_ns_stubby.length = Vector3(0, 7.90433, 0)
NPCWeap.weapons.m249_npc.g_ns_surefire = {}
NPCWeap.weapons.m249_npc.g_ns_surefire.length = Vector3(0, 7.95938, 0)
NPCWeap.weapons.m249_npc.g_ns_tank = {}
NPCWeap.weapons.m249_npc.g_ns_tank.length = Vector3(0, 7.11834, 0)
NPCWeap.weapons.m249_npc.g_ns_pbs1 = {}
NPCWeap.weapons.m249_npc.g_ns_pbs1.length = Vector3(0, 23.5928, 0)

NPCWeap.weapons.m249_npc.magazine = {
  [1] = "m249_none",
  [2] = "m249_g_mag_lid",
  [3] = "random",
}
NPCWeap.loaded_options.m249_npc.magazine = NPCWeap.loaded_options.m249_npc.magazine or 1
NPCWeap.weapons.m249_npc.required_reset.magazine = {}

NPCWeap.weapons.m249_npc.stock = {
  [1] = "m249_g_stock_solid",
  [2] = "m249_g_stock_para",
  [3] = "m249_g_stock_m4_crane",
  [4] = "m249_g_stock_m4_mk46",
  [5] = "m249_g_stock_m4_pts",
  [6] = "m249_g_stock_m4_std",
  [7] = "m249_g_stock_m4_ubr",
  [8] = "random",
}
NPCWeap.loaded_options.m249_npc.stock = NPCWeap.loaded_options.m249_npc.stock or 1
NPCWeap.weapons.m249_npc.required_reset.stock = {
  "g_stock_m4_adapter"
}

NPCWeap.weapons.m249_npc.foregrip = {
  [1] = "m249_g_fg_std",
  [2] = "m249_g_fg_mk46",
  [3] = "random",
}
NPCWeap.loaded_options.m249_npc.foregrip = NPCWeap.loaded_options.m249_npc.foregrip or 1
NPCWeap.weapons.m249_npc.required_reset.foregrip = {}

NPCWeap.weapons.m249_npc.attachment = {
  [1] = "m249_none",
  [2] = "m249_g_attachment_surefire",
  [3] = "m249_g_attachment_laser",
  [4] = "m249_g_attachment_peq",
  [5] = "m249_g_attachment_peqbox",
  [6] = "random",
}
NPCWeap.loaded_options.m249_npc.attachment = NPCWeap.loaded_options.m249_npc.attachment or 1
NPCWeap.weapons.m249_npc.required_reset.attachment = {}

NPCWeap.weapons.m249_npc.required = {
  ["g_stock_m4_crane"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_mk46"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_pts"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_std"] = { "g_stock_m4_adapter" },
  ["g_stock_m4_ubr"] = { "g_stock_m4_adapter" },
}

NPCWeap.weapons.m249_npc.incompatible = {
  ["m249_g_fg_std"] = { "m249_g_attachment_peqbox", "m249_g_attachment_surefire", "m249_g_attachment_laser", "m249_g_attachment_peq" },
  ["m249_g_attachment_peqbox"] = { "m249_g_fg_std" },
  ["m249_g_attachment_surefire"] = { "m249_g_fg_std" },
  ["m249_g_attachment_laser"] = { "m249_g_fg_std" },
  ["m249_g_attachment_peq"] = { "m249_g_fg_std" },
}

NPCWeap.weapons.m249_npc.pos_check = {
  ["barrel_ext"] = { "barrel" }
}
