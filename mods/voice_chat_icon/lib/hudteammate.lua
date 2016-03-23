function HUDTeammate:set_voice_com(status)
  local texture = status and "guis/textures/pd2/jukebox_playing" or "guis/textures/pd2/hud_tabs"
  local texture_rect = status and { 0, 0, 16, 16 } or { 84, 34, 19, 19 }
  local callsign = self._panel:child("callsign")

  callsign:set_image(texture, unpack(texture_rect))
end
