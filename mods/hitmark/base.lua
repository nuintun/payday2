_G.HitMark = _G.HitMark or {}

HitMark._texture_reload_delay = 0.1
HitMark._path = ModPath
HitMark._data = {}
HitMark.settings = {
  hit_texture = "guis/textures/pd2/hitconfirm.texture",
  crit_texture = "guis/textures/pd2/hitconfirm_crit.texture",
  headshot_texture = "guis/textures/pd2/hitconfirm_headshot.texture"
}

function HitMark:GetBlendMode()
  return "normal"
end

function HitMark:Init()
  self.settings.shake = true
  self.settings.hit = "ff0000"
  self.settings.crit = "ff0000"
  self.settings.headshot = "ff0000"
  self.settings.hit_kill = "00ff00"
  self.settings.crit_kill = "00ff00"
  self.settings.headshot_kill = "00ff00"
end

function HitMark:Load()
  self:Init()
end

function HitMark:CreateHitmarkerBitmap(i, texture, color, x, y)
  local bmp = self._panel:bitmap({
    valign = "center",
    halign = "center",
    visible = true,
    texture = texture,
    color = Color(color),
    layer = tweak_data.gui.MOUSE_LAYER - 50,
    blend_mode = self:GetBlendMode()
  })

  local w = bmp:texture_width()

  if w * 3 == bmp:texture_height() then
    bmp:set_texture_rect(0, math.mod(i - 1, 3) * w, w, w)
    bmp:set_height(w)
  end

  bmp:set_right(self._panel:right() - self._panel:w() * (0.35 + x))
  bmp:set_top(self._panel:h() * y)

  return bmp
end

function HitMark:CreateHitBitmaps()
  if alive(self._panel) and not self._bmp_body_hit then
    self._bmp_body_hit = self:CreateHitmarkerBitmap(1, self.settings.hit_texture, self.settings.hit, 0.04, 0.24)
    self._bmp_crit_hit = self:CreateHitmarkerBitmap(3, self.settings.crit_texture, self.settings.crit, 0.04, 0.51)
    self._bmp_head_hit = self:CreateHitmarkerBitmap(2, self.settings.headshot_texture, self.settings.headshot, 0.04, 0.375)
  end
end

function HitMark:CreateKillBitmaps()
  if alive(self._panel) and not self._bmp_body_kill then
    self._bmp_body_kill = self:CreateHitmarkerBitmap(1, self.settings.hit_texture, self.settings.hit_kill, 0.02, 0.28)
    self._bmp_crit_kill = self:CreateHitmarkerBitmap(3, self.settings.crit_texture, self.settings.crit_kill, 0.02, 0.55)
    self._bmp_head_kill = self:CreateHitmarkerBitmap(2, self.settings.headshot_texture, self.settings.headshot_kill, 0.02, 0.415)
  end
end

function HitMark:RemoveHitBitmaps()
  if not alive(self._panel) then
    return
  end

  if self._bmp_body_hit then
    self._panel:remove(self._bmp_body_hit)
    self._bmp_body_hit = nil
  end

  if self._bmp_head_hit then
    self._panel:remove(self._bmp_head_hit)
    self._bmp_head_hit = nil
  end

  if self._bmp_crit_hit then
    self._panel:remove(self._bmp_crit_hit)
    self._bmp_crit_hit = nil
  end
end

function HitMark:RemoveKillBitmaps()
  if not alive(self._panel) then
    return
  end

  if self._bmp_body_kill then
    self._panel:remove(self._bmp_body_kill)
    self._bmp_body_kill = nil
  end

  if self._bmp_head_kill then
    self._panel:remove(self._bmp_head_kill)
    self._bmp_head_kill = nil
  end

  if self._bmp_crit_kill then
    self._panel:remove(self._bmp_crit_kill)
    self._bmp_crit_kill = nil
  end
end


if RequiredScript then
  local hook_files = {
    ["lib/managers/menumanager"] = "lib/menumanager.lua",
    ["lib/managers/hudmanagerpd2"] = "lib/hudmanagerpd2.lua",
    ["lib/managers/hud/hudhitconfirm"] = "lib/hudhitconfirm.lua",
    ["lib/units/enemies/cop/copdamage"] = "lib/copdamage.lua",
    ["lib/units/equipment/sentry_gun/sentrygundamage"] = "lib/sentrygundamage.lua"
  }
  local requiredScript = RequiredScript:lower()

  if hook_files[requiredScript] then
    dofile(HitMark.ModPath .. hook_files[requiredScript])
  end
end


