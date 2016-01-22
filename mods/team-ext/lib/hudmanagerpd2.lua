function HUDManager:get_panel_by_peer_id(peer_id)
  for panel, data in pairs(self._teammate_panels) do
    if data._peer_id == peer_id then
      return panel
    end
  end
end

function HUDManager:update_downed_counter(value)
  self._teammate_panels[HUDManager.PLAYER_PANEL]:set_downed(value)
end

function HUDManager:update_kill_counter(weapon, total)
  self._teammate_panels[HUDManager.PLAYER_PANEL]:update_kill_counter(weapon, total)
end

function HUDManager:sync_doctor_bag_taken(panel)
  self._teammate_panels[panel]:sync_doctor_bag_taken()
end

function HUDManager:on_peer_downed(panel)
  self._teammate_panels[panel]:on_peer_downed()
end
