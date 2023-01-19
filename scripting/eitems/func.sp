public int GetWeaponCount()
{
    return g_iWeaponCount;
}

public int GetPaintsCount()
{
    return g_iPaintsCount;
}

public int GetGlovesCount()
{
    return g_iGlovesCount;
}

public int GetMusicKitsCount()
{
    return g_iMusicKitsCount;
}

public int GetPinsCount()
{
    return g_iPinsCount;
}

public int GetCoinsCount()
{
    return g_iCoinsCount;
}

public int GetCoinsSetsCount()
{
    return g_iCoinsSetsCount;
}

public int GetStickersCount()
{
    return g_iStickersCount;
}

public int GetStickersSetsCount()
{
    return g_iStickersSetsCount;
}

public int GetAgentsCount()
{
    return g_iAgentsCount;
}

public int GetPatchesCount()
{
    return g_iPatchesCount;
}

public int GetCratesCount()
{
    return g_iCratesCount;
}

public int GetSpraysCount()
{
    return g_iSpraysCount;
}

public int GetSpraysSetsCount()
{
    return g_iSpraysSetsCount;
}

public bool AreItemsSynced()
{
    return g_bItemsSynced;
}

public bool AreItemsSyncing()
{
    return g_bItemsSyncing;
}

    // Generic
public bool IsDefIndexKnife(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof szDefIndex);

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    if(WeaponInfo.Slot == CS_SLOT_KNIFE)
    {
        return true;
    }

    return false;
}

public int GetActiveWeapon(int client)
{
    if (!IsValidClient(client, true))
    {
        return -1;
    }

    return GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
}

public int GetInSlotWeapon(int client, int iSlot)
{
    int iMyWeapons = GetEntPropArraySize(client, Prop_Send, "m_hMyWeapons");

    for (int i = 0; i < iMyWeapons; i++)
    {
        int iWeapon = GetEntPropEnt(client, Prop_Send, "m_hMyWeapons", i);

        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        if(GetWeaponSlotByWeapon(iWeapon) == iSlot)
        {
            return iWeapon;
        }
    }
    return -1;
}

public int GetActiveWeaponDefIndex(int client)
{
    int iWeapon = GetActiveWeapon(client);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponDefIndexByWeapon(iWeapon);
}

public int FindWeaponByWeaponNum(int client, int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szClassName[48];

    if (!GetWeaponClassNameByWeaponNum(iWeaponNum, szClassName, sizeof szClassName))
    {
        return -1;
    }

    return FindWeaponByClassName(client, szClassName);
}

public int FindWeaponByClassName(int client, const char[] szClassName)
{
    if(!IsValidClient(client, true))
    {
        return -1;
    }


    int iWantedDefIndex = GetWeaponDefIndexByClassName(szClassName);

    if(g_arWeaponsNum.FindValue(iWantedDefIndex) == -1)
    {
        return -1;
    }

    int iMyWeapons = GetEntPropArraySize(client, Prop_Send, "m_hMyWeapons");

    for (int i = 0; i < iMyWeapons; i++)
    {
        int iWeapon = GetEntPropEnt(client, Prop_Send, "m_hMyWeapons", i);

        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        int iWeaponDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

        if(iWeaponDefIndex == iWantedDefIndex)
        {
            return iWeapon;
        }
    }
    return -1;
}

public bool IsSkinnableDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof szDefIndex);

    ArrayList arWeaponPaints = null;
    g_smWeaponPaints.GetValue(szDefIndex, arWeaponPaints);
    if(arWeaponPaints == null)
    {
        return false;
    }
    return arWeaponPaints.Length > 0;
}

public int FindWeaponByDefIndex(int client, int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if (!GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof szClassName))
    {
        return -1;
    }

    return FindWeaponByClassName(client, szClassName);
}

public int GetWeaponNumByDefIndex(int iDefIndex)
{
    return g_arWeaponsNum.FindValue(iDefIndex);
}

public int GetWeaponNumByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof szDefIndex);
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return iWeaponNum;
        }
    }
    return -1;
}

public int GetWeaponNumByWeapon(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);
    if(iDefIndex <= 0)
    {
        return -1;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof szDefIndex);

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    return WeaponInfo.WeaponNum;
}

public int GetWeaponDefIndexByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return 0;
    }

    return GetEntProp(iWeapon, Prop_Send, "m_iItemDefinitionIndex");
}

public int GetWeaponDefIndexByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1;
    }

    if(iWeaponNum < 0)
    {
        return -1;
    }

    return g_arWeaponsNum.Get(iWeaponNum);
}

public int GetWeaponDefIndexByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return GetWeaponDefIndexByWeaponNum(iWeaponNum);
        }
    }
    return -1;
}

public bool IsValidWeapon(int iWeapon)
{
    if(!IsValidEntity(iWeapon) || !IsValidEdict(iWeapon) || iWeapon <= 0)
    {
        return false;
    }

    if(!HasEntProp(iWeapon, Prop_Send, "m_hOwnerEntity"))
    {
        return false;
    }

    int iDefIndex = GetEntProp(iWeapon, Prop_Send, "m_iItemDefinitionIndex");
    if(g_arWeaponsNum.FindValue(iDefIndex) != -1)
    {
        return true;
    }

    return false;
}

public bool IsValidWeaponClassName(const char[] szClassName)
{
    char szWeaponClassName[48];
    for(int iWeaponNum = 0; iWeaponNum < g_arWeaponsNum.Length; iWeaponNum++)
    {
        if(!GetWeaponClassNameByWeaponNum(iWeaponNum, szWeaponClassName, sizeof(szWeaponClassName)))
        {
            continue;
        }

        if(strcmp(szWeaponClassName, szClassName) != 0)
        {
            continue;
        }
        return true;
    }	
    return false;
}

    //ClassNames
public bool GetWeaponClassNameByWeaponNum(int iWeaponNum, char[] szClassName, int iLen)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}

public bool GetWeaponClassNameByDefIndex(int iDefIndex, char[] szClassName, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}

public bool GetWeaponClassNameByWeapon(int iWeapon, char[] szClassName, int iLen)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szClassName, iLen, WeaponInfo.ClassName);
    return true;
}

    //  DisplayNames
public bool GetWeaponDisplayNameByWeaponNum(int iWeaponNum, char[] szDisplayName, int iLen)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByWeapon(int iWeapon, char[] szDisplayName, int iLen)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
    return true;
}

public bool GetWeaponDisplayNameByClassName(const char[] szClassName, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            strcopy(szDisplayName, iLen, WeaponInfo.DisplayName);
            return true;
        }
    }
    return false;
}

    //  ViewModels
public bool GetWeaponViewModelByWeaponNum(int iWeaponNum, char[] szViewModel, int iLen)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByDefIndex(int iDefIndex, char[] szViewModel, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByWeapon(int iWeapon, char[] szViewModel, int iLen)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
    return true;
}

public bool GetWeaponViewModelByClassName(const char[] szClassName, char[] szViewModel, int iLen)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            strcopy(szViewModel, iLen, WeaponInfo.ViewModel);
            return true;
        }
    }
    return false;
}

    //  WorldModels
public bool GetWeaponWorldModelByWeaponNum(int iWeaponNum, char[] szWorldModel, int iLen)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
}

