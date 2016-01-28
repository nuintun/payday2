if not Restoration then
  CloneClass(HUDTemp)

  function HUDTemp:init(...)
    self.orig.init(self, ...)

    local bag_panel = self._temp_panel:child("bag_panel")

    self._bg_box:child("bg"):set_color(CompactHUD.bg_color)
    self._bg_box:child("bg"):set_alpha(CompactHUD.bg_alpha)
    bag_panel:set_size(170, 50)
    self._bg_box:set_size(170, 50)

    self._bg_box:child("left_top"):set_visible(false)
    self._bg_box:child("left_bottom"):set_visible(false)
    self._bg_box:child("right_top"):set_visible(false)
    self._bg_box:child("right_bottom"):set_visible(false)

    self._bag_panel_w = bag_panel:w()
    self._bag_panel_h = bag_panel:h()
    self._bg_box:rect({
      name = "bottom_rect",
      h = 2,
      color = CompactHUD.armor_color
    }):set_bottom(self._bg_box:bottom())
    self._bg_box:child("bag_text"):move(0, 5)
    self._bg_box:child("bag_text"):set_font_size(20)
  end

  function HUDTemp:_animate_hide_bag_panel(bag_panel)
    local w, h = self._bag_panel_w, self._bag_panel_h
    local x1 = self._temp_panel:w() - w
    local x2 = self._temp_panel:w()
    local bottom = bag_panel:bottom()
    local bag_text = self._bg_box:child("bag_text")

    bag_text:set_visible(true)
    bag_panel:set_size(w, h)
    bag_panel:set_x(x1)
    bag_panel:set_y(self:_bag_panel_bottom() - h)

    local t = 0

    while t < 0.3 do
      t = t + coroutine.yield()

      local n = 1 - math.sin(t * 300)

      bag_panel:set_x(math.lerp(x2, x1, n))
    end

    bag_panel:set_visible(false)
    bag_panel:set_size(w, h)
    bag_panel:set_x(x2)
  end

  function HUDTemp:_animate_show_bag_panel(bag_panel)
    local w, h = self._bag_panel_w, self._bag_panel_h
    local x1 = self._temp_panel:w()
    local x2 = self._temp_panel:w() - w
    local bottom = bag_panel:bottom()
    local bag_text = self._bg_box:child("bag_text")

    self._bg_box:child("bg"):set_color(CompactHUD.bg_color)
    self._bg_box:child("bg"):set_alpha(CompactHUD.bg_alpha)
    self._bg_box:child("bottom_rect"):set_color(CompactHUD.armor_color)
    bag_text:set_visible(true)
    bag_panel:set_size(w, h)
    bag_panel:set_x(x1)
    bag_panel:set_y(self:_bag_panel_bottom() - h)

    local t = 0

    while t < 0.3 do
      t = t + coroutine.yield()

      local n = 1 - math.sin(t * 300)

      bag_panel:set_x(math.lerp(x2, x1, n))
    end

    bag_panel:set_size(w, h)
    bag_panel:set_x(x2)
  end
end
