Hooks:PostHook(HUDTeammate, "init", "voice_chat_hudteammate_init", function(self)
  local callsign_bg = self._panel:child("callsign_bg")
  local x = callsign_bg:x() + callsign_bg:w() / 2
  local y = callsign_bg:y() + callsign_bg:h() / 2
  local voice_icon = self._panel:bitmap({
    name = "voice_icon",
    texture = "guis/textures/pd2/jukebox_playing",
    texture_rect = { 0, 0, 16, 16 },
    layer = 1,
    color = tweak_data.chat_colors[self._id]:with_alpha(1),
    w = 11,
    h = 11,
    visible = false,
    valign = "center",
    halign = "center",
    blend_mode = "normal"
  })

  voice_icon:set_center(x, y)
end)

function HUDTeammate:set_voice_com(status)
  local callsign = self._panel:child("callsign")
  local voice_icon = self._panel:child("voice_icon")

  if status then
    callsign:set_visible(false)
    voice_icon:set_visible(true)
  else
    voice_icon:set_visible(false)
    callsign:set_visible(true)
  end
end