public bool GetWeaponWorldModelByDefIndex(int iDefIndex, char[] szWorldModel, int iLen)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
    }

public bool GetWeaponWorldModelByWeapon(int iWeapon, char[] szWorldModel, int iLen)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
    return true;
}

public bool GetWeaponWorldModelByClassName(const char[] szClassName, char[] szWorldModel, int iLen)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            strcopy(szWorldModel, iLen, WeaponInfo.WorldModel);
            return true;
        }
    }
    return false;
}

    //  Weapon Slot
public int GetWeaponSlotByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Slot;
}

public int GetWeaponSlotByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.Slot;
        }
    }
    return -1;
}

    //  Weapon Team
public int GetWeaponTeamByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Team;
}

public int GetWeaponTeamByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Team;
}

public int GetWeaponTeamByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Team;
}

public int GetWeaponTeamByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.Team;
        }
    }
    return -1;
}

    //  Clip Ammo
public int GetWeaponClipAmmoByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ClipAmmo;
}

public int GetWeaponClipAmmoByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.ClipAmmo;
        }
    }
    return -1;
}

    //  Reserve Ammo
public int GetWeaponReserveAmmoByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.ReserveAmmo;
}

public int GetWeaponReserveAmmoByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.ReserveAmmo;
        }
    }
    return -1;
}

    //  Price
public int GetWeaponPriceByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Price;
}

public int GetWeaponPriceByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Price;
}

public int GetWeaponPriceByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Price;
}

public int GetWeaponPriceByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.Price;
        }
    }
    return -1;
}

    //  Max Player Speed
public int GetWeaponMaxPlayerSpeedByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.MaxPlayerSpeed;
}

public int GetWeaponMaxPlayerSpeedByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.MaxPlayerSpeed;
        }
    }
    return -1;
}

    //  Damage
public int GetWeaponDamageByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Damage;
}

public int GetWeaponDamageByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.Damage;
        }
    }
    return -1;
}

    //  Is Full auto
public int IsWeaponFullAutoByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.FullAuto;
}

public int IsWeaponFullAutoByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.FullAuto;
        }
    }
    return -1;
}

    //  Spread
public float GetWeaponSpreadByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1.0;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return -1.0;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.Spread;
}

public float GetWeaponSpreadByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.Spread;
        }
    }
    return -1.0;
}

    //  Cycle Time
public float GetWeaponCycleTimeByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1.0;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return -1.0;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return -1.0;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.CycleTime;
}

public float GetWeaponCycleTimeByClassName(const char[] szClassName)
{
    char szDefIndex[12];
    for(int iWeaponNum = 0; iWeaponNum < g_iWeaponCount; iWeaponNum++)
    {
        int iDefIndex = g_arWeaponsNum.Get(iWeaponNum);
        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        eWeaponInfo WeaponInfo;
        g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        if(strcmp(szClassName, WeaponInfo.ClassName, false) == 0)
        {
            return WeaponInfo.CycleTime;
        }
    }
    return -1.0;
}

    //Stickers Slots
public int GetWeaponStickersSlotsByWeaponNum(int iWeaponNum)
{
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1;
    }

    char szDefIndex[12];
    int iDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.StickerSlotsCount;
}

public int GetWeaponStickersSlotsByDefIndex(int iDefIndex)
{
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.StickerSlotsCount;
}

public int GetWeaponStickersSlotsByWeapon(int iWeapon)
{
    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(iDefIndex <= 0)
    {
        return -1;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.StickerSlotsCount;
}

public bool SetWeaponAmmo(int iWeapon, int iReserveAmmo, int iClipAmmo)
{
    if (iReserveAmmo < 0 && iClipAmmo < 0)
    {
        return false;
    }

    if(iReserveAmmo > -1)
    {
        SetEntProp(iWeapon, Prop_Send, "m_iPrimaryReserveAmmoCount", iReserveAmmo);
    }

    if(iClipAmmo > -1)
    {
        SetEntProp(iWeapon, Prop_Send, "m_iClip1", iClipAmmo);
    }

    return true;
}

public bool RefillClipAmmo(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    int iClipAmmo = WeaponInfo.ClipAmmo;
    return SetWeaponAmmo(iWeapon, -1, iClipAmmo);
}

public bool RefillReserveAmmo(int iWeapon)
{
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));
    int iReserveAmmo = WeaponInfo.ReserveAmmo;
    return SetWeaponAmmo(iWeapon, iReserveAmmo, -1);
}

