Hooks:PostHook(PlayerDamage, "on_downed", "compacthud_playerdamage_on_downed", function(self, incapacitated)
  managers.hud:setdowned()

  if not incapacitated then
    managers.hud:update_downs()
  end
end)

function PlayerDamage:on_incapacitated()
  self:on_downed(true)

  self._incapacitated = true
end
