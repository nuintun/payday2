_G.HitMark = _G.HitMark or {}

HitMark._texture_reload_delay = 0.1
HitMark._path = ModPath
HitMark._data_path = SavePath .. "enhanced_hitmarkers_options.txt"
HitMark._data = {}
HitMark.override_path = "assets/mod_overrides/Enhanced Hitmarkers/guis/textures/pd2/"
HitMark.texture_list = {}
HitMark.settings = {
  hit_texture = "classic hit v2.texture",
  kill_texture = "TdlQ.texture",
}

function HitMark:Reset()
  self.settings.body = "ff5500"
  self.settings.head = "57ff00"
  self.settings.crit = "ff00ff"
  self.settings.shake = true
  self.settings.blend_mode = 1
end

function HitMark:IsTextureOverridden(texture)
  local result = false

  for mod_name, mod_data in pairs(DB:mods()) do
    if mod_name == "Enhanced Hitmarkers" then
      for _, path in ipairs(mod_data.files or {}) do
        if path:match(texture .. '$') then
          result = true
          break
        end
      end
      break
    end
  end

  return result
end

function HitMark:CopyTexture(src_name, dst_name)
  local result = false
  local src = io.open(src_name, "rb")
  if src then
    os.remove(dst_name)
    local dst = io.open(dst_name, "wb")
    if dst then
      dst:write(src:read("*all"))
      dst:close()
      result = true
    end
    src:close()
  end
  return result
end

function HitMark:InitializeModOverridesFolder()
  local overrides = file.GetFiles(self.override_path)

  if not overrides then
    log("[EH] Creating Enhanced Hitmarkers overrides folder...")
    os.execute('mkdir "' .. self.override_path:gsub("/", "\\") .. '"')
    overrides = file.GetFiles(self.override_path)
  end

  local sources = file.GetFiles(self._path .. "hitmarkers/")
  for _, filename in pairs(sources) do
    if not io.file_is_readable(self.override_path .. filename) then
      log("[EH] Copying " .. filename)
      local r = self:CopyTexture(self._path .. "hitmarkers/" .. filename, self.override_path .. filename)
      log("[EH] --> " .. (r and "success" or "failure"))
    end
  end

  self._hit_texture_overrides_not_initialized = not self:IsTextureOverridden("hitconfirm.texture")
  self._kill_texture_overrides_not_initialized = not self:IsTextureOverridden("hitconfirm_crit.texture")

  if not io.file_is_readable(self.override_path .. "hitconfirm.texture") then
    self:CopyTexture(self.override_path .. self.settings.hit_texture, self.override_path .. "hitconfirm.texture")
  end

  if not io.file_is_readable(self.override_path .. "hitconfirm_crit.texture") then
    self:CopyTexture(self.override_path .. self.settings.kill_texture, self.override_path .. "hitconfirm_crit.texture")
  end
end

function HitMark:MultiSetChoice(multi, choice)
  for _, option in ipairs(multi._all_options) do
    if option:parameters().text_id == choice then
      multi:set_value(option:parameters().value)
      return
    end
  end
end

function HitMark:IsTexture(file)
  local result = false
  local fh = io.open(file, "r")
  if fh then
    result = fh:read(3) == "DDS"
    fh:close()
  end
  return result
end

function HitMark:ListAvailableTextures()
  if #self.texture_list > 0 then return end

  self.texture_list = {}

  local menu = MenuHelper:GetMenu("eh_options_menu")
  local multi_hit = menu:item("eh_multi_texture_hit")
  local multi_kill = menu:item("eh_multi_texture_kill")

  for k, v in pairs(file.GetFiles(self.override_path)) do
    if v ~= "hitconfirm.texture" and v ~= "hitconfirm_crit.texture" and self:IsTexture(self.override_path .. v) then
      self.texture_list[k] = v
      local c = { _meta = "option", text_id = v:gsub('\.[^\.]*$', ''), value = k, localize = false }
      multi_hit:add_option(CoreMenuItemOption.ItemOption:new(c))
      multi_kill:add_option(CoreMenuItemOption.ItemOption:new(c))
    end
  end

  multi_hit:_show_options(nil)
  multi_kill:_show_options(nil)

  self:MultiSetChoice(multi_hit, self.settings.hit_texture:gsub('\.[^\.]*$', ''))
  self:MultiSetChoice(multi_kill, self.settings.kill_texture:gsub('\.[^\.]*$', ''))

  multi_hit:set_enabled(not managers.hud and not self._hit_texture_overrides_not_initialized)
  multi_kill:set_enabled(not managers.hud and not self._kill_texture_overrides_not_initialized)