stock int GiveWeapon(int client, const char[] szClassName, int iReserveAmmo, int iClipAmmo, int iSwitchTo, bool bSwitchAnimation = true)
{

    if (!IsValidClient(client, true))
    {
        return -1;
    }

    int iTeam = GetClientTeam(client);

    if(iTeam != CS_TEAM_T && iTeam != CS_TEAM_CT)
    {
        return -1;
    }

    int iViewModel = GetEntPropEnt(client, Prop_Send, "m_hViewModel");
    int iViewSequence = -1;

    if (iViewModel > -1 && IsValidEntity(iViewModel))
    {
        iViewSequence = GetEntProp(iViewModel, Prop_Send, "m_nSequence");
    }
    if(!IsValidWeaponClassName(szClassName))
    {
        return -1;
    }


    int iWeaponTeam = GetWeaponTeamByClassName(szClassName);
    int iWeaponDefIndex = GetWeaponDefIndexByClassName(szClassName);
    int iLookingAtWeapon = GetEntProp(client, Prop_Send, "m_bIsLookingAtWeapon");
    int iHoldingLookAtWeapon = GetEntProp(client, Prop_Send, "m_bIsHoldingLookAtWeapon");
    int iReloadVisuallyComplete = -1;
    int iWeaponSilencer = -1;
    int iWeaponMode = -1;
    int iRecoilIndex = -1;
    int iIronSightMode = -1;
    int iZoomLevel = -1;
    int iCurrentSlot = GetWeaponSlotByClassName(szClassName);
    int iCurrentWeapon = GetPlayerWeaponSlot(client, iCurrentSlot);
    int iHudFlags = GetEntProp(client, Prop_Send, "m_iHideHUD");

    float fNextPlayerAttackTime = GetEntPropFloat(client, Prop_Send, "m_flNextAttack");
    float fDoneSwitchingSilencer = -1.0;
    float fNextPrimaryAttack = -1.0;
    float fNextSecondaryAttack = -1.0;
    float fTimeWeaponIdle = -1.0;
    float fAccuracyPenalty = -1.0;
    float fLastShotTime = -1.0;

    char szCurrentClassName[48];
    bool bKnife = IsDefIndexKnife(iWeaponDefIndex);
	
    if(IsValidWeapon(iCurrentWeapon))
    {
        GetWeaponClassNameByWeapon(iCurrentWeapon, szCurrentClassName, sizeof(szCurrentClassName));

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_flNextPrimaryAttack"))
        {
            fNextPrimaryAttack = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_flNextPrimaryAttack");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_flNextSecondaryAttack"))
        {
            fNextSecondaryAttack = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_flNextSecondaryAttack");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_flTimeWeaponIdle"))
        {
            fTimeWeaponIdle = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_flTimeWeaponIdle");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_fAccuracyPenalty"))
        {
            fAccuracyPenalty = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_fAccuracyPenalty");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_bReloadVisuallyComplete"))
        {
            iReloadVisuallyComplete = GetEntProp(iCurrentWeapon, Prop_Send, "m_bReloadVisuallyComplete");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_bSilencerOn"))
        {
            iWeaponSilencer = GetEntProp(iCurrentWeapon, Prop_Send, "m_bSilencerOn");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_weaponMode"))
        {
            iWeaponMode = GetEntProp(iCurrentWeapon, Prop_Send, "m_weaponMode");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_iRecoilIndex"))
        {
            iRecoilIndex = GetEntProp(iCurrentWeapon, Prop_Send, "m_iRecoilIndex");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_iIronSightMode"))
        {
            iIronSightMode = GetEntProp(iCurrentWeapon, Prop_Send, "m_iIronSightMode");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_flDoneSwitchingSilencer"))
        {
            fDoneSwitchingSilencer = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_flDoneSwitchingSilencer");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_fLastShotTime"))
        {
            fLastShotTime = GetEntPropFloat(iCurrentWeapon, Prop_Send, "m_fLastShotTime");
        }

        if(HasEntProp(iCurrentWeapon, Prop_Send, "m_zoomLevel"))
        {
            iZoomLevel = GetEntProp(iCurrentWeapon, Prop_Send, "m_zoomLevel");
        }

        if(bKnife)
        {
            if (!RemoveKnife(client))
            {
                ClientInfo[client].GivingWeapon = false;
                return -1;
                
            }
        }
        else if(!RemoveWeapon(client, iCurrentWeapon))
        {
            ClientInfo[client].GivingWeapon = false;
            return -1;
            
        }
    }
	
    if(iTeam != iWeaponTeam && iWeaponTeam > CS_TEAM_SPECTATOR)
    {
        SetEntProp(client, Prop_Send, "m_iTeamNum", iWeaponTeam);
    }

    ClientInfo[client].GivingWeapon = true;

    int iWeapon = -1;
    bool bGiven = false;

    if(!bGiven)
    {		
        iWeapon = GivePlayerItem(client, szClassName);
        bGiven = IsValidWeapon(iWeapon);
    }
    if(!IsValidWeapon(iWeapon) || !bGiven)
    {
        if(iWeaponTeam > CS_TEAM_SPECTATOR && GetClientTeam(client) != iTeam)
        {
            SetEntProp(client, Prop_Send, "m_iTeamNum", iTeam);
        }

        ClientInfo[client].GivingWeapon = false;

        if (iWeapon > 0 && IsValidEdict(iWeapon) && IsValidEntity(iWeapon))
        {
            AcceptEntityInput(iWeapon, "Kill");
        }
        return -1;
        
    }
	
    iWeaponDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(!bKnife)
    {
        SetWeaponAmmo(iWeapon, iReserveAmmo, iClipAmmo);
    }
    else
    {
        EquipPlayerWeapon(client, iWeapon);
    }
	
    int iSwitchWeapon = -1;
	
    if(iSwitchTo >= CS_SLOT_PRIMARY && iSwitchTo <= CS_SLOT_C4)
    {
        iSwitchWeapon = GetPlayerWeaponSlot(client, iSwitchTo);

        if(IsValidWeapon(iSwitchWeapon))
        {
            SetActiveWeapon(client, iSwitchWeapon);
        }
    }
	
    int iActiveWeapon = GetActiveWeapon(client);
	
    if(iActiveWeapon == iWeapon && bSwitchAnimation)
    {
        if(iSwitchWeapon == iWeapon)
        {
            if(StrEqual(szClassName, szCurrentClassName, false))
            {
                if(iLookingAtWeapon > -1 && HasEntProp(client, Prop_Send, "m_bIsLookingAtWeapon"))
                {
                    SetEntProp(client, Prop_Send, "m_bIsLookingAtWeapon", iLookingAtWeapon);
                }

                if(iHoldingLookAtWeapon > -1 && HasEntProp(client, Prop_Send, "m_bIsHoldingLookAtWeapon"))
                {
                    SetEntProp(client, Prop_Send, "m_bIsHoldingLookAtWeapon", iHoldingLookAtWeapon);
                }

                if(fNextPlayerAttackTime > -1.0 && HasEntProp(client, Prop_Send, "m_flNextAttack"))
                {
                    SetEntPropFloat(client, Prop_Send, "m_flNextAttack", fNextPlayerAttackTime);
                }

                if(fNextPrimaryAttack > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_flNextPrimaryAttack"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_flNextPrimaryAttack", fNextPrimaryAttack);
                }

                if(fNextSecondaryAttack > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_flNextSecondaryAttack"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_flNextSecondaryAttack", fNextSecondaryAttack);
                }

                if(fTimeWeaponIdle > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_flTimeWeaponIdle"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_flTimeWeaponIdle", fTimeWeaponIdle);
                }

                if(fAccuracyPenalty > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_fAccuracyPenalty"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_fAccuracyPenalty", fAccuracyPenalty);
                }

                if(fDoneSwitchingSilencer > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_flDoneSwitchingSilencer"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_flDoneSwitchingSilencer", fDoneSwitchingSilencer);
                }

                if(fLastShotTime > -1.0 && HasEntProp(iCurrentWeapon, Prop_Send, "m_fLastShotTime"))
                {
                    SetEntPropFloat(iWeapon, Prop_Send, "m_fLastShotTime", fLastShotTime);
                }

                if(iReloadVisuallyComplete > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_bReloadVisuallyComplete"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_bReloadVisuallyComplete", iReloadVisuallyComplete);
                }

                if(iWeaponSilencer > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_bSilencerOn"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_bSilencerOn", iWeaponSilencer);
                }

                if(iWeaponMode > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_weaponMode"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_weaponMode", iWeaponMode);
                }

                if(iRecoilIndex > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_iRecoilIndex"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_iRecoilIndex", iRecoilIndex);
                }

                if(iIronSightMode > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_iIronSightMode"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_iIronSightMode", iIronSightMode);
                }

                if(iZoomLevel > -1 && HasEntProp(iCurrentWeapon, Prop_Send, "m_zoomLevel"))
                {
                    SetEntProp(iWeapon, Prop_Send, "m_zoomLevel", iZoomLevel);
                }
            }

            if(bKnife)
            {
                switch(iWeaponDefIndex)
                {
                    case 515 : iViewSequence = SEQUENCE_BUTTERFLY_IDLE1;   // Butterfly
                    case 512 : iViewSequence = SEQUENCE_FALCHION_IDLE1;    // Falchion
                    case 516: iViewSequence = SEQUENCE_DAGGERS_IDLE1;   // Butt Plugs
                    case 514: iViewSequence = SEQUENCE_BOWIE_IDLE1;   // Bowie
                    default: iViewSequence = SEQUENCE_DEFAULT_IDLE2;
                }
            }
            else if(StrEqual(szClassName, "weapon_m4a1_silencer", false))
            {
                iViewSequence = 1;
            }
            else
            {
                iViewSequence = 0;
            }
        }
    }
	
    if(!IsValidEntity(iViewModel))
    {
        iViewModel = GetEntPropEnt(client, Prop_Send, "m_hViewModel");
    }

    if(IsValidEntity(iViewModel) && iViewSequence > -1 && bSwitchAnimation)
    {
        SetEntProp(iViewModel, Prop_Send, "m_nSequence", iViewSequence);
    }

    SetEntProp(client, Prop_Send, "m_iHideHUD", iHudFlags);

    if(iWeaponTeam > 1 && GetClientTeam(client) != iTeam)
    {
        SetEntProp(client, Prop_Send, "m_iTeamNum", iTeam);
    }
	
    ClientInfo[client].GivingWeapon = false;
	
    Call_StartForward(g_OnWeaponGiven);
    Call_PushCell(client);
    Call_PushCell(iWeapon);
    Call_PushString(szClassName);
    Call_PushCell(iWeaponDefIndex);
    Call_PushCell(GetWeaponSlotByDefIndex(iWeaponDefIndex));
    Call_PushCell(IsSkinnableDefIndex(iWeaponDefIndex));
    Call_PushCell(bKnife);
    Call_Finish();

    return iWeapon;
}

