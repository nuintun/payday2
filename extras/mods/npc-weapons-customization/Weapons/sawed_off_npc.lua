log("mossberg_npc loaded")
Hooks:Add("LocalizationManagerPostInit", "NPCWeap_sawed_off_Localization", function(loc)
  LocalizationManager:add_localized_strings({
    ["random"] = "Random",
    ["sawed_off_none"] = "None",
    --Barrels
    ["sawed_off_g_barrel_long"] = "Long",
    ["sawed_off_g_barrel_short"] = "Short",
    --Barrel Extensions
    --	None, no modifications availiable
    --Body
    --	None, no modifications availiable
    --Foregrips
    --	None, no modifications availiable
    --Grips
    --	None, no modifications availiable
    --Magazines
    --	None, no modifications availiable
    --Optics
    --	None, no modifications availiable
    --Stocks
    ["sawed_off_g_stock_long"] = "Long",
    ["sawed_off_g_stock_short"] = "Short",
    --Attachments
    --	None, no modifications availiable

    --Easiest weapon to make. gg
  })
end)

NPCWeap.weapons.mossberg_npc = NPCWeap.weapons.mossberg_npc or {}
NPCWeap.weapons.mossberg_npc.required_reset = NPCWeap.weapons.mossberg_npc.required_reset or {}
NPCWeap.weapons.mossberg_npc.name_id = "mossberg_npc"
NPCWeap.weapons.mossberg_npc.display_name = "Sawed off Shotgun"
NPCWeap.weapons.mossberg_npc.unit = "units/payday2/weapons/wpn_npc_sawnoff_shotgun/wpn_npc_sawnoff_shotgun"
NPCWeap.weapons.mossberg_npc.object_sub = 11
NPCWeap.loaded_options.mossberg_npc = NPCWeap.loaded_options.mossberg_npc or {}

NPCWeap.weapons.mossberg_npc.objects_init = {
  "g_barrel_short",
  "g_body_lock",
  "g_body_mech",
  "g_stock_short"
}

NPCWeap.weapons.mossberg_npc.categories = {
  "barrel",
  "stock",
}

NPCWeap.weapons.mossberg_npc.barrel = {
  [1] = "sawed_off_g_barrel_long",
  [2] = "sawed_off_g_barrel_short",
  [3] = "random",
}
NPCWeap.loaded_options.mossberg_npc.barrel = NPCWeap.loaded_options.mossberg_npc.barrel or 1
NPCWeap.weapons.mossberg_npc.required_reset.barrel = {}
NPCWeap.weapons.mossberg_npc.g_barrel_long = {}
NPCWeap.weapons.mossberg_npc.g_barrel_long.barrel_ext = Vector3(0, 20.60367, 0)
NPCWeap.weapons.mossberg_npc.g_barrel_short = {}
NPCWeap.weapons.mossberg_npc.g_barrel_short.barrel_ext = Vector3(0, 0, 0)

NPCWeap.weapons.mossberg_npc.stock = {
  [1] = "sawed_off_g_stock_long",
  [2] = "sawed_off_g_stock_short",
  [3] = "random",
}
NPCWeap.loaded_options.mossberg_npc.stock = NPCWeap.loaded_options.mossberg_npc.stock or 1
NPCWeap.weapons.mossberg_npc.required_reset.stock = {}

NPCWeap.weapons.mossberg_npc.required = {}

NPCWeap.weapons.mossberg_npc.incompatible = {}

NPCWeap.weapons.mossberg_npc.pos_check = {}
