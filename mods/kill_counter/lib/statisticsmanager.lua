Hooks:PostHook(StatisticsManager, "killed", "killcounter_statisticsmanager_killed", function(self)
  local headshots = self:session_total_head_shots()
  local total = self:session_total_kills()
  local specials = self:session_total_specials_kills()

  managers.hud:update_kill_counter(headshots, specials, total)
end)
