Hooks:PostHook(PlayerStandard, "_update_check_actions", "teamExtPlayerStandardUpdateCheckActions", function(self, t, dt)
  if self._camera_unit:base()._melee_item_units then
    managers.hud:update_kill_counter(managers.statistics:session_killed_by_melee(), managers.statistics:session_total_kills())
  elseif not self._camera_unit:base()._melee_item_units then
    managers.hud:update_kill_counter(managers.statistics:session_killed_by_weapon(self._ext_inventory:equipped_unit():base():get_name_id()), managers.statistics:session_total_kills())
  end
end)