end

function HitMark:DialogRestartRequired()
  local title = managers.localization:text("eh_options_menu_title")
  local message = managers.localization:text("eh_options_info_popup_message_restart_required")
  if managers.hud then
    message = message .. managers.localization:text("eh_options_info_popup_message_should_restart")
  else
    message = message .. managers.localization:text("eh_options_info_popup_message_restart_now")
  end
  local menu_options = {}
  menu_options[1] = {
    text = managers.localization:text("eh_options_info_popup_close"),
    is_cancel_button = true
  }
  local help_menu = QuickMenu:new(title, message, menu_options, true)
end

function HitMark:DialogHelp()
  local title = managers.localization:text("eh_options_menu_title")
  local message = managers.localization:text("eh_options_info_popup_message_help")
  local menu_options = {}
  menu_options[1] = {
    text = managers.localization:text("eh_options_info_popup_close"),
    is_cancel_button = true
  }
  local help_menu = QuickMenu:new(title, message, menu_options, true)
end

function HitMark:StoreColorSettings()
  self.settings.body = string.format("%02x%02x%02x", math.floor(self._data.BR * 100), math.floor(self._data.BG * 100), math.floor(self._data.BB * 100))
  self.settings.head = string.format("%02x%02x%02x", math.floor(self._data.HR * 100), math.floor(self._data.HG * 100), math.floor(self._data.HB * 100))
  self.settings.crit = string.format("%02x%02x%02x", math.floor(self._data.CR * 100), math.floor(self._data.CG * 100), math.floor(self._data.CB * 100))
end

function HitMark:SettingsToData()
  self._data.BR = tonumber(string.sub(self.settings.body, 1, 2), 16) / 100
  self._data.BG = tonumber(string.sub(self.settings.body, 3, 4), 16) / 100
  self._data.BB = tonumber(string.sub(self.settings.body, 5, 6), 16) / 100

  self._data.HR = tonumber(string.sub(self.settings.head, 1, 2), 16) / 100
  self._data.HG = tonumber(string.sub(self.settings.head, 3, 4), 16) / 100
  self._data.HB = tonumber(string.sub(self.settings.head, 5, 6), 16) / 100

  self._data.CR = tonumber(string.sub(self.settings.crit, 1, 2), 16) / 100
  self._data.CG = tonumber(string.sub(self.settings.crit, 3, 4), 16) / 100
  self._data.CB = tonumber(string.sub(self.settings.crit, 5, 6), 16) / 100

  self._data.shake = self.settings.shake
  self._data.blend_mode = self.settings.blend_mode
end

function HitMark:Load()
  self:Reset()
  local file = io.open(self._data_path, "r")
  if file then
    for k, v in pairs(json.decode(file:read("*all")) or {}) do
      self.settings[k] = v
    end
    file:close()
  end
  self:SettingsToData()
end

function HitMark:Save()
  local file = io.open(self._data_path, "w+")
  if file then
    self:StoreColorSettings()
    file:write(json.encode(self.settings))
    file:close()
  end

  if managers.hud then
    managers.hud:_create_hit_confirm()
  end
end

function HitMark:GetBlendMode()
  local modes = { "add", "normal" }
  return modes[self.settings.blend_mode]
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
    self._bmp_body_hit = self:CreateHitmarkerBitmap(1, "guis/textures/pd2/hitconfirm", self.settings.body, 0.04, 0.24)
    self._bmp_head_hit = self:CreateHitmarkerBitmap(2, "guis/textures/pd2/hitconfirm", self.settings.head, 0.04, 0.375)
    self._bmp_crit_hit = self:CreateHitmarkerBitmap(3, "guis/textures/pd2/hitconfirm", self.settings.crit, 0.04, 0.51)
  end
end

function HitMark:CreateKillBitmaps()
  if alive(self._panel) and not self._bmp_body_kill then
    self._bmp_body_kill = self:CreateHitmarkerBitmap(1, "guis/textures/pd2/hitconfirm_crit", self.settings.body, 0.02, 0.28)
    self._bmp_head_kill = self:CreateHitmarkerBitmap(2, "guis/textures/pd2/hitconfirm_crit", self.settings.head, 0.02, 0.415)
    self._bmp_crit_kill = self:CreateHitmarkerBitmap(3, "guis/textures/pd2/hitconfirm_crit", self.settings.crit, 0.02, 0.55)
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