public bool RemoveKnife(int client)
{
    if(!IsValidClient(client, true))
    {
        return false;
    }

    int iWeapon = -1;
    int iDefIndex = -1;

    for(int i = 0; i < GetEntPropArraySize(client, Prop_Send, "m_hMyWeapons"); i++)
    {
    iWeapon = GetEntPropEnt(client, Prop_Send, "m_hMyWeapons", i);

    if(!IsValidWeapon(iWeapon))
    {
        continue;
    }

    iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(!IsDefIndexKnife(iDefIndex))
    {
        continue;
    }

    return RemoveWeapon(client, iWeapon);
    }

    return false;
}

public bool RemoveWeapon(int client, int iWeapon)
{
    if(!IsValidClient(client, true))
    {
        return false;
    }

    if(g_bIsRoundEnd)
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    int iWeaponSlot = GetWeaponSlotByDefIndex(iDefIndex);

    if(iWeaponSlot < CS_SLOT_PRIMARY)
    {
        return false;
    }

    if(GetPlayerWeaponSlot(client, iWeaponSlot) != iWeapon)
    {
        return false;
    }

    if(!RemovePlayerItem(client, iWeapon))
    {
        if(!DropWeapon(client, iWeapon))
        {
            return false;
        }
    }

    AcceptEntityInput(iWeapon, "Kill");
    return true;
}

public bool DropWeapon(int client, int iWeapon)
{
    if(!IsValidClient(client, true))
    {
        return false;
    }

    if(g_bIsRoundEnd)
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    int iWeaponSlot = GetWeaponSlotByDefIndex(iDefIndex);

    if(iWeaponSlot < CS_SLOT_PRIMARY)
    {
        return false;
    }

    if(GetPlayerWeaponSlot(client, iWeaponSlot) != iWeapon)
    {
        return false;
    }

    int iHudFlags = GetEntProp(client, Prop_Send, "m_iHideHUD");
    int iOwnerEntity = GetEntPropEnt(iWeapon, Prop_Send, "m_hOwnerEntity");

    if(iOwnerEntity != client)
    {
        SetEntPropEnt(iWeapon, Prop_Send, "m_hOwnerEntity", client);
    }

    if(iWeapon == GetActiveWeapon(client))
    {
        SetEntPropEnt(client, Prop_Send, "m_hActiveWeapon", -1);
    }

    CS_DropWeapon(client, iWeapon, false, true);

    if(iOwnerEntity != client)
    {
        SetEntPropEnt(iWeapon, Prop_Send, "m_hOwnerEntity", iOwnerEntity);
    }

    SetEntProp(client, Prop_Send, "m_iHideHUD", iHudFlags);

    return true;
}

public bool SetActiveWeapon(int client, int iWeapon)
{
    if(!IsValidClient(client, true))
    {
        return false;
    }

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    int iWeaponSlot = GetWeaponSlotByDefIndex(iDefIndex);

    if(iWeaponSlot <CS_SLOT_PRIMARY)
    {
        return false;
    }

    if(GetPlayerWeaponSlot(client, iWeaponSlot) != iWeapon)
    {
        return false;
    }

    int iHudFlags = GetEntProp(client, Prop_Send, "m_iHideHUD");

    char szClassName[48];
    GetWeaponClassNameByWeapon(iWeapon, szClassName, sizeof(szClassName));
    FakeClientCommandEx(client, "use %s", szClassName);

    SDKCall(g_hSwitchWeaponCall, client, iWeapon, 0);
    SetEntPropEnt(client, Prop_Send, "m_hActiveWeapon", iWeapon);
    SetEntProp(client, Prop_Send, "m_iHideHUD", iHudFlags);

    return true;
}

stock int RespawnWeapon(int client, int iWeapon, bool bSwitchAnimation = true)
{
    if(!IsValidClient(client, true))
    {
        return -1;
    }
    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    int iWeaponSlot = GetWeaponSlotByDefIndex(iDefIndex);

    if (iWeaponSlot < CS_SLOT_PRIMARY)
    {
        return -1;
    }

    if(iWeapon != GetPlayerWeaponSlot(client, iWeaponSlot))
    {
        return -1;
    }
    char szClassName[48];

    if(!GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return -1;
    }

    int iReserveAmmo = -1;
    int iClipAmmo = -1;

    if(HasEntProp(iWeapon, Prop_Send, "m_iPrimaryReserveAmmoCount"))
    {
        iReserveAmmo = GetEntProp(iWeapon, Prop_Send, "m_iPrimaryReserveAmmoCount");
    }

    if(HasEntProp(iWeapon, Prop_Send, "m_iClip1"))
    {
        iClipAmmo = GetEntProp(iWeapon, Prop_Send, "m_iClip1");
    }

    return GiveWeapon(client, szClassName, iReserveAmmo, iClipAmmo, GetActiveWeaponSlot(client), bSwitchAnimation);
}

public int GetActiveWeaponSlot(int client)
{
    if(!IsValidClient(client, true))
    {
        return -1;
    }

    for(int iSlot = CS_SLOT_PRIMARY; iSlot <= CS_SLOT_C4; iSlot++)
    {
        if(GetPlayerWeaponSlot(client, iSlot) == GetActiveWeapon(client))
        {
            return iSlot;
        }
    }   
    return -1;
}

public int RemoveAllWeapons(int client, int iSkipSlot)
{
    if(g_bIsRoundEnd)
    {
        return -1;
    }

    if(!IsValidClient(client, true))
    {
        return -1;
    }

    int iRemovedWeapons = 0;
    int iWeaponSlot = -1;
    int iWeapon = -1;

    int iMyWeapons = GetEntPropArraySize(client, Prop_Send, "m_hMyWeapons");
    for(int i = 0; i < iMyWeapons; i++)
    {
        iWeapon = GetEntPropEnt(client, Prop_Send, "m_hMyWeapons", i);

        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        iWeaponSlot = GetWeaponSlotByWeapon(iWeapon);

        if (iWeaponSlot < CS_SLOT_PRIMARY)
        {
            continue;
        }

        if(iWeaponSlot == iSkipSlot && iSkipSlot > -1)
        {
            continue;
        }

        if(RemoveWeapon(client, iWeapon))
        {
            iRemovedWeapons++;
        }
    }

    return iRemovedWeapons;
}

