Hooks:PostHook(StatisticsManager, "killed", "killcounter_statisticsmanager_killed", function(self)
  local headshot = self._global.session.killed.total.head_shots or 0
  local total = self._global.session.killed.total.count or 0

  managers.hud:update_kill_counter(headshot, total)
end)
