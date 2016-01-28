Hooks:PostHook(DoctorBagBase, "take", "compacthud_doctorbagbase_take", function()
  managers.hud._teammate_panels[managers.hud.PLAYER_PANEL]:reset_downs()
end)