public bool SetAllWeaponsAmmo(const int iReserveAmmo, const int iClipAmmo)
{
    for(int iWeapon = MaxClients; iWeapon < 2048; iWeapon++)
    {
        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

        if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
        {
            continue;
        }

        if(IsDefIndexKnife(iDefIndex))
        {
            continue;
        }

        if(!SetWeaponAmmo(iWeapon, iReserveAmmo, iClipAmmo))
        {
            continue;
        }
    }
    return true;
}

public bool SetAllWeaponsAmmoByClassName(const char[] szClassName, const int iReserveAmmo, const int iClipAmmo)
{
    char szWeaponClassName[48];
    for(int iWeapon = MaxClients; iWeapon < 2048; iWeapon++)
    {
        if(!IsValidWeapon(iWeapon))
        {
            continue;
        }

        int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

        if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
        {
            continue;
        }

        if(IsDefIndexKnife(iDefIndex))
        {
            continue;
        }

        if(!GetWeaponClassNameByDefIndex(iDefIndex, szWeaponClassName, sizeof(szWeaponClassName)))
        {
            continue;
        }

        if(strcmp(szWeaponClassName, szClassName) != 0)
        {
            continue;
        }

        if(!SetWeaponAmmo(iWeapon, iReserveAmmo, iClipAmmo))
        {
            continue;
        }
    }
    return true;
}

public bool HasRareInspectByDefIndex(int iWeaponDefIndex)
{
    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iWeaponDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.HasRareInspect;
}

public bool HasRareDrawByDefIndex(int iWeaponDefIndex)
{
    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iWeaponDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.HasRareDraw;
}

public int GetRareInspectSequenceByDefIndex(int iWeaponDefIndex)
{
    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iWeaponDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.RareInspect;
}

public int GetRareDrawSequenceByDefIndex(int iWeaponDefIndex)
{
    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iWeaponDefIndex, szDefIndex, sizeof(szDefIndex));

    eWeaponInfo WeaponInfo;
    g_smWeaponInfo.GetArray(szDefIndex, WeaponInfo, sizeof(eWeaponInfo));

    return WeaponInfo.RareDraw;
}
    /*      Skins       */

public bool IsSkinNumGloveApplicable(int iSkinNum)
{
    char szDefIndex[12];
    int iDefIndex = g_arSkinsNum.Get(iSkinNum);

    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));
    return SkinInfo.GloveApplicable;
}

public int GetSkinNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arSkinsNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetSkinDefIndexBySkinNum(int iSkinNum)
{
    if(g_arSkinsNum.Length < iSkinNum)
    {
        return -1;
    }

    return g_arSkinsNum.Get(iSkinNum);
}

public bool GetSkinDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));

    strcopy(szDisplayName, iLen, SkinInfo.DisplayName);
    return true;
}

public bool GetSkinDisplayNameBySkinNum(int iSkinNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetSkinDefIndexBySkinNum(iSkinNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(SkinInfo));

    strcopy(szDisplayName, iLen, SkinInfo.DisplayName);
    return true;
}

public bool IsNativeSkin(int iSkinNum, int iItemNum, int iItemType)
{
    int iSkinDefIndex = GetSkinDefIndexBySkinNum(iSkinNum);
    char szDefIndex[12];
    switch(iItemType)
    {
        case ITEMTYPE_WEAPON:
        {
            int iDefIndex = eItems_GetWeaponDefIndexByWeaponNum(iItemNum);
            IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

            ArrayList arWeaponPaints = null;
            g_smWeaponPaints.GetValue(szDefIndex, arWeaponPaints);
            if(arWeaponPaints == null)
            {
                return false;
            }
            return arWeaponPaints.FindValue(iSkinDefIndex) != -1;
        }
        case ITEMTYPE_GLOVES:
        {
            int iDefIndex = eItems_GetGlovesDefIndexByGlovesNum(iItemNum);
            IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

            ArrayList arGlovePaints = null;
            g_smGlovePaints.GetValue(szDefIndex, arGlovePaints);
            if(arGlovePaints == null)
            {
                return false;
            }
            return arGlovePaints.FindValue(iSkinDefIndex) != -1;
        }
    }
    return false;
}

public bool IsNativeSkinByDefIndex(int iSkinDefIndex, int iItemDefIndex, int iItemType)
{
    char szDefIndex[12];
    switch(iItemType)
    {
        case ITEMTYPE_WEAPON:
        {
            IntToString(iItemDefIndex, szDefIndex, sizeof(szDefIndex));

            ArrayList arWeaponPaints = null;
            g_smWeaponPaints.GetValue(szDefIndex, arWeaponPaints);
            if(arWeaponPaints == null)
            {
                return false;
            }
            return arWeaponPaints.FindValue(iSkinDefIndex) != -1;
        }
        case ITEMTYPE_GLOVES:
        {
            IntToString(iItemDefIndex, szDefIndex, sizeof(szDefIndex));

            ArrayList arGlovePaints = null;
            g_smGlovePaints.GetValue(szDefIndex, arGlovePaints);
            if(arGlovePaints == null)
            {
                return false;
            }
            return arGlovePaints.FindValue(iSkinDefIndex) != -1;
        }
    }
    return false;
}

public int GetSkinRarity(int iDefIndex)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));

    return SkinInfo.SkinRarity;
}

public bool GetSkinRarityName(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));

    strcopy(szDisplayName, iLen, SkinInfo.RarityName);
    return true;
}

public float GetSkinWearRemapByDefIndex(int iDefIndex, WearRemap remap)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));

    float fRevmap = remap == Min ? SkinInfo.WearRemap.Min : SkinInfo.WearRemap.Max;
    return fRevmap;
}

public float GetSkinWearRemapBySkinNum(int iSkinNum, WearRemap remap)
{
    int iDefIndex = GetSkinDefIndexBySkinNum(iSkinNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSkinInfo SkinInfo;
    g_smSkinInfo.GetArray(szDefIndex, SkinInfo, sizeof(eSkinInfo));

    float fRevmap = remap == Min ? SkinInfo.WearRemap.Min : SkinInfo.WearRemap.Max;
    return fRevmap;
}

    /*      Gloves      */

public int GetGlovesNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arGlovesNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetGlovesDefIndexByGlovesNum(int iGloveNum)
{
    if(g_arGlovesNum.Length < iGloveNum)
    {
        return -1;
    }

    return g_arGlovesNum.Get(iGloveNum);
}

public bool GetGlovesDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GloveInfo;
    g_smGloveInfo.GetArray(szDefIndex, GloveInfo, sizeof(eGlovesInfo));

    strcopy(szDisplayName, iLen, GloveInfo.DisplayName);
    return true;
}

