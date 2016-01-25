Hooks:PostHook(HUDHitConfirm, "init", "hitmark_hudhitconfirm_init", function(self)
  if self._hud_panel:child("headshot_confirm") then
    -- no hoxhud's red circle allowed
    self._hud_panel:remove(self._hud_panel:child("headshot_confirm"))
  end

  local hms = {
    { name = "hit_body_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.hit },
    { name = "hit_crit_confirm", texture = HitMark.settings.crit_texture, color = HitMark.settings.crit },
    { name = "hit_head_confirm", texture = HitMark.settings.headshot_texture, color = HitMark.settings.headshot },
    { name = "kill_body_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.hit_kill },
    { name = "kill_crit_confirm", texture = HitMark.settings.crit_texture, color = HitMark.settings.crit_kill },
    { name = "kill_head_confirm", texture = HitMark.settings.headshot_texture, color = HitMark.settings.headshot_kill }
  }

  self.eh_bitmaps = {}

  local hp = self._hud_panel
  local blend_mode = HitMark:settings.blend_mode

  for i, hm in ipairs(hms) do
    if hp:child(hm.name) then
      hp:remove(hp:child(hm.name))
    end

    local bmp = hp:bitmap({
      valign = "center",
      halign = "center",
      visible = false,
      name = hm.name,
      texture = hm.texture,
      color = Color(hm.color),
      layer = 0,
      blend_mode = blend_mode
    })
    local w = bmp:texture_width()

    if w * 3 == bmp:texture_height() then
      bmp:set_texture_rect(0, math.mod(i - 1, 3) * w, w, w)
      bmp:set_height(w)
    end

    bmp:set_center(hp:w() / 2, hp:h() / 2)

    self.eh_bitmaps[i] = bmp
  end
end)

function HUDHitConfirm:on_damage_confirmed(kill_confirmed, headshot)
  local index = (kill_confirmed and 4 or 1) + (HitMark.critshot and 2 or (headshot and 1 or 0))
  local hm = self.eh_bitmaps[index]

  hm:stop()
  hm:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
end

function HUDHitConfirm:on_hit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
    HitMark.critshot = false
  else
    self.eh_bitmaps[1]:stop()
    self.eh_bitmaps[1]:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
  end
end

function HUDHitConfirm:on_crit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
    HitMark.critshot = true
  else
    self.eh_bitmaps[3]:stop()
    self.eh_bitmaps[3]:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
  end
end
