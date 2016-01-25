local eh_original_hudhitconfirm_init = HUDHitConfirm.init

function HUDHitConfirm:init(hud)
  eh_original_hudhitconfirm_init(self, hud)

  if self._hud_panel:child("headshot_confirm") then
    -- no hoxhud's red circle allowed
    self._hud_panel:child("headshot_confirm"):set_size(0, 0)
  end

  local tex_hit = "guis/textures/pd2/hitconfirm"
  local tex_kill = "guis/textures/pd2/hitconfirm_crit"
  local hms = {
    { name = "hit_body_confirm", texture = tex_hit, color = HitMark.settings.body },
    { name = "hit_head_confirm", texture = tex_hit, color = HitMark.settings.head },
    { name = "hit_crit_confirm", texture = tex_hit, color = HitMark.settings.crit },
    { name = "kill_body_confirm", texture = tex_kill, color = HitMark.settings.body },
    { name = "kill_head_confirm", texture = tex_kill, color = HitMark.settings.head },
    { name = "kill_crit_confirm", texture = tex_kill, color = HitMark.settings.crit }
  }

  self.eh_bitmaps = {}

  local hp = self._hud_panel
  local blend_mode = HitMark:GetBlendMode()

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
end

function HUDHitConfirm:on_damage_confirmed(kill_confirmed, headshot)
  local index = (kill_confirmed and 4 or 1) + (HitMark.critshot and 2 or (headshot and 1 or 0))
  local hm = self.eh_bitmaps[index]

  hm:stop()

  if HitMark.settings.shake then
    local rotation_angle = math.random(0, 8) - 4

    hm:rotate(rotation_angle)
  end

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
