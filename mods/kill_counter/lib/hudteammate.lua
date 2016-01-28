local function UpdateKillIconAndBG(self)
  local _, _, w, _ = self._kill_text:text_rect()

  self._kill_icon:set_right(self._kill_counter:w() - w)
  self._kill_counter_bg:set_h(self._kill_icon:w() + w)
end

Hooks:PostHook(HUDTeammate, "init", "killcounter_hudteammate_init", function(self)
  local kill_counter_name = "kill_counter_" .. self._id
  local main_player = self._id == HUDManager.PLAYER_PANEL

  if main_player then
    if self._panel:child(kill_counter_name) then
      self._panel:remove(self._panel:child(kill_counter_name))
    end

    local name_label = self._panel:child("name")
    local player_panel = self._panel:child("player")
    local cable_ties_panel = self._panel:child("cable_ties_panel")

    self._kill_counter = self._panel:panel({
      name = kill_counter_name,
      visible = true,
      w = cable_ties_panel:w(),
      h = name_label.h(),
      x = 0,
      halign = "right"
    })

    self._kill_counter:set_rightbottom(player_panel:right(), name_label:bottom())

    self._kill_icon = self._kill_counter:bitmap({
      layer = 1,
      name = "kill_icon",
      texture = "guis/textures/pd2/risklevel_blackscreen",
      w = self._kill_counter:h(),
      h = self._kill_counter:h(),
      blend_mode = KillCounter.blend_mode,
      color = Color(KillCounter.color)
    })

    self._kill_text = self._kill_counter:text({
      layer = 2,
      name = "kill_text",
      text = "0/0",
      w = self._kill_counter:w() - self._kill_icon:w(),
      h = self._kill_counter:h(),
      align = "right",
      vertical = "center",
      color = Color(KillCounter.color),
      font = "fonts/font_medium_mf",
      font_size = self._kill_counter:h()
    })

    self._kill_text:set_right(self._kill_counter:w())

    self._kill_counter_bg = self._kill_counter:bitmap({
      layer = 0,
      name = "kill_counter_bg",
      texture = "guis/textures/pd2/hud_tabs",
      texture_rect = { 84, 0, 44, 32 },
      visible = true,
      color = Color.white / 3,
      x = self._kill_counter:x(),
      y = self._kill_counter:y(),
      w = self._kill_counter:w(),
      h = self._kill_counter:h()
    })

    UpdateKillIconAndBG(self)
  end
end)

function HUDTeammate:update_kill_counter(headshots, total)
  self._kill_text:set_text(headshots .. "/" .. total)

  UpdateKillIconAndBG(self)
end
