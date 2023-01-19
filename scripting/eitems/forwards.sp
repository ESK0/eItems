public void CreateForwards()
{
    g_OnItemsSynced = new GlobalForward("eItems_OnItemsSynced", ET_Ignore);
    g_OnWeaponGiven = new GlobalForward("eItems_OnWeaponGiven", ET_Ignore, Param_Cell, Param_Cell, Param_String, Param_Cell, Param_Cell, Param_Cell, Param_Cell);
}