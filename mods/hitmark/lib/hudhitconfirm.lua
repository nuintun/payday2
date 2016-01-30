--- 监听函数挂接后置钩子
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
    { name = "hit_crit_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.crit },
    { name = "hit_head_confirm", texture = HitMark.settings.hit_texture, color = HitMark.settings.headshot },
    { name = "kill_body_confirm", texture = HitMark.settings.kill_texture, color = HitMark.settings.hit },
    { name = "kill_crit_confirm", texture = HitMark.settings.kill_texture, color = HitMark.settings.crit },
    { name = "kill_head_confirm", texture = HitMark.settings.kill_texture, color = HitMark.settings.headshot }
  }
  local hp = self._hud_panel
  local blend_mode = HitMark.settings.blend_mode

  self.hitmark_bitmaps = {}

  for i, hm in ipairs(hms) do
    if hp:child(hm.name) then
      hp:remove(hp:child(hm.name))
    end

    local bmp = hp:bitmap({
      layer = 1,
      w = 15,
      h = 15,
      name = hm.name,
      visible = false,
      valign = "center",
      halign = "center",
      texture = hm.texture,
      color = Color(hm.color),
      blend_mode = blend_mode
    })

    bmp:set_center(hp:w() / 2, hp:h() / 2)

    self.hitmark_bitmaps[i] = bmp
  end
end)

--- 显示动画
-- @param self
-- @param mark
local function AnimateToggle(self, mark)
  mark:stop()
  mark:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
end

--- 伤害回调
-- @param death
-- @param headshot
function HUDHitConfirm:on_damage_confirmed(death, headshot)
  local index = (death and 4 or 1) + (HitMark.critshot and 1 or (headshot and 2 or 0))

  AnimateToggle(self, self.hitmark_bitmaps[index])
end

--- 击中回调
function HUDHitConfirm:on_hit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
  else
    AnimateToggle(self, self.hitmark_bitmaps[1])
  end
end

--- 暴击回调
function HUDHitConfirm:on_crit_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
    HitMark.critshot = true
  else
    AnimateToggle(self, self.hitmark_bitmaps[2])
  end
end

--- 爆头回调
function HUDHitConfirm:on_headshot_confirmed()
  if HitMark.hooked then
    HitMark.direct_hit = true
  else
    AnimateToggle(self, self.hitmark_bitmaps[3])
  end
end
