Hooks:PostHook(UnitNetworkHandler, "sync_doctor_bag_taken", "teamExtUnitNetworkHandlerSyncDoctorBagTaken", function(self, unit, amount, sender)
  local peer = self._verify_sender(sender)
  local peer_id = peer and peer:id()

  if not peer_id then return end

  managers.hud:sync_doctor_bag_taken(managers.hud:get_panel_by_peer_id(peer_id))
end)