function HitMark:CreatePreviewPanel()
  if self._panel or not managers.menu_component then
    return
  end

  if not managers.hud then
    TextureCache:unretrieve(Idstring("guis/textures/pd2/hitconfirm"))
  end

  self._panel = managers.menu_component._ws:panel():panel()
  self:CreateHitBitmaps()
  self:CreateKillBitmaps()
end

function HitMark:DestroyPreviewPanel()
  if not alive(self._panel) then
    return
  end

  self._panel:clear()
  self._bmp_body_hit = nil
  self._bmp_body_kill = nil
  self._bmp_head_hit = nil
  self._bmp_head_kill = nil
  self._bmp_crit_hit = nil
  self._bmp_crit_kill = nil

  self._panel:parent():remove(self._panel)
  self._panel = nil

  if not managers.hud then
    TextureCache:retrieve(Idstring("guis/textures/pd2/hitconfirm"), "NORMAL")
  end
end

function HitMark:UpdatePreview(bmp, color)
  if alive(self._panel) and alive(bmp) then
    bmp:set_color(Color(color))
  end
end

function HitMark.EHNotificationClickCallback()
  setup:quit()
  return true
end

Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenu_HitMark", function(menu_manager, menu, position)
  if menu == "menu_main" then
    if HitMark._hit_texture_overrides_not_initialized or HitMark._kill_texture_overrides_not_initialized then
      if not NotificationsManager:NotificationExists("EH restart required") then
        NotificationsManager:AddNotification("EH restart required", managers.localization:text("eh_options_menu_title"), managers.localization:text("eh_options_info_popup_message_restart_required"), 1000, HitMark.EHNotificationClickCallback)
      end
    end
  end
end)

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_HitMark", function(loc)
  if _G.PD2KR then
    loc:load_localization_file(HitMark._path .. "loc/korean.txt")
  else
    for _, filename in pairs(file.GetFiles(HitMark._path .. "loc/")) do
      local str = filename:match('^(.*).txt$')
      if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
        loc:load_localization_file(HitMark._path .. "loc/" .. filename)
        break
      end
    end
  end

  loc:load_localization_file(HitMark._path .. "loc/english.txt", false)