public bool GetGlovesDisplayNameByGlovesNum(int iGloveNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetGlovesDefIndexByGlovesNum(iGloveNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GloveInfo;
    g_smGloveInfo.GetArray(szDefIndex, GloveInfo, sizeof(eGlovesInfo));

    strcopy(szDisplayName, iLen, GloveInfo.DisplayName);
    return true;
}

public bool GetGlovesViewModelByGlovesNum(int iGloveNum, char[] szWorldModel, int iLen)
{
    if(g_iGlovesCount < iGloveNum)
    {
        return false;
    }

    int iDefIndex = GetGlovesDefIndexByGlovesNum(iGloveNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GlovesInfo;
    g_smGloveInfo.GetArray(szDefIndex, GlovesInfo, sizeof(eGlovesInfo));

    strcopy(szWorldModel, iLen, GlovesInfo.ViewModel);
    return true;
}

public bool GetGlovesViewModelByDefIndex(int iDefIndex, char[] szWorldModel, int iLen)
{
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GlovesInfo;
    g_smGloveInfo.GetArray(szDefIndex, GlovesInfo, sizeof(eGlovesInfo));

    strcopy(szWorldModel, iLen, GlovesInfo.ViewModel);
    return true;
}

public bool GetGlovesWorldModelByGlovesNum(int iGloveNum, char[] szWorldModel, int iLen)
{
    if(g_iGlovesCount < iGloveNum)
    {
        return false;
    }

    int iDefIndex = GetGlovesDefIndexByGlovesNum(iGloveNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GlovesInfo;
    g_smGloveInfo.GetArray(szDefIndex, GlovesInfo, sizeof(eGlovesInfo));

    strcopy(szWorldModel, iLen, GlovesInfo.WorldModel);
    return true;
}

public bool GetGlovesWorldModelByDefIndex(int iDefIndex, char[] szWorldModel, int iLen)
{
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eGlovesInfo GlovesInfo;
    g_smGloveInfo.GetArray(szDefIndex, GlovesInfo, sizeof(eGlovesInfo));

    strcopy(szWorldModel, iLen, GlovesInfo.WorldModel);
    return true;
}

public int GetGlovesNumBySkinNum(int iSkinNum)
{
    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    int iSkinDefIndex = GetSkinDefIndexBySkinNum(iSkinNum);

    char szDefIndex[12];
    for(int iGloveNum = 0; iGloveNum < g_arGlovesNum.Length; iGloveNum++)
    {
        int iDefIndex = g_arGlovesNum.Get(iGloveNum);

        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));
        ArrayList arGlovePaints = null;
        g_smGlovePaints.GetValue(szDefIndex, arGlovePaints);

        if(arGlovePaints == null)
        {
            continue;
        }

        if(arGlovePaints.FindValue(iSkinDefIndex) == -1)
        {
            continue;
        }

        return iGloveNum;
    }
    return -1;
}
    /*      Music Kits      */

public int GetMusicKitNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arMusicKitsNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetMusicKitDefIndexByMusicKitNum(int iMusicKitNum)
{
    if(g_arMusicKitsNum.Length < iMusicKitNum)
    {
        return -1;
    }

    return g_arMusicKitsNum.Get(iMusicKitNum);
}

public bool GetMusicKitDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eMusicKitsInfo MusicKitsInfo;
    g_smMusicKitInfo.GetArray(szDefIndex, MusicKitsInfo, sizeof(eMusicKitsInfo));

    strcopy(szDisplayName, iLen, MusicKitsInfo.DisplayName);
    return true;
}

public bool GetMusicKitDisplayNameByMusicKitNum(int iMusicKitNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetMusicKitDefIndexByMusicKitNum(iMusicKitNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eMusicKitsInfo MusicKitsInfo;
    g_smMusicKitInfo.GetArray(szDefIndex, MusicKitsInfo, sizeof(eMusicKitsInfo));

    strcopy(szDisplayName, iLen, MusicKitsInfo.DisplayName);
    return true;
}

    /*      Pins      */

public int GetPinNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arPinsNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetPinDefIndexByPinNum(int iPinNum)
{
    if(g_arPinsNum.Length < iPinNum)
    {
        return -1;
    }

    return g_arPinsNum.Get(iPinNum);
}

public bool GetPinDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    ePinInfo PinInfo;
    g_smPinInfo.GetArray(szDefIndex, PinInfo, sizeof(ePinInfo));

    strcopy(szDisplayName, iLen, PinInfo.DisplayName);
    return true;
}

