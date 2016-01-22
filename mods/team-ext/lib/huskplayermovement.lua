Hooks:PostHook(HuskPlayerMovement, "_start_bleedout", "teamExtPlayerMovementStartBleedout", function(self, event_desc)
  if not managers.criminals:character_peer_id_by_unit(self._unit) then return end

  local peer_id = managers.criminals:character_peer_id_by_unit(self._unit)
  local peer_panel = managers.hud:get_panel_by_peer_id(peer_id)

  if not peer_panel then return end

  managers.hud:on_peer_downed(peer_panel)
end)
