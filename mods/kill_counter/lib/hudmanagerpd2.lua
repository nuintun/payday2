function HUDManager:update_kill_counter(headshot, total)
  self._teammate_panels[HUDManager.PLAYER_PANEL]:update_kill_counter(headshot, total)
end
