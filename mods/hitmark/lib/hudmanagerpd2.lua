function HUDManager:on_damage_confirmed(kill_confirmed, headshot)
  if not managers.user:get_setting("hit_indicator") then
    return
  end
  self._hud_hit_confirm:on_damage_confirmed(kill_confirmed, headshot)
end