public bool GetPinDisplayNameByPinNum(int iPinNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetPinDefIndexByPinNum(iPinNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    ePinInfo PinInfo;
    g_smPinInfo.GetArray(szDefIndex, PinInfo, sizeof(ePinInfo));

    strcopy(szDisplayName, iLen, PinInfo.DisplayName);
    return true;
}

    /*      Coins      */

public int GetCoinSetIdByCoinSetNum(int iCoinSetNum)
{
    if(g_arCoinsSetsNum.Length < iCoinSetNum)
    {
        return -1;
    }

    return g_arCoinsSetsNum.Get(iCoinSetNum);
}

public int GetCoinSetNumByCoinSetId(int iCoinSetId)
{
    int iIndex = g_arCoinsSetsNum.FindValue(iCoinSetId);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public bool GetCoinSetDisplayNameByCoinSetNum(int iCoinSetNum, char[] szDisplayName, int iLen)
{
    int iCoinSetId = GetCoinSetIdByCoinSetNum(iCoinSetNum);

    char szCoinSetId[12];
    IntToString(iCoinSetId, szCoinSetId, sizeof(szCoinSetId));

    eCoinsSets CoinsSets;
    g_smCoinsSets.GetArray(szCoinSetId, CoinsSets, sizeof(eCoinsSets));

    strcopy(szDisplayName, iLen, CoinsSets.DisplayName);
    return true;
}

public bool GetCoinSetDisplayNameByCoinSetId(int iCoinSetId, char[] szDisplayName, int iLen)
{
    char szCoinSetId[12];
    IntToString(iCoinSetId, szCoinSetId, sizeof(szCoinSetId));

    eCoinsSets CoinsSets;
    g_smCoinsSets.GetArray(szCoinSetId, CoinsSets, sizeof(eCoinsSets));

    strcopy(szDisplayName, iLen, CoinsSets.DisplayName);
    return true;
}

public int GetCoinDefIndexByCoinNum(int iCoinNum)
{
    if(g_arCoinsNum.Length < iCoinNum)
    {
        return -1;
    }

    return g_arCoinsNum.Get(iCoinNum);
}

public int GetCoinNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arCoinsNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public bool GetCoinDisplayNameByCoinNum(int iCoinNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetCoinDefIndexByCoinNum(iCoinNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCoinInfo CoinInfo;
    g_smCoinsInfo.GetArray(szDefIndex, CoinInfo, sizeof(eCoinInfo));

    strcopy(szDisplayName, iLen, CoinInfo.DisplayName);
    return true;
}

public bool GetCoinDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCoinInfo CoinInfo;
    g_smCoinsInfo.GetArray(szDefIndex, CoinInfo, sizeof(eCoinInfo));

    strcopy(szDisplayName, iLen, CoinInfo.DisplayName);
    return true;
}

public bool IsCoinInSet(int iCoinNum, int iCoinSetId)
{
    int iCoinDefIndex = GetCoinDefIndexByCoinNum(iCoinNum);

    char szCoinSetId[12];
    IntToString(iCoinSetId, szCoinSetId, sizeof(szCoinSetId));
    
    eCoinsSets CoinsSets;
    g_smCoinsSets.GetArray(szCoinSetId, CoinsSets, sizeof(eCoinsSets));

    ArrayList arCoins = CoinsSets.Coins;
    return arCoins.FindValue(iCoinDefIndex) != -1;
}

    /*      Stickers      */

public int GetStickerSetIdByStickerSetNum(int iStickerSetNum)
{
    if(g_arStickersSetsNum.Length < iStickerSetNum)
    {
        return -1;
    }

    return g_arStickersSetsNum.Get(iStickerSetNum);
}

public int GetStickerSetNumByStickerSetId(int iStickerSetId)
{
    int iIndex = g_arStickersSetsNum.FindValue(iStickerSetId);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public bool GetStickerSetDisplayNameByStickerSetNum(int iStickerSetNum, char[] szDisplayName, int iLen)
{
    int iStickerSetId = GetStickerSetIdByStickerSetNum(iStickerSetNum);

    char szStickerSetId[12];
    IntToString(iStickerSetId, szStickerSetId, sizeof(szStickerSetId));

    eStickersSets StickersSets;
    g_smStickersSets.GetArray(szStickerSetId, StickersSets, sizeof(eStickersSets));

    strcopy(szDisplayName, iLen, StickersSets.DisplayName);
    return true;
}

public bool GetStickerSetDisplayNameByStickerSetId(int iStickerSetId, char[] szDisplayName, int iLen)
{
    char szStickerSetId[12];
    IntToString(iStickerSetId, szStickerSetId, sizeof(szStickerSetId));

    eStickersSets StickersSets;
    g_smStickersSets.GetArray(szStickerSetId, StickersSets, sizeof(eStickersSets));

    strcopy(szDisplayName, iLen, StickersSets.DisplayName);
    return true;
}

public int GetStickerDefIndexByStickerNum(int iStickerNum)
{
    if(g_arStickersNum.Length < iStickerNum)
    {
        return -1;
    }

    return g_arStickersNum.Get(iStickerNum);
}

public int GetStickerNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arStickersNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public bool GetStickerDisplayNameByStickerNum(int iStickerNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetStickerDefIndexByStickerNum(iStickerNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eStickerInfo StickerInfo;
    g_smStickersInfo.GetArray(szDefIndex, StickerInfo, sizeof(eStickerInfo));

    strcopy(szDisplayName, iLen, StickerInfo.DisplayName);
    return true;
}

public bool GetStickerDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eStickerInfo StickerInfo;
    g_smStickersInfo.GetArray(szDefIndex, StickerInfo, sizeof(eStickerInfo));

    strcopy(szDisplayName, iLen, StickerInfo.DisplayName);
    return true;
}

public bool IsStickerInSet(int iStickerSetNum, int iStickerNum)
{
    if(iStickerSetNum < 0 || iStickerSetNum > g_iStickersSetsCount)
    {
        return false;
    }

    if(iStickerNum < 0 || iStickerNum > g_iStickersCount)
    {
        return false;
    }

    return g_bIsStickerInSet[iStickerSetNum][iStickerNum];
}

    /*      Agents      */



public int GetAgentNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arAgentsNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetAgentDefIndexByAgentNum(int iAgentNum)
{
    if(g_arAgentsNum.Length < iAgentNum)
    {
        return -1;
    }

    return g_arAgentsNum.Get(iAgentNum);
}

public bool GetAgentDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szDisplayName, iLen, AgentInfo.DisplayName);
    return true;
}

public bool GetAgentDisplayNameByAgentNum(int iAgentNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetAgentDefIndexByAgentNum(iAgentNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szDisplayName, iLen, AgentInfo.DisplayName);
    return true;
}

public bool GetAgentPlayerModelByDefIndex(int iDefIndex, char[] szPlayerModel, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szPlayerModel, iLen, AgentInfo.PlayerModel);
    return true;
}

public bool GetAgentPlayerModelByAgentNum(int iAgentNum, char[] szPlayerModel, int iLen)
{
    int iDefIndex = GetAgentDefIndexByAgentNum(iAgentNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szPlayerModel, iLen, AgentInfo.PlayerModel);
    return true;
}


public int GetAgentTeamByDefIndex(int iDefIndex)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    return AgentInfo.Team;
}

public int GetAgentTeamByAgentNum(int iAgentNum)
{
    int iDefIndex = GetAgentDefIndexByAgentNum(iAgentNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    return AgentInfo.Team;
}

public bool GetAgentVOPrefixByDefIndex(int iDefIndex, char[] szVOPrefix, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szVOPrefix, iLen, AgentInfo.VOPrefix);
    return true;
}

public bool GetAgentVOPrefixByAgentNum(int iAgentNum, char[] szVOPrefix, int iLen)
{
    int iDefIndex = GetAgentDefIndexByAgentNum(iAgentNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eAgentInfo AgentInfo;
    g_smAgentsInfo.GetArray(szDefIndex, AgentInfo, sizeof(eAgentInfo));

    strcopy(szVOPrefix, iLen, AgentInfo.VOPrefix);
    return true;
}

    /*      Patches      */

public int GetPatchNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arPatchesNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetPatchDefIndexByPatchNum(int iPatchNum)
{
    if(g_arPatchesNum.Length < iPatchNum)
    {
        return -1;
    }

    return g_arPatchesNum.Get(iPatchNum);
}

public bool GetPatchDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    ePatchInfo PatchInfo;
    g_smPatchesInfo.GetArray(szDefIndex, PatchInfo, sizeof(ePatchInfo));

    strcopy(szDisplayName, iLen, PatchInfo.DisplayName);
    return true;
}

public bool GetPatchDisplayNameByPatchNum(int iPatchNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetPatchDefIndexByPatchNum(iPatchNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    ePatchInfo PatchInfo;
    g_smPatchesInfo.GetArray(szDefIndex, PatchInfo, sizeof(ePatchInfo));

    strcopy(szDisplayName, iLen, PatchInfo.DisplayName);
    return true;
}

    /*      Crates      */

public int GetCrateNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arCratesNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetCrateDefIndexByCrateNum(int iCrateNum)
{
    if(g_arCratesNum.Length < iCrateNum)
    {
        return -1;
    }

    return g_arCratesNum.Get(iCrateNum);
}

public bool GetCrateDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    strcopy(szDisplayName, iLen, CrateInfo.DisplayName);
    return true;
}

