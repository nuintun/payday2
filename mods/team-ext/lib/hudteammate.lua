local function ConvertToRGB(hue, saturation, value)
  local red, grn, blu
  local i = math.floor(hue * 6)
  local f = hue * 6 - i
  local p = value * (1 - saturation)
  local q = value * (1 - f * saturation)
  local t = value * (1 - (1 - f) * saturation)
  local m = i % 6

  if m == 0 then
    red = value
    grn = t
    blu = p
  elseif m == 1 then
    red = q
    grn = value
    blu = p
  elseif m == 2 then
    red = p
    grn = value
    blu = t
  elseif m == 3 then
    red = p
    grn = q
    blu = value
  elseif m == 4 then
    red = t
    grn = p
    blu = value
  elseif m == 5 then
    red = value
    grn = p
    blu = q
  end

  return red, grn, blu
end

Hooks:PostHook(HUDTeammate, "init", "teamExtTeammateInit", function(self, i, teammates_panel, is_player, width)
  local radial_health_panel = self._player_panel:child("radial_health_panel")

  if not self._downs then self._downs = {} end

  local name_panel = self._panel:panel({
    name = "name_panel",
    w = self._panel:w() - self._panel:child("callsign_bg"):w() - (not self._main_player and radial_health_panel:w() or 0),
    h = self._panel:child("name_bg"):h(),
    x = self._panel:child("name_bg"):x(),
    y = self._panel:child("name_bg"):y()
  })

  if self._main_player then
    local weapon_panel_primary = self._player_panel:child("weapons_panel"):child("primary_weapon_panel")
    local weapon_panel_secondary = self._player_panel:child("weapons_panel"):child("secondary_weapon_panel")

    local underdog_glow = radial_health_panel:bitmap({
      valign = "center",
      halign = "center",
      w = 64,
      h = 64,
      name = "underdog_glow",
      visible = false,
      texture = "guis/textures/pd2/crimenet_marker_glow",
      texture_rect = { 0, 0, 64, 64 },
      color = Color.yellow,
      layer = 2,
      blend_mode = "add"
    })

    underdog_glow:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)

    local radial_stamina = radial_health_panel:bitmap({
      name = "radial_stamina",
      color = Color(1, 1, 0, 0),
      texture = "guis/textures/pd2/hud_radial_rim",
      texture_rect = { 64, 0, -64, 64 },
      render_template = "VertexColorTexturedRadial",
      blend_mode = "normal",
      alpha = 1,
      visible = uHUD:HasSetting("stamina") and true or false,
      w = radial_health_panel:w() / 2.4,
      h = radial_health_panel:h() / 2.4,
      layer = 2
    })

    radial_stamina:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)

    local radial_stamina_warning = radial_health_panel:bitmap({
      name = "radial_stamina_warning",
      texture = "guis/textures/pd2/hud_radial_rim",
      texture_rect = {
        64,
        0,
        -64,
        64
      },
      blend_mode = "add",
      color = Color.red,
      alpha = 1,
      visible = false,
      w = radial_health_panel:w() / 2.4,
      h = radial_health_panel:h() / 2.4,
      layer = 1
    })

    radial_stamina_warning:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)

    local downed_counter = radial_health_panel:text({
      name = "downed_counter",
      text = "0",
      blend_mode = "add",
      alpha = 1,
      visible = uHUD:HasSetting("downed_counter") and true or false,
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

    if managers.player:has_category_upgrade("player", "armor_health_store_amount") then

      radial_stamina:set_size(radial_health_panel:w() / 3.25, radial_health_panel:h() / 3.25)
      radial_stamina:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
      radial_stamina_warning:set_size(radial_health_panel:w() / 3.25, radial_health_panel:h() / 3.25)
      radial_stamina_warning:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)

      downed_counter:set_font_size(14)
      downed_counter:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
    end

    local armor_timer = radial_health_panel:text({
      name = "armor_timer",
      text = "0.0s",
      blend_mode = "normal",
      visible = false,
      alpha = 1,
      w = radial_health_panel:w() / 2,
      h = radial_health_panel:h() / 2,
      x = radial_health_panel:x(),
      y = radial_health_panel:y() - 4,
      font = "fonts/font_medium_shadow_mf",
      font_size = 22,
      color = Color.white,
      align = "center",
      layer = 2
    })

    local health_warning = radial_health_panel:bitmap({
      name = "health_warning",
      texture = "guis/textures/pd2/hud_health",
      texture_rect = {
        64,
        0,
        -64,
        64
      },
      color = Color.red,
      blend_mode = "add",
      alpha = 1,
      visible = false,
      w = radial_health_panel:w(),
      h = radial_health_panel:h(),
      layer = 1
    })

    health_warning:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
    health_warning:set_color(tweak_data.hud.detected_color)

    local primary_timer = weapon_panel_primary:text({
      name = "primary_timer",
      visible = false,
      alpha = 0.9,
      text = "0.0s",
      color = Color.white,
      blend_mode = "add",
      layer = 1,
      w = weapon_panel_primary:w(),
      h = weapon_panel_primary:h(),
      vertical = "bottom",
      align = "center",
      font_size = 32,
      font = tweak_data.hud_players.ammo_font
    })

    primary_timer:set_center(weapon_panel_primary:w() / 2 - 6, weapon_panel_primary:h() / 2)
    primary_timer:set_bottom(weapon_panel_primary:child("ammo_clip"):bottom())

    local secondary_timer = weapon_panel_secondary:text({
      name = "secondary_timer",
      visible = false,
      alpha = 0.9,
      text = "0.0s",
      color = Color.white,
      blend_mode = "add",
      layer = 1,
      w = weapon_panel_secondary:w(),
      h = weapon_panel_secondary:h(),
      vertical = "bottom",
      align = "center",
      font_size = 32,
      font = tweak_data.hud_players.ammo_font
    })

    secondary_timer:set_center(weapon_panel_secondary:w() / 2 - 6, weapon_panel_secondary:h() / 2)
    secondary_timer:set_bottom(weapon_panel_secondary:child("ammo_clip"):bottom())

    local kill_counter = self._panel:text({
      name = "kill_counter",
      text = "  (0/0)",
      layer = 5,
      color = Color.yellow,
      y = 0,
      vertical = "bottom",
      align = "left",
      font_size = tweak_data.hud_players.name_size,
      font = tweak_data.hud_players.name_font
    })

    local _, _, counter_w, _ = kill_counter:text_rect()
    kill_counter:set_bottom(self._panel:child("name_bg"):top())
  end

  if not self._main_player then

    local interact_panel = self._player_panel:child("interact_panel")

    local interact_timer = interact_panel:text({
      name = "interact_timer",
      text = "0.0s",
      blend_mode = "add",
      alpha = 1,
      w = interact_panel:w() / 2,
      h = interact_panel:h() / 2,
      valign = "center",
      halign = "center",
      font = "fonts/font_medium_shadow_mf",
      font_size = 20,
      color = Color.white,
      vertical = "center",
      align = "center",
      layer = 3
    })

    interact_timer:set_center(interact_panel:w() / 2, interact_panel:h() / 2)

    local interact_text = name_panel:text({
      name = "interact_text",
      text = "",
      layer = 1,
      visible = false,
      color = Color.white,
      w = self._panel:child("name"):w(),
      h = self._panel:child("name"):h(),
      vertical = "bottom",
      font_size = tweak_data.hud_players.name_size,
      font = tweak_data.hud_players.name_font
    })

    local health_warning = radial_health_panel:bitmap({
      name = "health_warning",
      texture = "guis/textures/pd2/hud_health",
      texture_rect = {
        64,
        0,
        -64,
        64
      },
      color = Color.red,
      blend_mode = "add",
      alpha = 1,
      visible = false,
      w = radial_health_panel:w(),
      h = radial_health_panel:h(),
      layer = 1
    })

    health_warning:set_center(radial_health_panel:w() / 2, radial_health_panel:h() / 2)
    health_warning:set_color(tweak_data.hud.detected_color)

    local downed_counter = radial_health_panel:text({
      name = "downed_counter",
      text = "0",
      blend_mode = "normal",
      visible = uHUD:HasSetting("downed_counter_teammate") and true or false,
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

  self._new_name = name_panel:text({
    name = "name",
    text = " Dallas",
    layer = 1,
    blend_mode = "add",
    color = Color.white,
    y = 0,
    vertical = "bottom",
    font_size = tweak_data.hud_players.name_size,
    font = tweak_data.hud_players.name_font
  })

  self._panel:child("name"):set_visible(false)

  local infamy_rank = self._panel:text({
    name = "infamy_rank",
    text = "0",
    blend_mode = "add",
    alpha = 1,
    visible = false,
    w = self._panel:child("callsign"):h(),
    h = self._panel:child("callsign"):h(),
    x = self._panel:child("callsign"):x(),
    y = self._panel:child("callsign"):y(),
    valign = "center",
    halign = "center",
    font = "fonts/font_medium_shadow_mf",
    font_size = 19,
    color = Color.white,
    vertical = "center",
    align = "center",
    layer = 1
  })

  local infamy_icon = self._panel:bitmap({
    name = "infamy_icon",
    texture = "guis/textures/pd2/shared_skillpoint_symbol",
    layer = 1,
    alpha = 1,
    visible = false,
    color = tweak_data.chat_colors[i],
    blend_mode = "normal",
    x = self._panel:child("callsign"):x(),
    y = self._panel:child("callsign"):y(),
    w = self._panel:child("callsign"):w(),
    h = self._panel:child("callsign"):h()
  })

  local mask = radial_health_panel:bitmap({
    name = "mask",
    texture = "guis/textures/pd2/blackmarket/icons/masks/alienware",
    layer = 5,
    alpha = 1,
    visible = false,
    blend_mode = "normal",
    w = 64,
    h = 64
  })
end)

Hooks:PostHook(HUDTeammate, "set_name", "uHUDPostHUDTeammateSetName", function(self, teammate_name)

  local teammate_panel = self._panel
  local name = teammate_panel:child("name")
  local name_bg = teammate_panel:child("name_bg")
  local downed_counter = self._player_panel:child("radial_health_panel"):child("downed_counter")

  self._new_name:stop()

  self._new_name:set_text(name:text())

  local x, y, w, h = self._new_name:text_rect()
  self._new_name:set_left(0)
  self._new_name:set_size(w, h)
  name_bg:set_w(self._new_name:w() + 4)

  if self._main_player then

    local character = managers.localization:text("menu_" .. tostring(managers.criminals:local_character_name()))

    local rank = managers.experience:current_rank()
    local level = managers.experience:current_level()
    local experience = (rank > 0 and managers.experience:rank_string(rank) .. "-" or "") .. level

    name:set_text(" " --[[.. character .. " | " ]] .. teammate_name .. (uHUD:HasSetting("player_rank") and (" (" .. experience .. ")") or ""))

    local x, y, w, h = name:text_rect()
    managers.hud:make_fine_text(name)
    name:set_h(h)
    name_bg:set_w(w + 4)

    --[[name:set_range_color( 1 , string.len( character ) + 1 , Color.white )
		name:set_range_color( string.len( character ) + 1 , string.len( character ) + 4 , Color.white:with_alpha( 0.5 ) )]]

    self._new_name:set_h(h)

    self._new_name:set_text(name:text())
    managers.hud:make_fine_text(self._new_name)

    self._new_name:set_left(0)

    self._new_name:set_w(w)

    --[[self._new_name:set_range_color( 1 , string.len( character ) + 1 , Color.white )
		self._new_name:set_range_color( string.len( character ) + 1 , string.len( character ) + 4 , Color.white:with_alpha( 0.5 ) )]]

  elseif self:peer_id() and managers.network:session() then

    if managers.network:session():peer(self:peer_id()):character() then

      local character = managers.localization:text("menu_" .. tostring(managers.criminals:character_name_by_peer_id(self:peer_id())))

      local rank = managers.network:session():peer(self:peer_id()):rank()
      local level = managers.network:session():peer(self:peer_id()):level()
      local experience = (rank > 0 and managers.experience:rank_string(rank) .. "-" or "") .. level

      name:set_text(" " --[[.. character .. " | " ]] .. teammate_name .. (uHUD:HasSetting("player_rank") and (" (" .. experience .. ")") or ""))

      local x, y, w, h = name:text_rect()
      managers.hud:make_fine_text(name)
      name:set_h(h)
      name_bg:set_w(name:w() + 4)

      --[[name:set_range_color( 1 , string.len( character ) + 1 , Color.white )
			name:set_range_color( string.len( character ) + 1 , string.len( character ) + 4 , Color.white:with_alpha( 0.5 ) )]]

      self._new_name:set_h(h)

      self._new_name:set_text(name:text())
      managers.hud:make_fine_text(self._new_name)

      self._new_name:set_left(0)

      self._new_name:set_w(w)

      --[[self._new_name:set_range_color( 1 , string.len( character ) + 1 , Color.white )
			self._new_name:set_range_color( string.len( character ) + 1 , string.len( character ) + 4 , Color.white:with_alpha( 0.5 ) )]]
    end

    if managers.network:session():peer(self:peer_id()):user_id() then

      if self._downs and not self._downs[managers.network:session():peer(self:peer_id()):user_id()] then
        self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
        downed_counter:set_text(string.format("%d", self._downs[managers.network:session():peer(self:peer_id()):user_id()]))
      end
    end
  end

  if self._panel:child("name_panel"):w() < name_bg:w() then
    self._new_name:animate(callback(self, self, "_animate_name"), name_bg:w() - self._panel:child("name_panel"):w() + 2)
  end

  if self._main_player or self._peer_id then

    local character_data

    if self._peer_id then
      character_data = managers.criminals:character_data_by_peer_id(self._peer_id)
    end

    if character_data or self._main_player then

      local mask_id

      if character_data then mask_id = character_data.mask_id else mask_id = managers.blackmarket:equipped_mask().mask_id end

      if tweak_data.blackmarket.masks[mask_id].inaccessible then
        mask_id = string.match(mask_id, "%w+")
      end

      local guis_catalog = "guis/"
      local bundle = tweak_data.blackmarket.masks[mask_id] and tweak_data.blackmarket.masks[mask_id].texture_bundle_folder

      if bundle then
        guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle) .. "/"
      end

      local mask_texture = tweak_data.blackmarket.masks[mask_id].custom_texture or guis_catalog .. "textures/pd2/blackmarket/icons/masks/" .. mask_id

      self._panel:child("mask"):set_image(mask_texture)
    end
  end

  self._panel:child("mask"):set_size(self._main_player and 64 or 48, self._main_player and 64 or 48)
  self._panel:child("mask"):set_center(self._player_panel:child("radial_health_panel"):w() / 2, self._player_panel:child("radial_health_panel"):h() + (self._main_player and 18 or 6))
  self._panel:child("mask"):set_alpha(0.3)
  self._panel:child("mask"):set_visible(not self._ai and (self._main_player and uHUD:HasSetting("mask") or not self._main_player and uHUD:HasSetting("mask_teammate")) and true or false)
end)

--[[Hooks:PostHook( HUDTeammate , "layout_special_equipments" , "uHUDPostHUDTeammateLayoutSpecialEquipments" , function( self )

	local teammate_panel = self._panel
	local special_equipment = self._special_equipment
	local name = teammate_panel:child( "name" )
	local _ , _ , counter_w , _ = self._panel:child( "kill_counter" ):text_rect()
	local w = teammate_panel:w() - ( counter_w + 3 )

	for i , panel in ipairs( special_equipment ) do
		if self._main_player then
			panel:set_x( w - ( panel:w() + 0 ) * i )
			panel:set_y( 0 )
		end
	end

end )]]

Hooks:PostHook(HUDTeammate, "set_callsign", "uHUDPostHUDTeammateSetCallsign", function(self, id)

  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")

  self._panel:child("name"):set_color(uHUD:HasSetting("coloured_name") and tweak_data.chat_colors[id] or Color.white)
  self._new_name:set_color(uHUD:HasSetting("coloured_name") and tweak_data.chat_colors[id] or Color.white)
  self._panel:child("infamy_icon"):set_color(tweak_data.chat_colors[id])

  if not self._main_player and self:peer_id() and managers.network:session() then
    if managers.network:session():peer(self:peer_id()):rank() and managers.network:session():peer(self:peer_id()):rank() > 0 then
      if self._panel:child("infamy_icon") and self._panel:child("infamy_rank") then
        if uHUD:HasSetting("infamy_callsign") or uHUD:HasSetting("infamy_rank") then
          self._panel:child("callsign"):set_visible(false)
        end
        self._panel:child("infamy_icon"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())
        self._panel:child("infamy_icon"):set_visible(uHUD:HasSetting("infamy_callsign") and true or false)

        self._panel:child("infamy_icon"):stop()
        self._panel:child("infamy_rank"):set_color(tweak_data.chat_colors[id])
        self._panel:child("infamy_rank"):set_text(tostring(managers.network:session():peer(self:peer_id()):rank()))
        self._panel:child("infamy_rank"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())

        if uHUD:HasSetting("infamy_rank") and not uHUD:HasSetting("infamy_callsign") then
          self._panel:child("infamy_icon"):set_alpha(0)
          self._panel:child("infamy_rank"):set_visible(true)
          self._panel:child("infamy_rank"):set_alpha(1)
        end

        if uHUD:HasSetting("infamy_rank") and uHUD:HasSetting("infamy_callsign") then
          self._panel:child("infamy_icon"):animate(callback(self, self, "_animate_infamy"), managers.network:session():peer(self:peer_id()):rank())
        end
      end
    else
      if self._panel:child("infamy_icon") and self._panel:child("infamy_rank") then
        self._panel:child("infamy_icon"):stop()

        self._panel:child("infamy_rank"):set_color(tweak_data.chat_colors[id])
        self._panel:child("infamy_rank"):set_alpha(0)
        self._panel:child("infamy_rank"):set_visible(false)


        self._panel:child("infamy_icon"):set_alpha(1)
        self._panel:child("infamy_icon"):set_visible(false)

        self._panel:child("callsign"):set_alpha(1)
        self._panel:child("callsign"):set_visible(true)
      end
    end
  elseif self._main_player then
    if managers.experience and managers.experience:current_rank() > 0 then
      if self._panel:child("infamy_icon") and self._panel:child("infamy_rank") then
        if uHUD:HasSetting("infamy_callsign") or uHUD:HasSetting("infamy_rank") then
          self._panel:child("callsign"):set_visible(false)
        end
        self._panel:child("infamy_icon"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())
        self._panel:child("infamy_icon"):set_visible(uHUD:HasSetting("infamy_callsign") and true or false)

        self._panel:child("infamy_icon"):stop()
        self._panel:child("infamy_rank"):set_color(tweak_data.chat_colors[id])
        self._panel:child("infamy_rank"):set_text(tostring(managers.experience:current_rank()))
        self._panel:child("infamy_rank"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())

        if uHUD:HasSetting("infamy_rank") and not uHUD:HasSetting("infamy_callsign") then
          self._panel:child("infamy_icon"):set_alpha(0)
          self._panel:child("infamy_rank"):set_visible(true)
          self._panel:child("infamy_rank"):set_alpha(1)
        end

        if uHUD:HasSetting("infamy_rank") and uHUD:HasSetting("infamy_callsign") then
          self._panel:child("infamy_icon"):animate(callback(self, self, "_animate_infamy"), managers.experience:current_rank())
        end
      end
    end
  else
    if self._panel:child("infamy_icon") and self._panel:child("infamy_rank") then
      self._panel:child("infamy_icon"):stop()

      if self._panel:child("infamy_rank") then
        self._panel:child("infamy_rank"):set_color(tweak_data.chat_colors[id])
        self._panel:child("infamy_rank"):set_alpha(0)
        self._panel:child("infamy_rank"):set_visible(false)
      end

      self._panel:child("infamy_icon"):set_alpha(1)
      self._panel:child("infamy_icon"):set_visible(false)

      self._panel:child("callsign"):set_alpha(1)
      self._panel:child("callsign"):set_visible(true)
    end
  end
end)

Hooks:PostHook(HUDTeammate, "set_state", "uHUDPostHUDTeammateSetState", function(self, state)

  if not self._main_player then

    self._panel:child("infamy_icon"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())
    self._panel:child("infamy_rank"):set_position(self._panel:child("callsign_bg"):x(), self._panel:child("callsign_bg"):y())

    self._panel:child("name_panel"):set_y(self._panel:child("name"):y())
  end
end)

Hooks:PostHook(HUDTeammate, "set_condition", "uHUDPostHUDTeammateSetCondition", function(self, icon_data, text)

  local downed_counter = self._player_panel:child("radial_health_panel"):child("downed_counter")
  local underdog_glow = self._player_panel:child("radial_health_panel"):child("underdog_glow")
  local armor_timer = self._player_panel:child("radial_health_panel"):child("armor_timer")
  local interact_timer = self._player_panel:child("interact_panel"):child("interact_timer")

  if icon_data == "mugshot_in_custody" then

    if self._main_player then

      downed_counter:set_visible(false)
      underdog_glow:set_visible(false)
      armor_timer:set_visible(false)
    end

    if not self._main_player and self:peer_id() and managers.network:session() then

      if self._downs and not self._downs[managers.network:session():peer(self:peer_id()):user_id()] then
        self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
      end

      self._downs[managers.network:session():peer(self:peer_id()):user_id()] = 0
      downed_counter:set_text(string.format("%d", self._downs[managers.network:session():peer(self:peer_id()):user_id()]))

      downed_counter:set_visible(false)
      interact_timer:set_visible(false)
    end

  else

    if not downed_counter:visible() then downed_counter:set_visible((self._main_player and uHUD:HasSetting("downed_counter") or self._peer_id and uHUD:HasSetting("downed_counter_teammate")) and true or false) end
  end
end)

Hooks:PreHook(HUDTeammate, "teammate_progress", "uHUDPreHUDTeammateTeammateProgress", function(self, enabled, tweak_data_id, timer, success)

  if not self._player_panel:child("interact_panel"):child("interact_timer") then return end

  self._panel:child("name_panel"):child("interact_text"):stop()
  self._panel:child("name_panel"):child("interact_text"):set_left(0)

  if enabled and not self._main_player and self:peer_id() then

    self._new_name:set_alpha(0.2)

    self._panel:child("name_panel"):child("interact_text"):set_visible(uHUD:HasSetting("interaction_text_teammate") and true or false)
    self._panel:child("name_panel"):child("interact_text"):set_text(" " .. managers.hud:_name_label_by_peer_id(self:peer_id()).panel:child("action"):text())

    local x, y, w, h = self._panel:child("name_panel"):child("interact_text"):text_rect()
    self._panel:child("name_panel"):child("interact_text"):set_size(w, h)

    if self._panel:child("name_panel"):child("interact_text"):w() + 4 > self._panel:child("name_bg"):w() then
      self._panel:child("name_bg"):set_w(self._panel:child("name_panel"):child("interact_text"):w() + 4)
    end

    if self._panel:child("name_panel"):w() < self._panel:child("name_panel"):child("interact_text"):w() + 4 then
      self._panel:child("name_panel"):child("interact_text"):animate(callback(self, self, "_animate_name"), self._panel:child("name_bg"):w() - self._panel:child("name_panel"):w() + 2)
    end

  elseif not success and not self._main_player then

    local x, y, w, h = self._new_name:text_rect()
    self._new_name:set_size(w, h)

    self._panel:child("name_panel"):child("interact_text"):stop()
    self._panel:child("name_panel"):child("interact_text"):set_left(0)

    self._new_name:set_alpha(1)
    self._panel:child("name_panel"):child("interact_text"):set_visible(false)
    self._panel:child("name_bg"):set_w(w + 4)
  end

  if success then

    self._new_name:set_alpha(1)
    self._panel:child("name_panel"):child("interact_text"):set_visible(false)
    self._panel:child("name_bg"):set_w(self._new_name:w() + 4)

    self._player_panel:child("interact_panel"):child("interact_timer"):stop()
    self._player_panel:child("interact_panel"):child("interact_timer"):animate(callback(self, self, "_animate_timer_success"))
  end
end)

Hooks:PreHook(HUDTeammate, "set_carry_info", "uHUDPostHUDTeammateSetCarryInfo", function(self, carry_id, value)

  if self._peer_id then
    self._player_panel:child("carry_panel"):child("bag"):set_color(uHUD:HasSetting("coloured_bag") and tweak_data.chat_colors[self._peer_id] or Color.white)
  end
end)

Hooks:PostHook(HUDTeammate, "teammate_progress", "uHUDPostHUDTeammateTeammateProgress", function(self, enabled, tweak_data_id, timer, success)

  if not self._player_panel:child("interact_panel"):child("interact_timer") then return end
  if not uHUD:HasSetting("interact_timer_teammate") then return end

  if enabled then
    self._player_panel:child("interact_panel"):child("interact_timer"):animate(callback(self, self, "_animate_interact_timer"), timer)
  else
    if not success then
      self._player_panel:child("interact_panel"):child("interact_timer"):stop()
    end
  end
end)

Hooks:PostHook(HUDTeammate, "set_ammo_amount_by_type", "uHUDPostHUDTeammateSetAmmoAmountByType", function(self, type, max_clip, current_clip, current_left, max)
  local true_ammo
  local weapon_panel = self._player_panel:child("weapons_panel"):child(type .. "_weapon_panel")
  local ammo_total = weapon_panel:child("ammo_total")
  local ammo_clip = weapon_panel:child("ammo_clip")

  if self._main_player and uHUD:HasSetting("true_ammo") then
    if current_left - current_clip >= 0 then
      current_left = current_left - current_clip
      true_ammo = true
    end
  end

  local zero = current_left < 10 and "00" or current_left < 100 and "0" or ""
  local zero_clip = current_clip < 10 and "00" or current_clip < 100 and "0" or ""
  local low_ammo = current_left <= math.round(max / 2)
  local out_of_ammo = current_left <= 0
  local max_ammo = uHUD:HasSetting("full_ammo") and (current_left == max or (true_ammo and (current_left + current_clip == max)))
  local cheated_ammo = current_left > max
  local low_clip = current_clip <= math.round(max_clip / 4)
  local out_of_clip = current_clip <= 0
  local cheated_clip = current_clip > max_clip
  local color_total = out_of_ammo and Color(1, 0.9, 0.3, 0.3)

  color_total = color_total or max_ammo and (Color(255, 41, 204, 122) / 255)
  color_total = color_total or low_ammo and Color(1, 0.9, 0.9, 0.3)
  color_total = color_total or cheated_ammo and Color.red
  color_total = color_total or Color.white

  local color_clip = out_of_clip and Color(1, 0.9, 0.3, 0.3)

  color_clip = color_clip or low_clip and Color(1, 0.9, 0.9, 0.3)
  color_clip = color_clip or cheated_clip and Color.red
  color_clip = color_clip or Color.white

  ammo_total:stop()
  ammo_total:set_text(zero .. current_left)
  ammo_total:set_font_size(24)
  ammo_total:set_color(color_total)
  ammo_total:set_range_color(0, string.len(zero), color_total:with_alpha(0.5))

  ammo_clip:stop()
  ammo_clip:set_color(color_clip)
  ammo_clip:set_range_color(0, string.len(zero_clip), color_clip:with_alpha(0.5))

  if not self._last_ammo then
    self._last_ammo = {}
    self._last_ammo[type] = current_left
  end

  if not self._last_clip then
    self._last_clip = {}
    self._last_clip[type] = current_clip
  end

  if self._last_ammo and self._last_ammo[type] and self._last_ammo[type] < current_left then

    ammo_total:animate(function(o)
      local s = self._last_ammo[type]
      local e = current_left
      local font_size = 24
      over(0.5, function(p)
        local value = math.lerp(s, e, p)
        local text = string.format("%.0f", value)
        local zero = math.round(value) < 10 and "00" or math.round(value) < 100 and "0" or ""

        local low_ammo = value <= math.round(max / 2)
        local out_of_ammo = value <= 0
        local max_ammo = uHUD:HasSetting("full_ammo") and (value == max or (true_ammo and (value + current_clip == max)))
        local cheated_ammo = value > max

        local color_total = out_of_ammo and Color(1, 0.9, 0.3, 0.3)
        color_total = color_total or max_ammo and (Color(255, 41, 204, 122) / 255)
        color_total = color_total or low_ammo and Color(1, 0.9, 0.9, 0.3)
        color_total = color_total or cheated_ammo and Color.red
        color_total = color_total or Color.white

        ammo_total:set_text(zero .. text)
        ammo_total:set_color(color_total)
        ammo_total:set_range_color(0, string.len(zero), color_total:with_alpha(0.5))
      end)

      over(1, function(p)
        local n = 1 - math.sin((p / 2) * 180)
        local c = 1 - math.sin(p / 2)

        --ammo_total:set_color( Color( math.lerp( 194 , a.red , c ) , math.lerp( 252 , a.green , c ) , math.lerp( 151 , a.blue , c ) ) )
        ammo_total:set_font_size(math.lerp(font_size, font_size + 4, n))
      end)
    end)
  end

  if self._last_clip and self._last_clip[type] and self._last_clip[type] < current_clip then

    ammo_clip:animate(function(o)
      local s = self._last_clip[type]
      local e = current_clip
      over(0.25, function(p)
        local value = math.lerp(s, e, p)
        local text = string.format("%.0f", value)
        local zero = math.round(value) < 10 and "00" or math.round(value) < 100 and "0" or ""

        local low_clip = value <= math.round(max_clip / 4)
        local out_of_clip = value <= 0

        local color_clip = out_of_clip and Color(1, 0.9, 0.3, 0.3)
        color_clip = color_clip or low_clip and Color(1, 0.9, 0.9, 0.3)
        color_clip = color_clip or Color.white

        ammo_clip:set_text(zero .. text)
        ammo_clip:set_color(color_clip)
        ammo_clip:set_range_color(0, string.len(zero), color_clip:with_alpha(0.5))
      end)
    end)
  end

  self._last_ammo[type] = current_left
  self._last_clip[type] = current_clip
end)

Hooks:PostHook(HUDTeammate, "set_health", "uHUDPostHUDTeammateSetHealth", function(self, data)
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local health_warning = radial_health_panel:child("health_warning")
  local stamina = radial_health_panel:child("radial_stamina")
  local stamina_warning = radial_health_panel:child("radial_stamina_warning")
  local health = data.current / data.total

  if (self._main_player and uHUD:HasSetting("health_warning") or not self._main_player and uHUD:HasSetting("health_warning_teammate")) then
    if health <= 0.20 and health > 0 and not self._health_warning then
      self._health_warning = true
      health_warning:set_visible(true)
      health_warning:animate(callback(self, self, "_animate_health_warning"))
    elseif (health >= 0.30 or health <= 0) and self._health_warning then
      self._health_warning = nil
      health_warning:stop()
      health_warning:set_visible(false)
    end
  else
    health_warning:stop()
    health_warning:set_visible(false)
  end

  if self._main_player then
    if health <= 0 then
      stamina:set_visible(false)
      if self._stamina_warning then stamina_warning:set_visible(false) end
    else
      stamina:set_visible(uHUD:HasSetting("stamina") and true or false)
      if self._stamina_warning then stamina_warning:set_visible(true) end
    end
  end
end)

Hooks:PreHook(HUDTeammate, "set_weapon_selected", "uHUDPreHUDTeammateSetWeaponSelected", function(self, id, hud_icon)
  local is_secondary = id == 1
  local secondary_weapon_panel = self._player_panel:child("weapons_panel"):child("secondary_weapon_panel")
  local primary_weapon_panel = self._player_panel:child("weapons_panel"):child("primary_weapon_panel")

  secondary_weapon_panel:stop()
  primary_weapon_panel:stop()

  if is_secondary then
    primary_weapon_panel:animate(function(o)
      over(0.5, function(p)
        primary_weapon_panel:set_alpha(math.lerp(1, 0.5, p))
      end)
    end)

    secondary_weapon_panel:animate(function(o)
      over(0.5, function(p)
        secondary_weapon_panel:set_alpha(math.lerp(0.5, 1, p))
      end)
    end)

  else

    secondary_weapon_panel:animate(function(o)
      over(0.5, function(p)
        secondary_weapon_panel:set_alpha(math.lerp(1, 0.5, p))
      end)
    end)

    primary_weapon_panel:animate(function(o)
      over(0.5, function(p)
        primary_weapon_panel:set_alpha(math.lerp(0.5, 1, p))
      end)
    end)
  end
end)

Hooks:PostHook(HUDTeammate, "set_cable_ties_amount", "uHUDPostHUDTeammateSetCableTiesAmount", function(self, amount)
  local cable_ties_panel = self._player_panel:child("cable_ties_panel")
  local cable_ties = cable_ties_panel:child("cable_ties")
  local cable_ties_amount = cable_ties_panel:child("amount")

  if amount > 0 then
    cable_ties:set_alpha(1)
    cable_ties:set_visible(true)
    cable_ties_amount:set_alpha(1)
    cable_ties_amount:set_visible(true)
  end

  if amount > 0 then
    cable_ties:animate(function(o)
      cable_ties:set_alpha(1)
      cable_ties:set_visible(true)
      cable_ties_amount:set_alpha(1)
      cable_ties_amount:set_visible(true)
      over(1, function(p)
        local n = 1 - math.sin((p / 2) * 180)
        cable_ties:set_alpha(math.lerp(1, 0.2, n))
      end)
    end)
  elseif amount == 0 then
    cable_ties:animate(function(o)
      cable_ties:set_visible(true)
      cable_ties_amount:set_visible(true)
      self:_set_amount_string(cable_ties_amount, amount)
      over(1, function(p)
        cable_ties:set_alpha(math.lerp(1, 0, p))
        cable_ties_amount:set_alpha(math.lerp(1, 0, p))
      end)
      cable_ties:set_visible(false)
      cable_ties_amount:set_visible(false)
    end)
  end
end)

Hooks:PostHook(HUDTeammate, "set_deployable_equipment_amount", "uHUDPostHUDTeammateSetDeployableEquipmentAmount", function(self, index, data)
  local deployable_equipment_panel = self._player_panel:child("deployable_equipment_panel")
  local equipment = deployable_equipment_panel:child("equipment")
  local amount = deployable_equipment_panel:child("amount")

  equipment:stop()

  if data.amount > 0 then
    equipment:set_alpha(1)
    equipment:set_visible(true)
    amount:set_alpha(1)
    amount:set_visible(true)
  end

  if data.amount > 0 then
    equipment:animate(function(o)
      equipment:set_alpha(1)
      equipment:set_visible(true)
      amount:set_alpha(1)
      amount:set_visible(true)
      over(1, function(p)
        local n = 1 - math.sin((p / 2) * 180)
        equipment:set_alpha(math.lerp(1, 0.2, n))
      end)
    end)
  elseif data.amount == 0 then
    equipment:animate(function(o)
      equipment:set_visible(true)
      amount:set_visible(true)
      self:_set_amount_string(amount, data.amount)
      over(1, function(p)
        equipment:set_alpha(math.lerp(1, 0, p))
        amount:set_alpha(math.lerp(1, 0, p))
      end)
      equipment:set_visible(false)
      amount:set_visible(false)
    end)
  end
end)

Hooks:PostHook(HUDTeammate, "set_grenades_amount", "uHUDPostHUDTeammateSetGrenadesAmount", function(self, data)
  if not PlayerBase.USE_GRENADES then return end
  if not self._grenade_amount then self._grenade_amount = data.amount end

  local grenades_panel = self._player_panel:child("grenades_panel")
  local grenades = grenades_panel:child("grenades")
  local amount = grenades_panel:child("amount")

  grenades:stop()

  if data.amount > 0 then
    grenades:set_alpha(1)
    grenades:set_visible(true)
    amount:set_alpha(1)
    amount:set_visible(true)
  end

  if self._grenade_amount > data.amount and data.amount > 0 then
    grenades:animate(function(o)
      grenades:set_alpha(1)
      grenades:set_visible(true)
      amount:set_alpha(1)
      amount:set_visible(true)
      over(1, function(p)
        local n = 1 - math.sin((p / 2) * 180)
        grenades:set_alpha(math.lerp(1, 0.2, n))
      end)
    end)
  elseif data.amount == 0 then
    grenades:animate(function(o)
      grenades:set_visible(true)
      amount:set_visible(true)
      self:_set_amount_string(amount, data.amount)
      over(1, function(p)
        grenades:set_alpha(math.lerp(1, 0, p))
        amount:set_alpha(math.lerp(1, 0, p))
      end)
      grenades:set_visible(false)
      amount:set_visible(false)
    end)
  end

  self._grenade_amount = data.amount
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

function HUDTeammate:set_stamina_value(value)
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local radial_stamina = radial_health_panel:child("radial_stamina")
  local red = value / self._max_stamina

  --radial_stamina:set_visible(true)

  if uHUD:HasSetting("stamina") and uHUD:HasSetting("stamina_warning") then
    if red <= 0.25 and not self._stamina_warning then
      self._stamina_warning = true
      radial_health_panel:child("radial_stamina_warning"):set_visible(true)
      radial_health_panel:child("radial_stamina_warning"):animate(callback(self, self, "_animate_stamina_warning"))
    elseif self._stamina_warning and red >= 0.5 then
      self._stamina_warning = nil
      radial_health_panel:child("radial_stamina_warning"):set_visible(false)
      radial_health_panel:child("radial_stamina_warning"):stop()
    end
  else
    radial_health_panel:child("radial_stamina_warning"):stop()
    radial_health_panel:child("radial_stamina_warning"):set_visible(false)
  end

  radial_stamina:set_color(Color(1, red, 1, 1))
end

function HUDTeammate:set_max_stamina(value)

  self._max_stamina = value
end

function HUDTeammate:set_downed(value)
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local downed_counter = radial_health_panel:child("downed_counter")

  if self._main_player then
    downed_counter:set_text(tostring(value))
  end
end

function HUDTeammate:show_underdog()
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local underdog_glow = radial_health_panel:child("underdog_glow")

  if not self._underdog_animation then
    underdog_glow:set_visible(true)
    underdog_glow:animate(callback(self, self, "_animate_glow"))

    self._underdog_animation = true
  end
end

function HUDTeammate:hide_underdog()

  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local underdog_glow = radial_health_panel:child("underdog_glow")

  if self._underdog_animation then
    underdog_glow:set_alpha(0)
    underdog_glow:set_visible(false)
    underdog_glow:stop()

    self._underdog_animation = nil
  end
end

function HUDTeammate:show_armor_timer(time)
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local armor_timer = radial_health_panel:child("armor_timer")

  armor_timer:set_text(string.format("%.1f", time) .. "s")

  if not self._armor_timer then
    armor_timer:set_visible(true)

    self._armor_timer = true
  end
end

function HUDTeammate:hide_armor_timer()
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local armor_timer = radial_health_panel:child("armor_timer")

  if self._armor_timer then
    armor_timer:set_visible(false)
    self._armor_timer = nil
  end
end

function HUDTeammate:show_reload_timers(index, time)
  local type = index == 1 and "secondary" or "primary"
  local weapon_panel = self._player_panel:child("weapons_panel"):child(type .. "_weapon_panel")
  local ammo_clip = weapon_panel:child("ammo_clip")
  local ammo_total = weapon_panel:child("ammo_total")
  local timer_text = weapon_panel:child(type .. "_timer")

  timer_text:set_text(string.format("%.1f", time) .. "s")

  if not self._reload_timer then
    ammo_clip:set_alpha(0.5)
    ammo_total:set_alpha(0.5)
    timer_text:set_visible(true)

    self._reload_timer = true
  end
end

function HUDTeammate:hide_reload_timers(index)
  local type = index == 1 and "secondary" or "primary"
  local weapon_panel = self._player_panel:child("weapons_panel"):child(type .. "_weapon_panel")
  local ammo_clip = weapon_panel:child("ammo_clip")
  local ammo_total = weapon_panel:child("ammo_total")
  local timer_text = weapon_panel:child(type .. "_timer")

  if self._reload_timer then
    ammo_clip:set_alpha(1)
    ammo_total:set_alpha(1)
    timer_text:set_visible(false)

    self._reload_timer = nil
  end
end

function HUDTeammate:on_peer_downed()
  local teammate_panel = self._panel:child("player")
  local radial_health_panel = teammate_panel:child("radial_health_panel")
  local radial_health = radial_health_panel:child("radial_health")
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

function HUDTeammate:_animate_glow(glow)
  local t = 0

  while true do
    t = t + coroutine.yield()

    glow:set_alpha((math.abs(math.sin((4 + t) * 360 * 4 / 4))))
  end
end

function HUDTeammate:_animate_callsign(callsign)
  local t = 0

  while true do
    t = t + coroutine.yield()
    callsign:set_color(Color(ConvertToRGB(math.sin((7 * t) % 80), 1, 1)))
  end
end

function HUDTeammate:_animate_stamina_warning(ring)
  local t = 0

  while true do
    t = t + coroutine.yield()

    ring:set_alpha((math.abs(math.sin((2 + t) * 360 * 2 / 4))))
  end
end

function HUDTeammate:_animate_health_warning(ring)
  local t = 0

  while true do
    t = t + coroutine.yield()

    ring:set_alpha(math.clamp((math.abs(math.sin((2 + t) * 360 * 2 / 4))), 0.5, 1))
  end
end

function HUDTeammate:_animate_interact_timer(text, timer)
  local t = 0

  while timer >= t do
    local dt = coroutine.yield()

    t = t + dt

    local time = timer - t

    if time < 0 then
      time = 0
    end

    text:set_text(string.format("%.1f", time) .. "s")
  end
end

function HUDTeammate:_animate_infamy(icon, rank)
  icon:set_alpha(1)
  self._panel:child("infamy_rank"):set_alpha(1)
  self._panel:child("infamy_rank"):set_visible(true)

  local t = 0

  while true do
    local dt = coroutine.yield()

    t = t + dt

    local p = math.sin((0.25 + t) * 360 * 0.25 / 2)

    icon:set_alpha(math.lerp(1, 0, p))
    self._panel:child("infamy_rank"):set_alpha(math.lerp(0, 1, p))
  end
end

function HUDTeammate:_animate_name(name, width)
  local t = 0

  while true do
    t = t + coroutine.yield()

    name:set_left(width * (math.sin(90 + t * 50) * 0.5 - 0.5))
  end
end

function HUDTeammate:_animate_timer_success(timer)
  local TOTAL_T = 0.6
  local t = TOTAL_T
  local mul = 1
  local c_x, c_y = timer:center()
  local size = timer:w()
  local font_size = timer:font_size()

  while t > 0 do
    local dt = coroutine.yield()

    t = t - dt
    mul = mul + dt * 0.75

    timer:set_size(size * mul, size * mul)
    timer:set_font_size(font_size * mul)
    timer:set_center(c_x, c_y)
    timer:set_alpha(math.max(t / TOTAL_T, 0))
  end

  timer:set_font_size(20)
  timer:set_alpha(1)
  timer:set_size(self._player_panel:child("interact_panel"):w() / 2, self._player_panel:child("interact_panel"):h() / 2)
  timer:set_center(self._player_panel:child("interact_panel"):w() / 2, self._player_panel:child("interact_panel"):h() / 2)
end
