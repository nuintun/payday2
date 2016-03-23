--- 注册数据统计击杀回掉
Hooks:PostHook(StatisticsManager, "killed", "kill_counter_statisticsmanager_killed", function(self)
  local headshots = self:session_total_head_shots()
  local total = self:session_total_kills()
  local specials = self:session_total_specials_kills()

  managers.hud:update_kill_counter(headshots, specials, total)
end)