public bool GetCrateDisplayNameByCrateNum(int iCrateNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetCrateDefIndexByCrateNum(iCrateNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    strcopy(szDisplayName, iLen, CrateInfo.DisplayName);
    return true;
}

public bool GetCrateWorldModelByDefIndex(int iDefIndex, char[] szWorldModel, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    strcopy(szWorldModel, iLen, CrateInfo.WorldModel);
    return true;
}

public bool GetCrateWorldModelByCrateNum(int iCrateNum, char[] szWorldModel, int iLen)
{
    int iDefIndex = GetCrateDefIndexByCrateNum(iCrateNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    strcopy(szWorldModel, iLen, CrateInfo.WorldModel);
    return true;
}

public int GetCrateItemsCountByDefIndex(int iDefIndex)
{
    int iIndex = g_arCratesNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    return CrateInfo.ItemsCount;
}

public int GetCrateItemsCountByCrateNum(int iCrateNum)
{
    if(g_arCratesNum.Length < iCrateNum)
    {
        return -1;
    }

    int iDefIndex = GetCrateDefIndexByCrateNum(iCrateNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    return CrateInfo.ItemsCount;
}

public bool GetCrateItemByDefIndex(int iDefIndex, int iCrateItemNum, any[] iCrateItem, int iLength)
{
    int iIndex = g_arCratesNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return false;
    }

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    return view_as<bool>(CrateInfo.Items.GetArray(iCrateItemNum, iCrateItem, iLength));
}

public bool GetCrateItemByCrateNum(int iCrateNum, int iCrateItemNum, any[] iCrateItem, int iLength)
{
    if(g_arCratesNum.Length < iCrateNum)
    {
        return false;
    }

    int iDefIndex = GetCrateDefIndexByCrateNum(iCrateNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eCrateInfo CrateInfo;
    g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

    return view_as<bool>(CrateInfo.Items.GetArray(iCrateItemNum, iCrateItem, iLength));
}

    /*      Sprays      */

public int GetSpraySetIdBySpraySetNum(int iSpraySetNum)
{
    if(g_arSpraysSetsNum.Length < iSpraySetNum)
    {
        return -1;
    }

    return g_arSpraysSetsNum.Get(iSpraySetNum);
}

public int GetSpraySetNumBySpraySetId(int iSpraySetId)
{
    int iIndex = g_arSpraysSetsNum.FindValue(iSpraySetId);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public bool GetSpraySetDisplayNameBySpraySetNum(int iSpraySetNum, char[] szDisplayName, int iLen)
{
    int iSpraySetId = GetSpraySetIdBySpraySetNum(iSpraySetNum);

    char szSpraySetId[12];
    IntToString(iSpraySetId, szSpraySetId, sizeof(szSpraySetId));

    eSpraysSets SpraysSets;
    g_smSpraysSets.GetArray(szSpraySetId, SpraysSets, sizeof(eSpraysSets));

    strcopy(szDisplayName, iLen, SpraysSets.DisplayName);
    return true;
}

public bool GetSpraySetDisplayNameBySpraySetId(int iSpraySetId, char[] szDisplayName, int iLen)
{
    char szSpraySetId[12];
    IntToString(iSpraySetId, szSpraySetId, sizeof(szSpraySetId));

    eSpraysSets SpraysSets;
    g_smSpraysSets.GetArray(szSpraySetId, SpraysSets, sizeof(eSpraysSets));

    strcopy(szDisplayName, iLen, SpraysSets.DisplayName);
    return true;
}

public int GetSprayNumByDefIndex(int iDefIndex)
{
    int iIndex = g_arSpraysNum.FindValue(iDefIndex);
    if(iIndex == -1)
    {
        return -1;
    }

    return iIndex;
}

public int GetSprayDefIndexBySprayNum(int iSprayNum)
{
    if(g_arSpraysNum.Length < iSprayNum)
    {
        return -1;
    }

    return g_arSpraysNum.Get(iSprayNum);
}

public bool GetSprayDisplayNameByDefIndex(int iDefIndex, char[] szDisplayName, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSprayInfo SprayInfo;
    g_smSpraysInfo.GetArray(szDefIndex, SprayInfo, sizeof(eSprayInfo));

    strcopy(szDisplayName, iLen, SprayInfo.DisplayName);
    return true;
}

public bool GetSprayDisplayNameBySprayNum(int iSprayNum, char[] szDisplayName, int iLen)
{
    int iDefIndex = GetSprayDefIndexBySprayNum(iSprayNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSprayInfo SprayInfo;
    g_smSpraysInfo.GetArray(szDefIndex, SprayInfo, sizeof(eSprayInfo));

    strcopy(szDisplayName, iLen, SprayInfo.DisplayName);
    return true;
}

public bool GetSprayMaterialPathByDefIndex(int iDefIndex, char[] szMaterialPath, int iLen)
{
    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSprayInfo SprayInfo;
    g_smSpraysInfo.GetArray(szDefIndex, SprayInfo, sizeof(eSprayInfo));

    strcopy(szMaterialPath, iLen, SprayInfo.MaterialPath);
    return true;
}

public bool GetSprayMaterialPathBySprayNum(int iSprayNum, char[] szMaterialPath, int iLen)
{
    int iDefIndex = GetSprayDefIndexBySprayNum(iSprayNum);

    char szDefIndex[12];
    IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

    eSprayInfo SprayInfo;
    g_smSpraysInfo.GetArray(szDefIndex, SprayInfo, sizeof(eSprayInfo));

    strcopy(szMaterialPath, iLen, SprayInfo.MaterialPath);
    return true;
}

public bool IsSprayInSet(int iSpraySetNum, int iSprayNum)
{
    if(iSpraySetNum < 0 || iSpraySetNum > g_iSpraysSetsCount)
    {
        return false;
    }

    if(iSprayNum < 0 || iSprayNum > g_iSpraysCount)
    {
        return false;
    }

    return g_bIsSprayInSet[iSpraySetNum][iSprayNum];
}

public bool GetSkinsDefIndexArrByWeaponNum(int iWeaponNum, any &arSkinsDefIndex){
    //convert to def index
    int iWeaponDefIndex = GetWeaponDefIndexByWeaponNum(iWeaponNum);

    //call GetSkinsDefIndexArrByWeaponDefIndex
    return GetSkinsDefIndexArrByWeaponDefIndex(iWeaponDefIndex, arSkinsDefIndex);
}

public bool GetSkinsDefIndexArrByWeaponDefIndex(int iWeaponDefIndex, any &arSkinsDefIndex){
    //convert iWeaponDefIndex to string and use it as key on g_smWeaponPaints
    char szWeaponDefIndex[12];
    IntToString(iWeaponDefIndex, szWeaponDefIndex, sizeof(szWeaponDefIndex));

    return g_smWeaponPaints.GetValue(szWeaponDefIndex, arSkinsDefIndex);  //it gets the array of skins def index
}

public bool GetSkinsDefIndexArrByWeaponClassName(char[] szClassName, any &arSkinsDefIndex){
    //convert to def index
    int iWeaponDefIndex = GetWeaponDefIndexByClassName(szClassName);

    //call GetSkinsDefIndexArrByWeaponDefIndex
    return GetSkinsDefIndexArrByWeaponDefIndex(iWeaponDefIndex, arSkinsDefIndex);
}

public bool GetSkinsDefIndexArrByGloveNum(int iGloveNum, any &arSkinsDefIndex){
    //convert to def index
    int iGloveDefIndex = GetGlovesDefIndexByGlovesNum(iGloveNum);

    //call GetSkinsDefIndexArrByGloveDefIndex
    return GetSkinsDefIndexArrByGloveDefIndex(iGloveDefIndex, arSkinsDefIndex);
}

public bool GetSkinsDefIndexArrByGloveDefIndex(int iGloveDefIndex, any &arSkinsDefIndex){
    //convert iGloveDefIndex to string and use it as key on g_smGlovePaints
    char szGloveDefIndex[12];
    IntToString(iGloveDefIndex, szGloveDefIndex, sizeof(szGloveDefIndex));

    return g_smGlovePaints.GetValue(szGloveDefIndex, arSkinsDefIndex);  //it gets the array of skins def index
}