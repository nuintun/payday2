--log("MenuNodeTableGui")

function MenuNodeTableGui:_setup_panels(node)
  MenuNodeTableGui.super._setup_panels(self, node)

  local safe_rect_pixels = self:_scaled_size()
  local mini_info = self.safe_rect_panel:panel({
    x = 0,
    y = 0,
    w = 0,
    h = 0
  })
  local mini_text = mini_info:text({
    x = 0,
    y = 0,
    align = "left",
    halign = "top",
    vertical = "top",
    font = tweak_data.menu.pd2_small_font,
    font_size = tweak_data.menu.pd2_small_font_size + 2,
    color = Color.white,
    layer = self.layers.items,
    text = "",
    wrap = true,
    word_wrap = true
  })
  local _, _, w, h = mini_text:text_rect()

  --mini_info:set_width(self._info_bg_rect:w() - tweak_data.menu.info_padding * 38)
  --mini_info:set_width(self._info_bg_rect:w() - tweak_data.menu.info_padding)
  --mini_text:set_width(mini_info:w())
  --mini_info:set_height(35)
  --mini_text:set_height(35)
  mini_info:set_width(w)
  mini_info:set_height(35)
  mini_info:set_top(self._info_bg_rect:bottom() + tweak_data.menu.info_padding - 12)
  mini_text:set_top(0)
  mini_info:set_left(tweak_data.menu.info_padding)
  mini_text:set_left(0)
  self._mini_info_text = mini_text
end

function MenuNodeTableGui:set_mini_info(text)
  self._mini_info_text:set_text(text)
end

function MenuNodeTableGui:toggle_mini_info(state)
  self._mini_info_text:set_visible(state)
end

