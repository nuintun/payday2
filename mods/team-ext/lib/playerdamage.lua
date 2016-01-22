--noinspection UnusedDef
Hooks:PostHook(PlayerDamage, "update", "teamExtPlayerDamageUpdate", function(self, unit, t, dt)
  if self:got_messiah_charges() then
    managers.hud:update_downed_counter(self._messiah_charges .. "/" .. tostring(Application:digest_value(self._revives, false) - 1))
  else
    managers.hud:update_downed_counter(tostring(Application:digest_value(self._revives, false) - 1))
  end
end)
