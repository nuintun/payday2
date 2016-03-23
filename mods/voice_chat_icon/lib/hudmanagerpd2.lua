function HUDManager:set_mugshot_voice(id, active)
  local panel_id

  for _, data in pairs(managers.criminals:characters()) do
    if data.data.mugshot_id == id then
      panel_id = data.data.panel_id
      break
    end
  end

  if panel_id and panel_id ~= HUDManager.PLAYER_PANEL then
    self._teammate_panels[panel_id]:set_voice_com(active)
  end
end
