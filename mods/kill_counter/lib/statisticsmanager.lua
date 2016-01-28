Hooks:PostHook(StatisticsManager, "killed", "killcounter_statisticsmanager_killed", function(self, data)
  local name_id, throwable_id = self:_get_name_id_and_throwable_id(data.weapon_unit)

  if data.variant == "melee" then
    managers.hud:update_kill_counter(self._global.session.killed.total.melee or 0, self._global.session.killed.total.count or 0)
  elseif not throwable_id then
    managers.hud:update_kill_counter(self._global.session.killed_by_weapon[name_id] and self._global.session.killed_by_weapon[name_id].count or 0, self._global.session.killed.total.count or 0)
  end

  self._teammate_panels[HUDManager.PLAYER_PANEL]:update_kill_counter(weapon, total)
end)