function MenuNodeTableGui:_create_menu_item(row_item)
  if row_item.type == "column" then
    local columns = row_item.node:columns()
    local total_proportions = row_item.node:parameters().total_proportions

    row_item.gui_panel = self.item_panel:panel({
      x = self:_right_align(),
      w = self.item_panel:w()
    })
    row_item.gui_columns = {}

    local x = 0

    for i, data in ipairs(columns) do
      local text = row_item.gui_panel:text({
        font_size = self.font_size,
        x = row_item.position.x,
        y = 0,
        align = data.align,
        halign = data.align,
        vertical = "center",
        font = row_item.font,
        color = row_item.color,
        layer = self.layers.items,
        text = row_item.item:parameters().columns[i]
      })

      row_item.gui_columns[i] = text

      local _, _, w, h = text:text_rect()

      text:set_h(h)

      local w = data.proportions / total_proportions * row_item.gui_panel:w()

      text:set_w(w)
      text:set_x(x)
      x = x + w
    end

    local x, y, w, h = row_item.gui_columns[1]:text_rect()

    row_item.gui_panel:set_height(h)
  elseif row_item.type == "server_column" then
    --row_item.font = tweak_data.menu.pd2_medium_font_id
    local columns = row_item.node:columns()
    local total_proportions = row_item.node:parameters().total_proportions
    local safe_rect = self:_scaled_size()
    local xl_pad = 54

    row_item.gui_panel = self.item_panel:panel({
      x = safe_rect.width / 2 - xl_pad,
      w = safe_rect.width / 2 + xl_pad
    })
    row_item.gui_columns = {}

    local x = 0

    for i, data in ipairs(columns) do
      local text = row_item.gui_panel:text({
        font_size = tweak_data.menu.server_list_font_size,
        x = row_item.position.x,
        y = 0,
        align = data.align,
        halign = data.align,
        vertical = "center",
        font = row_item.font,
        color = i == 2 and row_item.item:parameters().pro and tweak_data.screen_colors.pro_color or row_item.color,
        layer = self.layers.items,
        text = row_item.item:parameters().columns[i]
      })

      row_item.gui_columns[i] = text

      local _, _, w, h = text:text_rect()

      text:set_h(h)

      local w = data.proportions / total_proportions * row_item.gui_panel:w()

      text:set_w(w + (i == 2 and 10 or 0))
      text:set_x(x)
      x = x + w
    end

    local x, y, w, h = row_item.gui_columns[1]:text_rect()

    row_item.gui_panel:set_height(h)

    local x = row_item.gui_columns[2]:right()
    local y = 0
    local difficulty_stars = row_item.item:parameters().difficulty_num
    local start_difficulty = 3
    local num_difficulties = 6
    local spacing = 14

    row_item.difficulty_icons = {}

    for i = start_difficulty, difficulty_stars do
      local skull = row_item.gui_panel:bitmap({
        texture = i == num_difficulties and "guis/textures/pd2/risklevel_deathwish_blackscreen" or "guis/textures/pd2/risklevel_blackscreen",
        x = x,
        y = y,
        w = h,
        h = h,
        --blend_mode = "add",
        layer = self.layers.items,
        color = tweak_data.screen_colors.risk
      })

      x = x + (spacing)

      row_item.difficulty_icons[i] = skull
      --num_stars = num_stars + 1
      --skull:set_center_y(row_item.gui_columns[2]:center_y())
    end

    local level_id = row_item.item:parameters().level_id
    local days = row_item.item:parameters().days

    row_item.gui_info_panel = self.safe_rect_panel:panel({
      visible = false,
      layer = self.layers.items,
      x = 0,
      y = 0,
      w = self:_left_align(),
      h = self._item_panel_parent:h()
    })
    row_item.heist_name = row_item.gui_info_panel:text({
      visible = false,
      text = utf8.to_upper(row_item.item:parameters().level_name),
      layer = self.layers.items,
      font = self.font,
      font_size = tweak_data.menu.challenges_font_size,
      color = row_item.color,
      align = "left",
      vertical = "left"
    })

    local briefing_text = level_id and managers.localization:text(tweak_data.levels[level_id].briefing_id) or ""

    row_item.heist_briefing = row_item.gui_info_panel:text({
      visible = true,
      x = 0,
      y = 0,
      align = "left",
      halign = "top",
      vertical = "top",
      font = tweak_data.menu.pd2_small_font,
      font_size = tweak_data.menu.pd2_small_font_size,
      color = Color.white,
      layer = self.layers.items,
      text = briefing_text,
      wrap = true,
      word_wrap = true
    })

    local font_size = tweak_data.menu.pd2_small_font_size

    row_item.server_title = row_item.gui_info_panel:text({
      name = "server_title",
      text = utf8.to_upper(managers.localization:text("menu_lobby_server_title")) .. " ",
      font = tweak_data.menu.pd2_small_font,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.server_text = row_item.gui_info_panel:text({
      name = "server_text",
      text = utf8.to_upper(row_item.item:parameters().host_name),
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.hud.prime_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.server_info_title = row_item.gui_info_panel:text({
      name = "server_info_title",
      text = utf8.to_upper(managers.localization:text("menu_lobby_server_state_title")) .. " ",
      font = self.font,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.server_info_text = row_item.gui_info_panel:text({
      name = "server_info_text",
      text = utf8.to_upper(row_item.item:parameters().state_name) .. " " .. tostring(row_item.item:parameters().num_plrs) .. "/4 ",
      font = self.font,
      color = tweak_data.hud.prime_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.level_title = row_item.gui_info_panel:text({
      name = "level_title",
      text = utf8.to_upper(managers.localization:text("menu_lobby_campaign_title")) .. " ",
      font = tweak_data.menu.pd2_small_font,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.level_text = row_item.gui_info_panel:text({
      name = "level_text",
      text = utf8.to_upper(row_item.item:parameters().real_level_name) .. " ",
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.hud.prime_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.level_pro_text = row_item.gui_info_panel:text({
      name = "level_pro_text",
      text = utf8.to_upper(row_item.item:parameters().pro and "专家任务" or ""),
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.screen_colors.pro_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.difficulty_title = row_item.gui_info_panel:text({
      name = "difficulty_title",
      text = utf8.to_upper(managers.localization:text("menu_lobby_difficulty_title")) .. " ",
      font = tweak_data.menu.pd2_small_font,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.difficulty_text = row_item.gui_info_panel:text({
      name = "difficulty_text",
      text = utf8.to_upper(managers.localization:text("menu_difficulty_" .. row_item.item:parameters().difficulty)),
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.hud.prime_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.days_title = row_item.gui_info_panel:text({
      name = "days_title",
      text = utf8.to_upper(managers.localization:text("menu_lobby_days_title")) .. "  ",
      font = tweak_data.menu.pd2_small_font,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })
    row_item.days_text = row_item.gui_info_panel:text({
      name = "days_text",
      text = utf8.to_upper(days),
      font = tweak_data.menu.pd2_small_font,
      color = tweak_data.hud.prime_color,
      font_size = font_size,
      align = "left",
      vertical = "center",
      w = 256,
      h = font_size,
      layer = 1
    })

    self:_align_server_column(row_item)

    local visible = row_item.item:menu_unselected_visible(self, row_item) and not row_item.item:parameters().back

    row_item.menu_unselected = self.item_panel:bitmap({
      visible = visible,
      texture = "guis/textures/menu_unselected",
      x = 0,
      y = 0,
      layer = -1
    })
    row_item.menu_unselected:set_color(row_item.item:parameters().is_expanded and Color(0.5, 0.5, 0.5) or Color.white)
    row_item.menu_unselected:hide()
  else
    MenuNodeTableGui.super._create_menu_item(self, row_item)
  end
end

--noinspection LuaOverlyLongMethod
function MenuNodeTableGui:_align_server_column(row_item)
  local safe_rect = self:_scaled_size()

  self:_align_item_gui_info_panel(row_item.gui_info_panel)

  local font_size = tweak_data.menu.pd2_small_font_size
  local offset = 22 * tweak_data.scale.lobby_info_offset_multiplier

  row_item.server_title:set_font_size(font_size)
  row_item.server_text:set_font_size(font_size)

  local x, y, w, h = row_item.server_title:text_rect()

  row_item.server_title:set_x(tweak_data.menu.info_padding)
  row_item.server_title:set_y(tweak_data.menu.info_padding)
  row_item.server_title:set_w(w)
  row_item.server_text:set_lefttop(row_item.server_title:righttop())
  row_item.server_text:set_w(row_item.gui_info_panel:w())
  row_item.server_text:set_position(math.round(row_item.server_text:x()), math.round(row_item.server_text:y()))
  row_item.server_info_title:set_font_size(font_size)
  row_item.server_info_text:set_font_size(font_size)

  local x, y, w, h = row_item.server_info_title:text_rect()

  row_item.server_info_title:set_x(tweak_data.menu.info_padding)
  row_item.server_info_title:set_y(tweak_data.menu.info_padding + offset)
  row_item.server_info_title:set_w(w)
  row_item.server_info_text:set_lefttop(row_item.server_info_title:righttop())
  row_item.server_info_text:set_w(row_item.gui_info_panel:w())
  row_item.server_info_text:set_position(math.round(row_item.server_info_text:x()), math.round(row_item.server_info_text:y()))
  row_item.level_title:set_font_size(font_size)
  row_item.level_text:set_font_size(font_size)
  row_item.level_pro_text:set_font_size(font_size)

  local x, y, w, h = row_item.level_title:text_rect()

  row_item.level_title:set_x(tweak_data.menu.info_padding)
  row_item.level_title:set_y(tweak_data.menu.info_padding + offset * 2)
  row_item.level_title:set_w(w)

  local x, y, w, h = row_item.level_text:text_rect()

  row_item.level_text:set_lefttop(row_item.level_title:righttop())
  row_item.level_text:set_w(w)
  row_item.level_text:set_position(math.round(row_item.level_text:x()), math.round(row_item.level_text:y()))
  row_item.level_pro_text:set_lefttop(row_item.level_text:righttop())
  row_item.level_pro_text:set_w(row_item.gui_info_panel:w())
  row_item.level_pro_text:set_position(math.round(row_item.level_pro_text:x()), math.round(row_item.level_pro_text:y()))
  row_item.days_title:set_font_size(font_size)
  row_item.days_text:set_font_size(font_size)

  local x, y, w, h = row_item.days_title:text_rect()

  row_item.days_title:set_x(tweak_data.menu.info_padding)
  row_item.days_title:set_y(tweak_data.menu.info_padding + offset * 3)
  row_item.days_title:set_w(w)
  row_item.days_text:set_lefttop(row_item.days_title:righttop())
  row_item.days_text:set_w(row_item.gui_info_panel:w())
  row_item.days_text:set_position(math.round(row_item.days_text:x()), math.round(row_item.days_text:y()))
  row_item.difficulty_title:set_font_size(font_size)
  row_item.difficulty_text:set_font_size(font_size)

  local x, y, w, h = row_item.difficulty_title:text_rect()

  row_item.difficulty_title:set_x(tweak_data.menu.info_padding)
  row_item.difficulty_title:set_y(tweak_data.menu.info_padding + offset * 4)
  row_item.difficulty_title:set_w(w)
  row_item.difficulty_text:set_lefttop(row_item.difficulty_title:righttop())
  row_item.difficulty_text:set_w(row_item.gui_info_panel:w())
  row_item.difficulty_text:set_position(math.round(row_item.difficulty_text:x()), math.round(row_item.difficulty_text:y()))

  local _, _, _, h = row_item.heist_name:text_rect()
  local w = row_item.gui_info_panel:w()

  row_item.heist_name:set_height(h)
  row_item.heist_name:set_w(w)
  row_item.heist_briefing:set_w(w)
  row_item.heist_briefing:set_shape(row_item.heist_briefing:text_rect())
  row_item.heist_briefing:set_x(tweak_data.menu.info_padding)
  row_item.heist_briefing:set_y(tweak_data.menu.info_padding + offset * 5 + tweak_data.menu.info_padding * 2)
  row_item.heist_briefing:set_position(math.round(row_item.heist_briefing:x()), math.round(row_item.heist_briefing:y()))
end


function MenuNodeTableGui:mouse_pressed(button, x, y)
  MenuNodeTableGui.super.mouse_pressed(self, button, x, y)

  if button == Idstring("0") and self._mini_info_text:inside(x, y) then
    Steam:overlay_activate("url", "http://store.steampowered.com/stats")
    return true
  end
end

function MenuNodeTableGui:mouse_moved(o, x, y)
  local inside = self._mini_info_text:inside(x, y)

  --self._mouse_over = inside
  return inside, inside and "link"
end
