Hooks:PostHook(HUDHitConfirm, "init", "hitmark_hudhitconfirm_init", function(self)
  if self._hud_panel:child("hit_confirm") then
    self._hud_panel:remove(self._hud_panel:child("hit_confirm"))
  end

  if self._hud_panel:child("headshot_confirm") then
    self._hud_panel:remove(self._hud_panel:child("headshot_confirm"))
  end

  if self._hud_panel:child("crit_confirm") then
    self._hud_panel:remove(self._hud_panel:child("crit_confirm"))
  end

  local hms = {
    { name = "hit_body_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.hit },
    { name = "hit_crit_confirm", texture = HitMark.settings.crit_texture, color = HitMark.settings.crit },
    { name = "hit_head_confirm", texture = HitMark.settings.headshot_texture, color = HitMark.settings.headshot },
    { name = "kill_body_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.hit_kill },
    { name = "kill_crit_confirm", texture = HitMark.settings.crit_texture, color = HitMark.settings.crit_kill },
    { name = "kill_head_confirm", texture = HitMark.settings.headshot_texture, color = HitMark.settings.headshot_kill }
  }
  local hp = self._hud_panel
  local blend_mode = HitMark.settings.blend_mode

  self.hitmark_bitmaps = {}

  for i, hm in ipairs(hms) do
    if hp:child(hm.name) then
      hp:remove(hp:child(hm.name))
    end

    local bmp = hp:bitmap({
      layer = 0,
      name = hm.name,
      visible = false,
      valign = "center",
      halign = "center",
      texture = hm.texture,
      color = Color(hm.color),
      blend_mode = blend_mode
    })
    local w = bmp:texture_width()

    if w * 3 == bmp:texture_height() then
      bmp:set_texture_rect(0, math.mod(i - 1, 3) * w, w, w)
      bmp:set_height(w)
    end

    bmp:set_center(hp:w() / 2, hp:h() / 2)

    self.hitmark_bitmaps[i] = bmp
  end
end)

local function AnimateToggle(self, mark)
  mark:stop()
  mark:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
end

function HUDHitConfirm:on_damage_confirmed(kill_confirmed, headshot)
  local index = (kill_confirmed and 4 or 1) + (HitMark.critshot and 1 or (headshot and 2 or 0))
  local mark = self.hitmark_bitmaps[index]

  AnimateToggle(self, mark)
end

function HUDHitConfirm:on_hit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
  else
    local mark = self.hitmark_bitmaps[1];

    AnimateToggle(self, mark)
  end
end

function HUDHitConfirm:on_crit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
    HitMark.critshot = true
  else
    local mark = self.hitmark_bitmaps[2];

    AnimateToggle(self, mark)
  end
end

function HUDHitConfirm:on_headshot_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
  else
    local mark = self.hitmark_bitmaps[3];

    AnimateToggle(self, mark)
  end
end
