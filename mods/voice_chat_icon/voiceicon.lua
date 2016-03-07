if RequiredScript == "lib/managers/hudmanagerpd2" then
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
elseif RequiredScript == "lib/managers/hud/hudteammate" then
  function HUDTeammate:set_voice_com(status)
    local texture = status and "guis/textures/pd2/jukebox_playing" or "guis/textures/pd2/hud_tabs"
    local texture_rect = status and { 0, 0, 16, 16 } or { 84, 34, 19, 19 }
    local callsign = self._panel:child("callsign")

    callsign:set_image(texture, unpack(texture_rect))
  end
end
