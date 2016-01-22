--noinspection UnusedDef
Hooks:PostHook(HUDTeammate, "init", "teamExtTeammateInit", function(self, i, teammates_panel, is_player, width)
  local weapons_panel = self._player_panel:child("weapons_panel")
  local radial_health_panel = self._player_panel:child("radial_health_panel")

  if not self._downs then
    self._downs = {}
  end

  local kill_counter = self._panel:text({
    name = "kill_counter",
    text = "  (0/0)",
    layer = 5,
    color = Color.yellow,
    y = 0,
    vertical = "bottom",
    align = "left",
    --font_size = tweak_data.hud_players.name_size,
    font_size = 20,
    --font = tweak_data.hud_players.name_font
    font = "fonts/font_medium_mf"
  })

  --local _, _, counter_w, _ = kill_counter:text_rect()

  kill_counter:set_right(weapons_panel:right())
  kill_counter:set_top(weapons_panel:bottom())

  if self._main_player then
    local downed_counter = radial_health_panel:text({
      name = "downed_counter",
      text = "0",
      blend_mode = "add",
      alpha = 1,
      --visible = true,
      w = radial_health_panel:w() / 2,
      h = radial_health_panel:h() / 2,
      valign = "center",
      halign = "center",
      font = "fonts/font_medium_mf",
      font_size = 20,
      color = Color.white,
      vertical = "center",
      align = "center",
      layer = 2
    })

    downed_counter:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
  end

  if not self._main_player then
    local downed_counter = radial_health_panel:text({
      name = "downed_counter",
      text = "0",
      blend_mode = "normal",
      --visible = true,
      alpha = 1,
      w = radial_health_panel:w() / 2,
      h = radial_health_panel:h() / 2,
      valign = "center",
      halign = "center",
      font = "fonts/font_medium_mf",
      font_size = 20,
      color = Color.white,
      vertical = "center",
      align = "center",
      layer = 3
    })

    downed_counter:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
  end
end)

--noinspection UnusedDef
Hooks:PostHook(HUDTeammate, "set_condition", "teamExtTeammateSetCondition", function(self, icon_data, text)
  local downed_counter = self._player_panel:child("radial_health_panel"):child("downed_counter")

  if icon_data == "mugshot_in_custody" then
    if self._main_player then
      downed_counter:set_visible(false)
    end

    if not self._main_player and self:peer_id() and managers.network:session() then
      if self._downs and not self._downs[managers.network:session():peer(self:peer_id()):user_id()] then
        self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
      end

      self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0

      downed_counter:set_visible(false)
      downed_counter:set_text(string.format("%d", self._downs[managers.network:session():peer(self:peer_id()):user_id()]))
    end

  else
    if not downed_counter:visible() then
      downed_counter:set_visible((self._main_player and uHUD:HasSetting("downed_counter") or self._peer_id) and true or false)
    end
  end
end)

function HUDTeammate:sync_doctor_bag_taken()
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local downed_counter = radial_health_panel:child("downed_counter")

  if not self._main_player and self:peer_id() and managers.network:session() then
    if self._downs and not self._downs[managers.network:session():peer(self:peer_id()):user_id()] then
      self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
    end

    self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
    downed_counter:set_text(string.format("%d", self._downs[managers.network:session():peer(self:peer_id()):user_id()]))
  end
end

function HUDTeammate:set_downed(value)
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local downed_counter = radial_health_panel:child("downed_counter")

  if self._main_player then
    downed_counter:set_text(tostring(value))
  end
end

function HUDTeammate:on_peer_downed()
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local downed_counter = radial_health_panel:child("downed_counter")

  if not self._downs then self._downs = {} end
  if not self._main_player and self:peer_id() and managers.network:session() then
    if self._downs and not self._downs[managers.network:session():peer(self:peer_id()):user_id()] then
      self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
    end

    self._downs[managers.network:session():peer(self:peer_id()):user_id()] = self._downs[managers.network:session():peer(self:peer_id()):user_id()] + 1

    downed_counter:set_text(string.format("%d", self._downs[managers.network:session():peer(self:peer_id()):user_id()]))
  end
end

function HUDTeammate:update_kill_counter(weapon, total)
  if not self._panel:child("kill_counter") then return end
  if not self._last_kill_count then self._last_kill_count = total end

  --self._panel:child("kill_counter"):set_visible(true)
  self._panel:child("kill_counter"):stop()
  self._panel:child("kill_counter"):set_color(Color.yellow)
  self._panel:child("kill_counter"):set_text("  (" .. tostring(weapon or 0) .. "/" .. tostring(total or 0) .. ")")

  if total ~= self._last_kill_count then
    --noinspection UnusedDef
    self._panel:child("kill_counter"):animate(function(o)
      local red_r = Color.red.red
      local red_g = Color.red.green
      local red_b = Color.red.blue
      local yellow_r = Color.yellow.red
      local yellow_g = Color.yellow.green
      local yellow_b = Color.yellow.blue

      over(0.5, function(p)
        self._panel:child("kill_counter"):set_color(Color(math.lerp(red_r, yellow_r, p), math.lerp(red_g, yellow_g, p), math.lerp(red_b, yellow_b, p)))
      end)

      self._panel:child("kill_counter"):set_color(Color.yellow)
    end)
  end

  self._last_kill_count = total
end
