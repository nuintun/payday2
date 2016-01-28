function HUDManager:update_kill_counter(headshots, total)
  self._teammate_panels[HUDManager.PLAYER_PANEL]:update_kill_counter(headshots, total)
end