end)


Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_HitMark", function(menu_manager)
  MenuCallbackHandler.HitMarkHelp = function(this, item)
    HitMark:DialogHelp()
  end

  MenuCallbackHandler.HitMarkSetRedBody = function(this, item)
    HitMark._data.BR = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_body_hit, HitMark.settings.body)
    HitMark:UpdatePreview(HitMark._bmp_body_kill, HitMark.settings.body)
  end

  MenuCallbackHandler.HitMarkSetGreenBody = function(this, item)
    HitMark._data.BG = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_body_hit, HitMark.settings.body)
    HitMark:UpdatePreview(HitMark._bmp_body_kill, HitMark.settings.body)
  end

  MenuCallbackHandler.HitMarkSetBlueBody = function(this, item)
    HitMark._data.BB = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_body_hit, HitMark.settings.body)
    HitMark:UpdatePreview(HitMark._bmp_body_kill, HitMark.settings.body)
  end

  MenuCallbackHandler.HitMarkSetRedHead = function(this, item)
    HitMark._data.HR = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_head_hit, HitMark.settings.head)
    HitMark:UpdatePreview(HitMark._bmp_head_kill, HitMark.settings.head)
  end

  MenuCallbackHandler.HitMarkSetGreenHead = function(this, item)
    HitMark._data.HG = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_head_hit, HitMark.settings.head)
    HitMark:UpdatePreview(HitMark._bmp_head_kill, HitMark.settings.head)
  end

  MenuCallbackHandler.HitMarkSetBlueHead = function(this, item)
    HitMark._data.HB = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_head_hit, HitMark.settings.head)
    HitMark:UpdatePreview(HitMark._bmp_head_kill, HitMark.settings.head)
  end

  MenuCallbackHandler.HitMarkSetRedCrit = function(this, item)
    HitMark._data.CR = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_crit_hit, HitMark.settings.crit)
    HitMark:UpdatePreview(HitMark._bmp_crit_kill, HitMark.settings.crit)
  end

  MenuCallbackHandler.HitMarkSetGreenCrit = function(this, item)
    HitMark._data.CG = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_crit_hit, HitMark.settings.crit)
    HitMark:UpdatePreview(HitMark._bmp_crit_kill, HitMark.settings.crit)
  end

  MenuCallbackHandler.HitMarkSetBlueCrit = function(this, item)
    HitMark._data.CB = tonumber(item:value())
    HitMark:StoreColorSettings()
    HitMark:UpdatePreview(HitMark._bmp_crit_hit, HitMark.settings.crit)
    HitMark:UpdatePreview(HitMark._bmp_crit_kill, HitMark.settings.crit)
  end

  MenuCallbackHandler.HitMarkChangedFocus = function(node, focus)
    if focus then
      local menu = MenuHelper:GetMenu("eh_options_menu")
      local multi_blend_mode = menu:item("eh_multi_set_blend_mode")
      multi_blend_mode:set_enabled(not managers.hud)

      HitMark:ListAvailableTextures()
      if HitMark._hit_texture_overrides_not_initialized or HitMark._kill_texture_overrides_not_initialized then
        HitMark:DialogRestartRequired()
        if not managers.hud then
          setup:quit()
        end
      else
        HitMark:CreatePreviewPanel()
      end
    else
      HitMark:DestroyPreviewPanel()
    end
  end

  MenuCallbackHandler.HitMarkSetTextureHit = function(this, item)
    local texture_name = HitMark.texture_list[item:value()]
    if HitMark:CopyTexture(HitMark.override_path .. texture_name, HitMark.override_path .. "hitconfirm.texture") then
      HitMark.settings.hit_texture = texture_name
      HitMark:Save()
      HitMark:RemoveHitBitmaps()
      DelayedCalls:Remove("DelayedCreateHitBitmaps")
      DelayedCalls:Add("DelayedCreateHitBitmaps", HitMark._texture_reload_delay, function() HitMark:CreateHitBitmaps() end)
    end
  end

  MenuCallbackHandler.HitMarkSetTextureKill = function(this, item)
    local texture_name = HitMark.texture_list[item:value()]
    if HitMark:CopyTexture(HitMark.override_path .. texture_name, HitMark.override_path .. "hitconfirm_crit.texture") then
      HitMark.settings.kill_texture = texture_name
      HitMark:Save()
      HitMark:RemoveKillBitmaps()
      DelayedCalls:Remove("DelayedCreateKillBitmaps")
      DelayedCalls:Add("DelayedCreateKillBitmaps", HitMark._texture_reload_delay, function() HitMark:CreateKillBitmaps() end)
    end
  end

  MenuCallbackHandler.HitMarkSetShake = function(this, item)
    HitMark.settings.shake = item:value() == "on" and true or false
  end

  MenuCallbackHandler.HitMarkSetBlendMode = function(this, item)
    HitMark.settings.blend_mode = item:value()
    HitMark:DestroyPreviewPanel()
    HitMark:CreatePreviewPanel()
  end

  MenuCallbackHandler.HitMarkReset = function(this, item)
    HitMark:Reset()
    HitMark:SettingsToData()
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_body_r"] = true }, HitMark._data.BR)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_body_g"] = true }, HitMark._data.BG)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_body_b"] = true }, HitMark._data.BB)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_head_r"] = true }, HitMark._data.HR)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_head_g"] = true }, HitMark._data.HG)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_head_b"] = true }, HitMark._data.HB)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_crit_r"] = true }, HitMark._data.CR)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_crit_g"] = true }, HitMark._data.CG)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_slider_colour_crit_b"] = true }, HitMark._data.CB)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_multi_set_blend_mode"] = true }, HitMark._data.blend_mode)
    MenuHelper:ResetItemsToDefaultValue(item, { ["eh_toggle_shake"] = true }, HitMark._data.shake)
    HitMark:Save()
  end

  MenuCallbackHandler.HitMarkSave = function(this, item)
    HitMark:Save()
    HitMark.texture_list = {}
  end

  HitMark:InitializeModOverridesFolder()
  HitMark:Load()
  MenuHelper:LoadFromJsonFile(HitMark._path .. "menu/options.txt", HitMark, HitMark._data)
end)
