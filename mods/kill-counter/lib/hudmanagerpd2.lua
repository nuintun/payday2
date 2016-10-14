--- 击杀统计更新回掉
-- @param headshots
-- @param specials
-- @param total
function HUDManager:update_kill_counter(headshots, specials, total)
  self._teammate_panels[HUDManager.PLAYER_PANEL]:update_kill_counter(headshots, specials, total)
end
