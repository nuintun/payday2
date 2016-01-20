CloneClass(MenuNodeGui)

function MenuNodeGui._highlight_row_item(self, row_item, mouse_over)
	self.orig._highlight_row_item(self, row_item, mouse_over)
	if row_item then
		if row_item.type == "server_column" then
			for i, gui in ipairs(row_item.gui_columns) do
				--gui:set_color(i == 2 and  row_item.item:parameters().pro and tweak_data.screen_colors.pro_color or row_item.color)
				gui:set_color(i == 2 and  row_item.item:parameters().pro and Color.red or row_item.color)
				gui:set_font(Idstring(row_item.font))
			end
			for i, gui in pairs(row_item.difficulty_icons) do
				gui:set_color(row_item.color)
			end
			row_item.gui_info_panel:set_visible(true)
		end
	end
end

function MenuNodeGui._fade_row_item(self, row_item)
	self.orig._fade_row_item(self, row_item)
	if row_item then
		if row_item.type == "server_column" then
			for i, gui in ipairs(row_item.gui_columns) do
				gui:set_color(i == 2 and  row_item.item:parameters().pro and tweak_data.screen_colors.pro_color or row_item.color)
				gui:set_font(Idstring(row_item.font))
			end
			for i, gui in pairs(row_item.difficulty_icons) do
				gui:set_color(tweak_data.screen_colors.risk)
			end
			row_item.gui_info_panel:set_visible(false)
		end
	end
	
end

function MenuNodeGui._create_legends(self, node)
	self.orig._create_legends(self, node)
	--[[local safe_rect_pixels = self:_scaled_size()
	local res = RenderSettings.resolution
	local visible = not managers.menu:is_pc_controller()
	local is_pc = managers.menu:is_pc_controller()
	self._legends_panel = self.ws:panel():panel({
		visible = visible,
		x = safe_rect_pixels.x,
		y = safe_rect_pixels.y,
		w = safe_rect_pixels.width,
		h = safe_rect_pixels.height
	})
	local t_text = ""
	local has_pc_legend = false
	local visible_callback_name, visible_callback
	for i, legend in ipairs(node:legends()) do
		visible_callback_name = legend.visible_callback
		visible_callback = nil
		if visible_callback_name then
			visible_callback = callback(node.callback_handler, node.callback_handler, visible_callback_name)
		end
		if (not is_pc or legend.pc) and (not visible_callback or visible_callback(self)) then
			has_pc_legend = has_pc_legend or legend.pc
			local spacing = i > 1 and "  |  " or ""
			t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(legend.string_id, {
				BTN_UPDATE = managers.localization:btn_macro("menu_update") or managers.localization:get_default_macro("BTN_Y"),
				BTN_BACK = managers.localization:btn_macro("back")
			}))
		end
	end
	if is_pc then
		self._legends_panel:set_visible(has_pc_legend)
	end
	local text = self._legends_panel:text({
		text = t_text,
		font = self.legends_font or self.font,
		font_size = self.legends_font_size or self.font_size,
		color = self.color,
		layer = self.layers.items
	})
	local _, _, w, h = text:text_rect()
	text:set_size(w, h)
	self:_layout_legends()]]--
	--self._legends_panel:set_visible(true)
	local is_pc = managers.menu:is_pc_controller()
	local has_pc_legend = false
	local visible_callback_name, visible_callback
	local t_text = ""
	for i, legend in pairs(node:legends()) do
		visible_callback_name = legend.visible_callback
		visible_callback = nil
		if visible_callback_name then
			visible_callback = callback(node.callback_handler, node.callback_handler, visible_callback_name)
		end
		if (not is_pc or legend.pc) and (not visible_callback or visible_callback(self)) then
			has_pc_legend = has_pc_legend or legend.pc
			local spacing = i > 1 and "  |  " or ""
			t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(legend.string_id, {
				BTN_UPDATE = managers.localization:btn_macro("menu_update") or managers.localization:get_default_macro("BTN_Y"),
				BTN_BACK = managers.localization:btn_macro("back")
			}))
		end
	end
	local text = self._legends_panel:child(0)
	text:set_text(t_text)
	local _, _, w, h = text:text_rect()
	text:set_size(w, h)
	self:_layout_legends()
end

--[[function MenuNodeGui:_create_legends(node) 
	local safe_rect_pixels = self:_scaled_size() 
	local res = RenderSettings.resolution 
	local visible = not managers.menu:is_pc_controller() 
	local is_pc = managers.menu:is_pc_controller() 
	self._legends_panel = self.ws:panel():panel({ 
		visible = visible, 
		x = safe_rect_pixels.x, 
		y = safe_rect_pixels.y, 
		w = safe_rect_pixels.width, 
		h = safe_rect_pixels.height 
	}) 
	local t_text = "" 
	local has_pc_legend = false 
	local visible_callback_name, visible_callback 
	for i, legend in ipairs(node:legends()) do 
		visible_callback_name = legend.visible_callback 
		visible_callback = nil 
		if visible_callback_name then 
			visible_callback = callback(node.callback_handler, node.callback_handler, visible_callback_name) 
		end 
		if (not is_pc or legend.pc) and (not visible_callback or visible_callback(self)) then 
			has_pc_legend = has_pc_legend or legend.pc 
			local spacing = i > 1 and " | " or "" 
			t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(legend.string_id, { 
				BTN_UPDATE = managers.localization:btn_macro("menu_update") or managers.localization:get_default_macro("BTN_Y"), 
				BTN_BACK = managers.localization:btn_macro("back") 
			})) 
		end 
	end 
	if is_pc then 
		self._legends_panel:set_visible(has_pc_legend) 
	end 
	local text = self._legends_panel:text({ 
		text = t_text, 
		font = self.legends_font or self.font, 
		font_size = self.legends_font_size or self.font_size, 
		color = self.color, 
		layer = self.layers.items 
	}) 
	local _, _, w, h = text:text_rect() 
	text:set_size(w, h) 
	self:_layout_legends() 
end]]--