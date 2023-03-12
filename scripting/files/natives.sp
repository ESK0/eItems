public void CreateNatives()
{
    CreateNative("eItems_GetWeaponCount", Native_GetWeaponCount);
    CreateNative("eItems_GetPaintsCount", Native_GetPaintsCount);
    CreateNative("eItems_GetGlovesCount", Native_GetGlovesCount);
    CreateNative("eItems_GetMusicKitsCount", Native_GetMusicKitsCount);
    CreateNative("eItems_GetPinsCount", Native_GetPinsCount);
    CreateNative("eItems_GetCoinsCount", Native_GetCoinsCount);
    CreateNative("eItems_GetCoinsSetsCount", Native_GetCoinsSetsCount);
    CreateNative("eItems_GetStickersCount", Native_GetStickersCount);
    CreateNative("eItems_GetStickersSetsCount", Native_GetStickersSetsCount);
    CreateNative("eItems_GetAgentsCount", Native_GetAgentsCount);
    CreateNative("eItems_GetPatchesCount", Native_GetPatchesCount);
    CreateNative("eItems_GetCratesCount", Native_GetCratesCount);
    CreateNative("eItems_GetSpraysCount", Native_GetSpraysCount);
    CreateNative("eItems_GetSpraysSetsCount", Native_GetSpraysSetsCount);


    CreateNative("eItems_AreItemsSynced", Native_AreItemsSynced);
    CreateNative("eItems_AreItemsSyncing", Native_AreItemsSyncing);
    CreateNative("eItems_ReSync", Native_ReSync);
    


    /*              Weapons             */

    //Generic
    CreateNative("eItems_GetWeaponNumByDefIndex", Native_GetWeaponNumByDefIndex);
    CreateNative("eItems_GetWeaponNumByClassName", Native_GetWeaponNumByClassName);
    CreateNative("eItems_GetWeaponNumByWeapon", Native_GetWeaponNumByWeapon);

    CreateNative("eItems_GetWeaponDefIndexByWeaponNum", Native_GetWeaponDefIndexByWeaponNum);
    CreateNative("eItems_GetWeaponDefIndexByClassName", Native_GetWeaponDefIndexByClassName);
    CreateNative("eItems_GetWeaponDefIndexByWeapon", Native_GetWeaponDefIndexByWeapon);

    CreateNative("eItems_IsDefIndexKnife", Native_IsDefIndexKnife);
    CreateNative("eItems_GetActiveWeaponNum", Native_GetActiveWeaponNum);
    CreateNative("eItems_GetActiveWeaponDefIndex", Native_GetActiveWeaponDefIndex);
    CreateNative("eItems_GetActiveWeapon", Native_GetActiveWeapon);
    CreateNative("eItems_GetActiveWeaponClassName", Native_GetActiveWeaponClassName);
    CreateNative("eItems_GetInSlotWeaponNum", Native_GetInSlotWeaponNum);
    CreateNative("eItems_GetInSlotWeaponDefIndex", Native_GetInSlotWeaponDefIndex);
    CreateNative("eItems_GetInSlotWeapon", Native_GetInSlotWeapon);
    CreateNative("eItems_GetInSlotWeaponClassName", Native_GetInSlotWeaponClassName);
    CreateNative("eItems_IsSkinnableDefIndex", Native_IsSkinnableDefIndex);
    CreateNative("eItems_FindWeaponByWeaponNum", Native_FindWeaponByWeaponNum);
    CreateNative("eItems_FindWeaponByDefIndex", Native_FindWeaponByDefIndex);
    CreateNative("eItems_FindWeaponByClassName", Native_FindWeaponByClassName);
    CreateNative("eItems_RefillClipAmmo", Native_RefillClipAmmo);
    CreateNative("eItems_RefillReserveAmmo", Native_RefillReserveAmmo);
    CreateNative("eItems_IsValidWeapon", Native_IsValidWeapon);
    CreateNative("eItems_GiveWeapon", Native_GiveWeapon);
    CreateNative("eItems_RemoveKnife", Native_RemoveKnife);
    CreateNative("eItems_RemoveWeapon", Native_RemoveWeapon);
    CreateNative("eItems_RespawnWeapon", Native_RespawnWeapon);
    CreateNative("eItems_RespawnWeaponBySlot", Native_RespawnWeaponBySlot);
    CreateNative("eItems_RemoveAllWeapons", Native_RemoveAllWeapons);
    CreateNative("eItems_SetWeaponAmmo", Native_SetWeaponAmmo);
    CreateNative("eItems_SetAllWeaponsAmmo", Native_SetAllWeaponsAmmo);
    CreateNative("eItems_SetAllWeaponsAmmoByClassName", Native_SetAllWeaponsAmmoByClassName);
    CreateNative("eItems_SetActiveWeapon", Native_SetActiveWeapon);
    CreateNative("eItems_DropWeapon", Native_DropWeapon);
    CreateNative("eItems_HasRareInspectByDefIndex", Native_HasRareInspectByDefIndex);
    CreateNative("eItems_HasRareDrawByDefIndex", Native_HasRareDrawByDefIndex);
    CreateNative("eItems_GetRareInspectSequenceByDefIndex", Native_GetRareInspectSequenceByDefIndex);
    CreateNative("eItems_GetRareDrawSequenceByDefIndex", Native_GetRareDrawSequenceByDefIndex);


    //ClassNames
    CreateNative("eItems_GetWeaponClassNameByWeaponNum", Native_GetWeaponClassNameByWeaponNum);
    CreateNative("eItems_GetWeaponClassNameByDefIndex", Native_GetWeaponClassNameByDefIndex);
    CreateNative("eItems_GetWeaponClassNameByWeapon", Native_GetWeaponClassNameByWeapon);
    //DisplayNames
    CreateNative("eItems_GetWeaponDisplayNameByWeaponNum", Native_GetWeaponDisplayNameByWeaponNum);
    CreateNative("eItems_GetWeaponDisplayNameByDefIndex", Native_GetWeaponDisplayNameByDefIndex);
    CreateNative("eItems_GetWeaponDisplayNameByClassName", Native_GetWeaponDisplayNameByClassName);
    CreateNative("eItems_GetWeaponDisplayNameByWeapon", Native_GetWeaponDisplayNameByWeapon);
    //ViewModels
    CreateNative("eItems_GetWeaponViewModelByWeaponNum", Native_GetWeaponViewModelByWeaponNum);
    CreateNative("eItems_GetWeaponViewModelByDefIndex", Native_GetWeaponViewModelByDefIndex);
    CreateNative("eItems_GetWeaponViewModelByWeapon", Native_GetWeaponViewModelByWeapon);
    CreateNative("eItems_GetWeaponViewModelByClassName", Native_GetWeaponViewModelByClassName);
    //WorldModels
    CreateNative("eItems_GetWeaponWorldModelByWeaponNum", Native_GetWeaponWorldModelByWeaponNum);
    CreateNative("eItems_GetWeaponWorldModelByDefIndex", Native_GetWeaponWorldModelByDefIndex);
    CreateNative("eItems_GetWeaponWorldModelByWeapon", Native_GetWeaponWorldModelByWeapon);
    CreateNative("eItems_GetWeaponWorldModelByClassName", Native_GetWeaponWorldModelByClassName);
    //Weapon Slot
    CreateNative("eItems_GetWeaponSlotByWeaponNum", Native_GetWeaponSlotByWeaponNum);
    CreateNative("eItems_GetWeaponSlotByDefIndex", Native_GetWeaponSlotByDefIndex);
    CreateNative("eItems_GetWeaponSlotByWeapon", Native_GetWeaponSlotByWeapon);
    CreateNative("eItems_GetWeaponSlotByClassName", Native_GetWeaponSlotByClassName);
    //Weapon Team
    CreateNative("eItems_GetWeaponTeamByWeaponNum", Native_GetWeaponTeamByWeaponNum);
    CreateNative("eItems_GetWeaponTeamByDefIndex", Native_GetWeaponTeamByDefIndex);
    CreateNative("eItems_GetWeaponTeamByWeapon", Native_GetWeaponTeamByWeapon);
    CreateNative("eItems_GetWeaponTeamByClassName", Native_GetWeaponTeamByClassName);
    //Clip Ammo
    CreateNative("eItems_GetWeaponClipAmmoByWeaponNum", Native_GetWeaponClipAmmoByWeaponNum);
    CreateNative("eItems_GetWeaponClipAmmoByDefIndex", Native_GetWeaponClipAmmoByDefIndex);
    CreateNative("eItems_GetWeaponClipAmmoByWeapon", Native_GetWeaponClipAmmoByWeapon);
    CreateNative("eItems_GetWeaponClipAmmoByClassName", Native_GetWeaponClipAmmoByClassName);
    //Reserve Ammo
    CreateNative("eItems_GetWeaponReserveAmmoByWeaponNum", Native_GetWeaponReserveAmmoByWeaponNum);
    CreateNative("eItems_GetWeaponReserveAmmoByDefIndex", Native_GetWeaponReserveAmmoByDefIndex);
    CreateNative("eItems_GetWeaponReserveAmmoByWeapon", Native_GetWeaponReserveAmmoByWeapon);
    CreateNative("eItems_GetWeaponReserveAmmoByClassName", Native_GetWeaponReserveAmmoByClassName);
    //Price
    CreateNative("eItems_GetWeaponPriceByWeaponNum", Native_GetWeaponPriceByWeaponNum);
    CreateNative("eItems_GetWeaponPriceByDefIndex", Native_GetWeaponPriceByDefIndex);
    CreateNative("eItems_GetWeaponPriceByWeapon", Native_GetWeaponPriceByWeapon);
    CreateNative("eItems_GetWeaponPriceByClassName", Native_GetWeaponPriceByClassName);
    //Max Player Speed
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByWeaponNum", Native_GetWeaponMaxPlayerSpeedByWeaponNum);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByDefIndex", Native_GetWeaponMaxPlayerSpeedByDefIndex);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByWeapon", Native_GetWeaponMaxPlayerSpeedByWeapon);
    CreateNative("eItems_GetWeaponMaxPlayerSpeedByClassName", Native_GetWeaponMaxPlayerSpeedByClassName);
    //Damage
    CreateNative("eItems_GetWeaponDamageByWeaponNum", Native_GetWeaponDamageByWeaponNum);
    CreateNative("eItems_GetWeaponDamageByDefIndex", Native_GetWeaponDamageByDefIndex);
    CreateNative("eItems_GetWeaponDamageByWeapon", Native_GetWeaponDamageByWeapon);
    CreateNative("eItems_GetWeaponDamageByClassName", Native_GetWeaponDamageByClassName);
    //Is Full Auto
    CreateNative("eItems_IsWeaponFullAutoByWeaponNum", Native_IsWeaponFullAutoByWeaponNum);
    CreateNative("eItems_IsWeaponFullAutoByDefIndex", Native_IsWeaponFullAutoByDefIndex);
    CreateNative("eItems_IsWeaponFullAutoByWeapon", Native_IsWeaponFullAutoByWeapon);
    CreateNative("eItems_IsWeaponFullAutoByClassName", Native_IsWeaponFullAutoByClassName);
    //Spread
    CreateNative("eItems_GetWeaponSpreadByWeaponNum", Native_GetWeaponSpreadByWeaponNum);
    CreateNative("eItems_GetWeaponSpreadByDefIndex", Native_GetWeaponSpreadByDefIndex);
    CreateNative("eItems_GetWeaponSpreadByWeapon", Native_GetWeaponSpreadByWeapon);
    CreateNative("eItems_GetWeaponSpreadByClassName", Native_GetWeaponSpreadByClassName);
    //Cycle Time
    CreateNative("eItems_GetWeaponCycleTimeByWeaponNum", Native_GetWeaponCycleTimeByWeaponNum);
    CreateNative("eItems_GetWeaponCycleTimeByDefIndex", Native_GetWeaponCycleTimeByDefIndex);
    CreateNative("eItems_GetWeaponCycleTimeByWeapon", Native_GetWeaponCycleTimeByWeapon);
    CreateNative("eItems_GetWeaponCycleTimeByClassName", Native_GetWeaponCycleTimeByClassName);
    //Stickers Slots
    CreateNative("eItems_GetWeaponStickersSlotsByWeaponNum", Native_GetWeaponStickersSlotsByWeaponNum);
    CreateNative("eItems_GetWeaponStickersSlotsByDefIndex", Native_GetWeaponStickersSlotsByDefIndex);
    CreateNative("eItems_GetWeaponStickersSlotsByWeapon", Native_GetWeaponStickersSlotsByWeapon);

    /*              Skins             */

    CreateNative("eItems_IsSkinNumGloveApplicable", Native_IsSkinNumGloveApplicable);
    CreateNative("eItems_GetSkinNumByDefIndex", Native_GetSkinNumByDefIndex);
    CreateNative("eItems_GetSkinDefIndexBySkinNum", Native_GetSkinDefIndexBySkinNum);
    CreateNative("eItems_GetSkinDisplayNameByDefIndex", Native_GetSkinDisplayNameByDefIndex);
    CreateNative("eItems_GetSkinDisplayNameBySkinNum", Native_GetSkinDisplayNameBySkinNum);
    CreateNative("eItems_IsNativeSkin", Native_IsNativeSkin);
    CreateNative("eItems_IsNativeSkinByDefIndex", Native_IsNativeSkinByDefIndex);
    CreateNative("eItems_GetSkinRarity", Native_GetSkinRarity);
    CreateNative("eItems_GetSkinRarityName", Native_GetSkinRarityName);
    CreateNative("eItems_GetSkinWearRemapByDefIndex", Native_GetSkinWearRemapByDefIndex);
    CreateNative("eItems_GetSkinWearRemapBySkinNum", Native_GetSkinWearRemapBySkinNum);

    /*              Gloves            */

    CreateNative("eItems_GetGlovesNumByDefIndex", Native_GetGlovesNumByDefIndex);
    CreateNative("eItems_GetGlovesDefIndexByGlovesNum", Native_GetGlovesDefIndexByGlovesNum);
    CreateNative("eItems_GetGlovesDisplayNameByDefIndex", Native_GetGlovesDisplayNameByDefIndex);
    CreateNative("eItems_GetGlovesDisplayNameByGlovesNum", Native_GetGlovesDisplayNameByGlovesNum);
    CreateNative("eItems_GetGlovesViewModelByGlovesNum", Native_GetGlovesViewModelByGlovesNum);
    CreateNative("eItems_GetGlovesViewModelByDefIndex", Native_GetGlovesViewModelByDefIndex);
    CreateNative("eItems_GetGlovesWorldModelByGlovesNum", Native_GetGlovesWorldModelByGlovesNum);
    CreateNative("eItems_GetGlovesWorldModelByDefIndex", Native_GetGlovesWorldModelByDefIndex);
    CreateNative("eItems_GetGlovesNumBySkinNum", Native_GetGlovesNumBySkinNum);
    
    /*              Music Kits            */  

    CreateNative("eItems_GetMusicKitNumByDefIndex", Native_GetMusicKitNumByDefIndex);
    CreateNative("eItems_GetMusicKitDefIndexByMusicKitNum", Native_GetMusicKitDefIndexByMusicKitNum);
    CreateNative("eItems_GetMusicKitDisplayNameByDefIndex", Native_GetMusicKitDisplayNameByDefIndex);
    CreateNative("eItems_GetMusicKitDisplayNameByMusicKitNum", Native_GetMusicKitDisplayNameByMusicKitNum);

    /*              Pins            */  

    CreateNative("eItems_GetPinNumByDefIndex", Native_GetPinNumByDefIndex);
    CreateNative("eItems_GetPinDefIndexByPinNum", Native_GetPinDefIndexByPinNum);
    CreateNative("eItems_GetPinDisplayNameByDefIndex", Native_GetPinDisplayNameByDefIndex);
    CreateNative("eItems_GetPinDisplayNameByPinNum", Native_GetPinDisplayNameByPinNum);

    /*              Coins            */

    CreateNative("eItems_GetCoinSetIdByCoinSetNum", Native_GetCoinSetIdByCoinSetNum);
    CreateNative("eItems_GetCoinSetNumByCoinSetId", Native_GetCoinSetNumByCoinSetId);
    CreateNative("eItems_GetCoinSetDisplayNameByCoinSetNum", Native_GetCoinSetDisplayNameByCoinSetNum);
    CreateNative("eItems_GetCoinSetDisplayNameByCoinSetId", Native_GetCoinSetDisplayNameByCoinSetId);

    CreateNative("eItems_GetCoinDefIndexByCoinNum", Native_GetCoinDefIndexByCoinNum);
    CreateNative("eItems_GetCoinNumByDefIndex", Native_GetCoinNumByDefIndex);
    CreateNative("eItems_GetCoinDisplayNameByCoinNum", Native_GetCoinDisplayNameByCoinNum);
    CreateNative("eItems_GetCoinDisplayNameByDefIndex", Native_GetCoinDisplayNameByDefIndex);

    CreateNative("eItems_IsCoinInSet", Native_IsCoinInSet);

    /*              Stickers            */

    CreateNative("eItems_GetStickerSetIdByStickerSetNum", Native_GetStickerSetIdByStickerSetNum);
    CreateNative("eItems_GetStickerSetNumByStickerSetId", Native_GetStickerSetNumByStickerSetId);
    CreateNative("eItems_GetStickerSetDisplayNameByStickerSetNum", Native_GetStickerSetDisplayNameByStickerSetNum);
    CreateNative("eItems_GetStickerSetDisplayNameByStickerSetId", Native_GetStickerSetDisplayNameByStickerSetId);

    CreateNative("eItems_GetStickerDefIndexByStickerNum", Native_GetStickerDefIndexByStickerNum);
    CreateNative("eItems_GetStickerNumByDefIndex", Native_GetStickerNumByDefIndex);
    CreateNative("eItems_GetStickerDisplayNameByStickerNum", Native_GetStickerDisplayNameByStickerNum);
    CreateNative("eItems_GetStickerDisplayNameByDefIndex", Native_GetStickerDisplayNameByDefIndex);

    CreateNative("eItems_IsStickerInSet", Native_IsStickerInSet);

        /*              Agents            */  

    CreateNative("eItems_GetAgentNumByDefIndex", Native_GetAgentNumByDefIndex);
    CreateNative("eItems_GetAgentDefIndexByAgentNum", Native_GetAgentDefIndexByAgentNum);
    CreateNative("eItems_GetAgentDisplayNameByDefIndex", Native_GetAgentDisplayNameByDefIndex);
    CreateNative("eItems_GetAgentDisplayNameByAgentNum", Native_GetAgentDisplayNameByAgentNum);
    CreateNative("eItems_GetAgentPlayerModelByDefIndex", Native_GetAgentPlayerModelByDefIndex);
    CreateNative("eItems_GetAgentPlayerModelByAgentNum", Native_GetAgentPlayerModelByAgentNum);
    CreateNative("eItems_GetAgentTeamByDefIndex", Native_GetAgentTeamByDefIndex);
    CreateNative("eItems_GetAgentTeamByAgentNum", Native_GetAgentTeamByAgentNum);
    CreateNative("eItems_GetAgentVOPrefixByDefIndex", Native_GetAgentVOPrefixByDefIndex);
    CreateNative("eItems_GetAgentVOPrefixByAgentNum", Native_GetAgentVOPrefixByAgentNum);

        /*              Patches            */  

    CreateNative("eItems_GetPatchNumByDefIndex", Native_GetPatchNumByDefIndex);
    CreateNative("eItems_GetPatchDefIndexByPatchNum", Native_GetPatchDefIndexByPatchNum);
    CreateNative("eItems_GetPatchDisplayNameByDefIndex", Native_GetPatchDisplayNameByDefIndex);
    CreateNative("eItems_GetPatchDisplayNameByPatchNum", Native_GetPatchDisplayNameByPatchNum);

        /*              Crates            */  

    CreateNative("eItems_GetCrateNumByDefIndex", Native_GetCrateNumByDefIndex);
    CreateNative("eItems_GetCrateDefIndexByCrateNum", Native_GetCrateDefIndexByCrateNum);
    CreateNative("eItems_GetCrateDisplayNameByDefIndex", Native_GetCrateDisplayNameByDefIndex);
    CreateNative("eItems_GetCrateDisplayNameByCrateNum", Native_GetCrateDisplayNameByCrateNum);
    CreateNative("eItems_GetCrateWorldModelByDefIndex", Native_GetCrateWorldModelByDefIndex);
    CreateNative("eItems_GetCrateWorldModelByCrateNum", Native_GetCrateWorldModelByCrateNum);
    CreateNative("eItems_GetCrateItemsCountByDefIndex", Native_GetCrateItemsCountByDefIndex);
    CreateNative("eItems_GetCrateItemsCountByCrateNum", Native_GetCrateItemsCountByCrateNum);
    CreateNative("eItems_GetCrateItemByDefIndex", Native_GetCrateItemByDefIndex);
    CreateNative("eItems_GetCrateItemByCrateNum", Native_GetCrateItemByCrateNum);

        /*              Sprays            */

    CreateNative("eItems_GetSpraySetIdBySpraySetNum", Native_GetSpraySetIdBySpraySetNum);
    CreateNative("eItems_GetSpraySetNumBySpraySetId", Native_GetSpraySetNumBySpraySetId);
    CreateNative("eItems_GetSpraySetDisplayNameBySpraySetNum", Native_GetSpraySetDisplayNameBySpraySetNum);
    CreateNative("eItems_GetSpraySetDisplayNameBySpraySetId", Native_GetSpraySetDisplayNameBySpraySetId);

    CreateNative("eItems_GetSprayNumByDefIndex", Native_GetSprayNumByDefIndex);
    CreateNative("eItems_GetSprayDefIndexBySprayNum", Native_GetSprayDefIndexBySprayNum);
    CreateNative("eItems_GetSprayDisplayNameByDefIndex", Native_GetSprayDisplayNameByDefIndex);
    CreateNative("eItems_GetSprayDisplayNameBySprayNum", Native_GetSprayDisplayNameBySprayNum);
    CreateNative("eItems_GetSprayMaterialPathByDefIndex", Native_GetSprayMaterialPathByDefIndex);
    CreateNative("eItems_GetSprayMaterialPathBySprayNum", Native_GetSprayMaterialPathBySprayNum);

    CreateNative("eItems_IsSprayInSet", Native_IsSprayInSet);

    /*              Other            */

    CreateNative("eItems_GetSkinsDefIndexArrByWeaponNum", Natives_GetSkinsDefIndexArrByWeaponNum);
    CreateNative("eItems_GetSkinsDefIndexArrByWeaponDefIndex", Natives_GetSkinsDefIndexArrByWeaponDefIndex);
    CreateNative("eItems_GetSkinsDefIndexArrByWeaponClassName", Natives_GetSkinsDefIndexArrByWeaponClassName);

    CreateNative("eItems_GetSkinsDefIndexArrByGloveNum", Natives_GetSkinsDefIndexArrByGloveNum);
    CreateNative("eItems_GetSkinsDefIndexArrByGloveDefIndex", Natives_GetSkinsDefIndexArrByGloveDefIndex);
}

/*              Functions            */


public int Native_GetWeaponCount(Handle plugin, int numParams)
{
    return GetWeaponCount();
}

public int Native_GetPaintsCount(Handle plugin, int numParams)
{
    return GetPaintsCount();
}

public int Native_GetGlovesCount(Handle plugin, int numParams)
{
    return GetGlovesCount();
}

public int Native_GetMusicKitsCount(Handle plugin, int numParams)
{
    return GetMusicKitsCount();
}

public int Native_GetPinsCount(Handle plugin, int numParams)
{
    return GetPinsCount();
}

public int Native_GetCoinsCount(Handle plugin, int numParams)
{
    return GetCoinsCount();
}

public int Native_GetCoinsSetsCount(Handle plugin, int numParams)
{
    return GetCoinsSetsCount();
}

public int Native_GetStickersCount(Handle plugin, int numParams)
{
    return GetStickersCount();
}

public int Native_GetStickersSetsCount(Handle plugin, int numParams)
{
    return GetStickersSetsCount();
}

public int Native_GetAgentsCount(Handle plugin, int numParams)
{
    return GetAgentsCount();
}

public int Native_GetPatchesCount(Handle plugin, int numParams)
{
    return GetPatchesCount();
}

public int Native_GetCratesCount(Handle plugin, int numParams)
{
    return GetCratesCount();
}

public int Native_GetSpraysCount(Handle plugin, int numParams)
{
    return GetSpraysCount();
}

public int Native_GetSpraysSetsCount(Handle plugin, int numParams)
{
    return GetSpraysSetsCount();
}


public int Native_AreItemsSynced(Handle plugin, int numParams)
{
    return AreItemsSynced();
}

public int Native_AreItemsSyncing(Handle plugin, int numParams)
{
    return AreItemsSyncing();
}

public int Native_ReSync(Handle hPlugin, int iNumParams)
{
    CheckHibernation();
    ParseItems();
    return true;
}

    // ClassNames

public int Native_GetWeaponClassNameByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByWeaponNum(iWeaponNum, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponClassNameByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponClassNameByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szClassName[48];

    if(!GetWeaponClassNameByWeapon(iWeapon, szClassName, sizeof(szClassName)))
    {
        return false;
    }

    return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
}

    // DisplayNames

public int Native_GetWeaponDisplayNameByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetWeaponDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szDisplayName[64];

    if(!GetWeaponDisplayNameByClassName(szClassName, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetWeaponDisplayNameByWeaponNum(iWeaponNum, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponDisplayNameByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetWeaponDisplayNameByWeapon(iWeapon, szDisplayName, sizeof(szDisplayName)))
    {
        return false;
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //ViewModel

public int Native_GetWeaponViewModelByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByWeaponNum(iWeaponNum, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByDefIndex(iDefIndex, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByWeapon(iWeapon, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponViewModelByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szViewModel[PLATFORM_MAX_PATH];

    if(!GetWeaponViewModelByClassName(szClassName, szViewModel, sizeof(szViewModel)))
    {
        return false;
    }

    return SetNativeString(2, szViewModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //WorldModel

public int Native_GetWeaponWorldModelByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByWeaponNum(iWeaponNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByWeapon(iWeapon, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetWeaponWorldModelByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetWeaponWorldModelByClassName(szClassName, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

    //Generic

public int Native_IsDefIndexKnife(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    return IsDefIndexKnife(iDefIndex);
}

public int Native_GetWeaponDefIndexByWeapon(Handle hPlugin, int iNumParams)
{
	int iWeapon = GetNativeCell(1);
	return GetWeaponDefIndexByWeapon(iWeapon);
}

public int Native_GetWeaponNumByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    return GetWeaponNumByDefIndex(iDefIndex);
}

public int Native_GetWeaponNumByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    return GetWeaponNumByClassName(szClassName);
}

public int Native_GetWeaponNumByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    return GetWeaponNumByWeapon(iWeapon);
}

public int Native_GetWeaponDefIndexByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    return GetWeaponDefIndexByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponDefIndexByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    return GetWeaponDefIndexByClassName(szClassName);
}

public int Native_GetActiveWeaponNum(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetActiveWeapon(client);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponNumByWeapon(iWeapon);
}

public int Native_GetActiveWeaponDefIndex(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetActiveWeapon(client);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponDefIndexByWeapon(iWeapon);
}

public int Native_GetActiveWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	return GetActiveWeapon(client);
}

public int Native_GetActiveWeaponClassName(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);

    int iDefIndex = GetActiveWeaponDefIndex(client);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if (GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
    }

    return false;
}

public int Native_GetInSlotWeaponNum(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSlot = GetNativeCell(2);


    int iWeapon = GetInSlotWeapon(client, iSlot);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponNumByWeapon(iWeapon);
}

public int Native_GetInSlotWeaponDefIndex(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSlot = GetNativeCell(2);
    int iWeapon = GetInSlotWeapon(client, iSlot);

    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponDefIndexByWeapon(iWeapon);
}

public int Native_GetInSlotWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iSlot = GetNativeCell(2);
	return GetInSlotWeapon(client, iSlot);
}

public int Native_GetInSlotWeaponClassName(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSlot = GetNativeCell(2);

    int iWeapon = GetInSlotWeapon(client, iSlot);

    int iDefIndex = GetWeaponDefIndexByWeapon(iWeapon);

    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szClassName[48];

    if (GetWeaponClassNameByDefIndex(iDefIndex, szClassName, sizeof(szClassName)))
    {
        return SetNativeString(2, szClassName, GetNativeCell(3)) == SP_ERROR_NONE;
    }

    return false;
}

public int Native_IsSkinnableDefIndex(Handle hPlugin, int iNumParams)
{
	int iDefIndex = GetNativeCell(1);

	if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

	return IsSkinnableDefIndex(iDefIndex);
}

public int Native_FindWeaponByWeaponNum(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeaponNum = GetNativeCell(2);
	
	return FindWeaponByWeaponNum(client, iWeaponNum);
}

public int Native_FindWeaponByDefIndex(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iDefIndex = GetNativeCell(2);
	
	return FindWeaponByDefIndex(client, iDefIndex);
}

public int Native_FindWeaponByClassName(Handle plugin, int numParams)
{
    char szClassName[48];

    int client = GetNativeCell(1);
    GetNativeString(2, szClassName, sizeof(szClassName));

    return FindWeaponByClassName(client, szClassName);
}

    //Weapon Slot

public int Native_GetWeaponSlotByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponSlotByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponSlotByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponSlotByDefIndex(iDefIndex);
}

public int Native_GetWeaponSlotByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponSlotByWeapon(iWeapon);
}

public int Native_GetWeaponSlotByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponSlotByClassName(szClassName);
}

    //Weapon Team

public int Native_GetWeaponTeamByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponTeamByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponTeamByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponTeamByDefIndex(iDefIndex);
}

public int Native_GetWeaponTeamByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponTeamByWeapon(iWeapon);
}

public int Native_GetWeaponTeamByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponTeamByClassName(szClassName);
}

    //Clip Ammo
public int Native_GetWeaponClipAmmoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponClipAmmoByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponClipAmmoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponClipAmmoByDefIndex(iDefIndex);
}

public int Native_GetWeaponClipAmmoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponClipAmmoByWeapon(iWeapon);
}

public int Native_GetWeaponClipAmmoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponClipAmmoByClassName(szClassName);
}

    //Reserve Ammo
public int Native_GetWeaponReserveAmmoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponReserveAmmoByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponReserveAmmoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponReserveAmmoByDefIndex(iDefIndex);
}

public int Native_GetWeaponReserveAmmoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponReserveAmmoByWeapon(iWeapon);
}

public int Native_GetWeaponReserveAmmoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponReserveAmmoByClassName(szClassName);
}

    //Price
public int Native_GetWeaponPriceByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponPriceByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponPriceByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponPriceByDefIndex(iDefIndex);
}

public int Native_GetWeaponPriceByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponPriceByWeapon(iWeapon);
}

public int Native_GetWeaponPriceByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponPriceByClassName(szClassName);
}

    //Max Player Speed
public int Native_GetWeaponMaxPlayerSpeedByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponMaxPlayerSpeedByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByDefIndex(iDefIndex);
}

public int Native_GetWeaponMaxPlayerSpeedByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponMaxPlayerSpeedByWeapon(iWeapon);
}

public int Native_GetWeaponMaxPlayerSpeedByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponMaxPlayerSpeedByClassName(szClassName);
}

    //Damage
public int Native_GetWeaponDamageByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return GetWeaponDamageByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponDamageByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return GetWeaponDamageByDefIndex(iDefIndex);
}

public int Native_GetWeaponDamageByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return GetWeaponDamageByWeapon(iWeapon);
}

public int Native_GetWeaponDamageByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return GetWeaponDamageByClassName(szClassName);
}

    //Is Full Auto
public int Native_IsWeaponFullAutoByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByWeaponNum(iWeaponNum));
}

public int Native_IsWeaponFullAutoByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByDefIndex(iDefIndex));
}

public int Native_IsWeaponFullAutoByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return view_as<bool>(IsWeaponFullAutoByWeapon(iWeapon));
}

public int Native_IsWeaponFullAutoByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<bool>(IsWeaponFullAutoByClassName(szClassName));
}

    //Spread
public int Native_GetWeaponSpreadByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByWeaponNum(iWeaponNum));
}

public int Native_GetWeaponSpreadByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByDefIndex(iDefIndex));
}

public int Native_GetWeaponSpreadByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponSpreadByWeapon(iWeapon));
}

public int Native_GetWeaponSpreadByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<int>(GetWeaponSpreadByClassName(szClassName));
}

    //Cycle Time
public int Native_GetWeaponCycleTimeByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByWeaponNum(iWeaponNum));
}

public int Native_GetWeaponCycleTimeByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByDefIndex(iDefIndex));
}

public int Native_GetWeaponCycleTimeByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return view_as<int>(-1.0);
    }

    return view_as<int>(GetWeaponCycleTimeByWeapon(iWeapon));
}

public int Native_GetWeaponCycleTimeByClassName(Handle plugin, int numParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));

    return view_as<int>(GetWeaponCycleTimeByClassName(szClassName));
}

    //Stickers Slots
public int Native_GetWeaponStickersSlotsByWeaponNum(Handle plugin, int numParams)
{
    int iWeaponNum = GetNativeCell(1);
    if(g_iWeaponCount < iWeaponNum)
    {
        return -1;
    }

    return GetWeaponStickersSlotsByWeaponNum(iWeaponNum);
}

public int Native_GetWeaponStickersSlotsByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arWeaponsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }

    return GetWeaponStickersSlotsByDefIndex(iDefIndex);
}

public int Native_GetWeaponStickersSlotsByWeapon(Handle plugin, int numParams)
{
    int iWeapon = GetNativeCell(1);
    if(!IsValidWeapon(iWeapon))
    {
        return -1;
    }

    return GetWeaponStickersSlotsByWeapon(iWeapon);
}


public int Native_RefillClipAmmo(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);

    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return RefillClipAmmo(iWeapon);
}

public int Native_RefillReserveAmmo(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);

    if(!IsValidWeapon(iWeapon))
    {
        return false;
    }

    return RefillReserveAmmo(iWeapon);
}

public int Native_IsValidWeapon(Handle hPlugin, int iNumParams)
{
    int iWeapon = GetNativeCell(1);
    return IsValidWeapon(iWeapon);
}

public int Native_GiveWeapon(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    char szClassName[48];

    GetNativeString(2, szClassName, sizeof(szClassName));

    int iReserveAmmo = GetNativeCell(3);
    int iClipAmmo = GetNativeCell(4);
    int iSwitchTo = GetNativeCell(5);
    bool bSwitchAnimation = GetNativeCell(6);

    return GiveWeapon(client, szClassName, iReserveAmmo, iClipAmmo, iSwitchTo, bSwitchAnimation);
}

public int Native_RemoveKnife(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	
	return RemoveKnife(client);
}

public int Native_RemoveWeapon(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetNativeCell(2);

    return RemoveWeapon(client, iWeapon);
}

public int Native_RespawnWeapon(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iWeapon = GetNativeCell(2);
    bool bSwitchAnimation = GetNativeCell(3);

    return RespawnWeapon(client, iWeapon, bSwitchAnimation);
}

public int Native_RespawnWeaponBySlot(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSlot = GetNativeCell(2);
    int iWeapon = GetPlayerWeaponSlot(client, iSlot);
    return RespawnWeapon(client, iWeapon);
}

public int Native_RemoveAllWeapons(Handle hPlugin, int iNumParams)
{
    int client = GetNativeCell(1);
    int iSkipSlot = GetNativeCell(2);

    return RemoveAllWeapons(client, iSkipSlot);
}


public int Native_SetWeaponAmmo(Handle hPlugin, int iNumParams)
{
	int iWeapon = GetNativeCell(1);
	int iReserveAmmo = GetNativeCell(2);
	int iClipAmmo = GetNativeCell(3);
	
	return SetWeaponAmmo(iWeapon, iReserveAmmo, iClipAmmo);
}

public int Native_SetAllWeaponsAmmo(Handle hPlugin, int iNumParams)
{
	int iReserveAmmo = GetNativeCell(1);
	int iClipAmmo = GetNativeCell(1);

	return SetAllWeaponsAmmo(iReserveAmmo, iClipAmmo);
}

public int Native_SetAllWeaponsAmmoByClassName(Handle hPlugin, int iNumParams)
{
    char szClassName[48];
    GetNativeString(1, szClassName, sizeof(szClassName));
    int iReserveAmmo = GetNativeCell(2);
    int iClipAmmo = GetNativeCell(2);

    return SetAllWeaponsAmmoByClassName(szClassName, iReserveAmmo, iClipAmmo);
}

public int Native_SetActiveWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeapon = GetNativeCell(2);
	
	return SetActiveWeapon(client, iWeapon);
}

public int Native_DropWeapon(Handle hPlugin, int iNumParams)
{
	int client = GetNativeCell(1);
	int iWeapon = GetNativeCell(2);
	
	return DropWeapon(client, iWeapon);
}

public int Native_HasRareInspectByDefIndex(Handle hPlugin, int iNumParams)
{
    int iWeaponDefIndex = GetNativeCell(1);

    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    return HasRareInspectByDefIndex(iWeaponDefIndex);
}

public int Native_HasRareDrawByDefIndex(Handle hPlugin, int iNumParams)
{
    int iWeaponDefIndex = GetNativeCell(1);

    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return false;
    }

    return HasRareDrawByDefIndex(iWeaponDefIndex);
}

public int Native_GetRareInspectSequenceByDefIndex(Handle hPlugin, int iNumParams)
{
    int iWeaponDefIndex = GetNativeCell(1);

    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return -1;
    }

    return GetRareInspectSequenceByDefIndex(iWeaponDefIndex);
}

public int Native_GetRareDrawSequenceByDefIndex(Handle hPlugin, int iNumParams)
{
    int iWeaponDefIndex = GetNativeCell(1);

    if(g_arWeaponsNum.FindValue(iWeaponDefIndex) == -1)
    {
        return -1;
    }

    return GetRareDrawSequenceByDefIndex(iWeaponDefIndex);
}

public int Native_IsSkinNumGloveApplicable(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return false;
    }

    return IsSkinNumGloveApplicable(iSkinNum);
}

public int Native_GetSkinNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetSkinNumByDefIndex(iDefIndex);
}

public int Native_GetSkinDefIndexBySkinNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }
    return GetSkinDefIndexBySkinNum(iSkinNum);
}

public int Native_GetSkinDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetSkinDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSkinDisplayNameBySkinNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetSkinDisplayNameBySkinNum(iSkinNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_IsNativeSkin(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);
    int iItemNum = GetNativeCell(2);
    int iItemType = GetNativeCell(3);

    if(iItemType < 0 || iItemType > 1)
    {
        return false;
    }
    
    return IsNativeSkin(iSkinNum, iItemNum, iItemType);
}

public int Native_IsNativeSkinByDefIndex(Handle hPlugin, int iNumParams)
{
    int iSkinDefIndex = GetNativeCell(1);
    int iItemDefIndex = GetNativeCell(2);
    int iItemType = GetNativeCell(3);

    if(iItemType < 0 || iItemType > 1)
    {
        return false;
    }
    
    return IsNativeSkinByDefIndex(iSkinDefIndex, iItemDefIndex, iItemType);
}

public int Native_GetSkinRarity(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetSkinRarity(iDefIndex);
}

public int Native_GetSkinRarityName(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetSkinRarityName(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSkinWearRemapByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSkinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    WearRemap remap = GetNativeCell(2);

    return view_as<int>(GetSkinWearRemapByDefIndex(iDefIndex, remap));
}

public int Native_GetSkinWearRemapBySkinNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    WearRemap remap = GetNativeCell(2);

    return view_as<int>(GetSkinWearRemapBySkinNum(iSkinNum, remap));
}


public int Native_GetGlovesNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetGlovesNumByDefIndex(iDefIndex);
}

public int Native_GetGlovesDefIndexByGlovesNum(Handle hPlugin, int iNumParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iGlovesCount < iSkinNum)
    {
        return -1;
    }
    return GetGlovesDefIndexByGlovesNum(iSkinNum);
}

public int Native_GetGlovesDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetGlovesDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesDisplayNameByGlovesNum(Handle hPlugin, int iNumParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetGlovesDisplayNameByGlovesNum(iGloveNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesViewModelByGlovesNum(Handle plugin, int numParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }
    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesViewModelByGlovesNum(iGloveNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesViewModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesViewModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesWorldModelByGlovesNum(Handle plugin, int numParams)
{
    int iGloveNum = GetNativeCell(1);

    if(g_iGlovesCount < iGloveNum)
    {
        return -1;
    }
    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesWorldModelByGlovesNum(iGloveNum, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesWorldModelByDefIndex(Handle plugin, int numParams)
{
    int iDefIndex = GetNativeCell(1);
    if(g_arGlovesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetGlovesWorldModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
        return false;
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetGlovesNumBySkinNum(Handle plugin, int numParams)
{
    int iSkinNum = GetNativeCell(1);

    if(g_iPaintsCount < iSkinNum)
    {
        return -1;
    }

    return GetGlovesNumBySkinNum(iSkinNum);
}
    /*      Music Kits      */

public int Native_GetMusicKitNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arMusicKitsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetMusicKitNumByDefIndex(iDefIndex);
}

public int Native_GetMusicKitDefIndexByMusicKitNum(Handle hPlugin, int iNumParams)
{
    int iMusicKitNum = GetNativeCell(1);

    if(g_iMusicKitsCount < iMusicKitNum)
    {
        return -1;
    }
    return GetMusicKitDefIndexByMusicKitNum(iMusicKitNum);
}

public int Native_GetMusicKitDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arMusicKitsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetMusicKitDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetMusicKitDisplayNameByMusicKitNum(Handle hPlugin, int iNumParams)
{
    int iMusicKitNum = GetNativeCell(1);

    if(g_iMusicKitsCount < iMusicKitNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetMusicKitDisplayNameByMusicKitNum(iMusicKitNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}
    /*      Pins      */

public int Native_GetPinNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arPinsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetPinNumByDefIndex(iDefIndex);
}

public int Native_GetPinDefIndexByPinNum(Handle hPlugin, int iNumParams)
{
    int iPinNum = GetNativeCell(1);

    if(g_iPinsCount < iPinNum)
    {
        return -1;
    }
    return GetPinDefIndexByPinNum(iPinNum);
}

public int Native_GetPinDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arPinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetPinDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetPinDisplayNameByPinNum(Handle hPlugin, int iNumParams)
{
    int iPinNum = GetNativeCell(1);

    if(g_iPinsCount < iPinNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetPinDisplayNameByPinNum(iPinNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}
    /*      Coins      */


public int Native_GetCoinSetIdByCoinSetNum(Handle hPlugin, int iNumParams)
{
    int iCoinSetNum = GetNativeCell(1);

    if(g_iCoinsSetsCount < iCoinSetNum)
    {
        return -1;
    }
    return GetCoinSetIdByCoinSetNum(iCoinSetNum);
}

public int Native_GetCoinSetNumByCoinSetId(Handle hPlugin, int iNumParams)
{
    int iCoinSetId = GetNativeCell(1);

    if(g_arCoinsSetsNum.FindValue(iCoinSetId) == -1)
    {
        return -1;
    }
    return GetCoinSetNumByCoinSetId(iCoinSetId);
}

public int Native_GetCoinSetDisplayNameByCoinSetNum(Handle hPlugin, int iNumParams)
{
    int iCoinSetNum = GetNativeCell(1);

    if(g_iCoinsSetsCount < iCoinSetNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetCoinSetDisplayNameByCoinSetNum(iCoinSetNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCoinSetDisplayNameByCoinSetId(Handle hPlugin, int iNumParams)
{
    int iCoinSetId = GetNativeCell(1);

    if(g_arCoinsSetsNum.FindValue(iCoinSetId) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetCoinSetDisplayNameByCoinSetId(iCoinSetId, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCoinDefIndexByCoinNum(Handle hPlugin, int iNumParams)
{
    int iCoinNum = GetNativeCell(1);

    if(g_iCoinsCount < iCoinNum)
    {
        return -1;
    }
    return GetCoinDefIndexByCoinNum(iCoinNum);
}

public int Native_GetCoinNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCoinsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetCoinNumByDefIndex(iDefIndex);
}

public int Native_GetCoinDisplayNameByCoinNum(Handle hPlugin, int iNumParams)
{
    int iCoinNum = GetNativeCell(1);

    if(g_iCoinsCount < iCoinNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetCoinDisplayNameByCoinNum(iCoinNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCoinDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCoinsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetCoinDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_IsCoinInSet(Handle hPlugin, int iNumParams)
{
    int iCoinNum = GetNativeCell(1);
    int iCoinSetId = GetNativeCell(2);

    if(iCoinNum < 0 || iCoinSetId < 0)
    {
        return false;
    }
    
    return IsCoinInSet(iCoinNum, iCoinSetId);
}
    /*      Stickers      */


public int Native_GetStickerSetIdByStickerSetNum(Handle hPlugin, int iNumParams)
{
    int iStickerSetNum = GetNativeCell(1);

    if(g_iStickersSetsCount < iStickerSetNum)
    {
        return -1;
    }
    return GetStickerSetIdByStickerSetNum(iStickerSetNum);
}

public int Native_GetStickerSetNumByStickerSetId(Handle hPlugin, int iNumParams)
{
    int iStickerSetId = GetNativeCell(1);

    if(g_arStickersSetsNum.FindValue(iStickerSetId) == -1)
    {
        return -1;
    }
    return GetStickerSetNumByStickerSetId(iStickerSetId);
}

public int Native_GetStickerSetDisplayNameByStickerSetNum(Handle hPlugin, int iNumParams)
{
    int iStickerSetNum = GetNativeCell(1);

    if(g_iStickersSetsCount < iStickerSetNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetStickerSetDisplayNameByStickerSetNum(iStickerSetNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetStickerSetDisplayNameByStickerSetId(Handle hPlugin, int iNumParams)
{
    int iStickerSetId = GetNativeCell(1);

    if(g_arStickersSetsNum.FindValue(iStickerSetId) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetStickerSetDisplayNameByStickerSetId(iStickerSetId, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetStickerDefIndexByStickerNum(Handle hPlugin, int iNumParams)
{
    int iStickerNum = GetNativeCell(1);

    if(g_iStickersCount < iStickerNum)
    {
        return -1;
    }
    return GetStickerDefIndexByStickerNum(iStickerNum);
}

public int Native_GetStickerNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arStickersNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetStickerNumByDefIndex(iDefIndex);
}

public int Native_GetStickerDisplayNameByStickerNum(Handle hPlugin, int iNumParams)
{
    int iStickerNum = GetNativeCell(1);

    if(g_iStickersCount < iStickerNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetStickerDisplayNameByStickerNum(iStickerNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetStickerDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arStickersNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetStickerDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_IsStickerInSet(Handle hPlugin, int iNumParams)
{
    int iStickerSetNum = GetNativeCell(1);
    int iStickerNum = GetNativeCell(2);
    

    if(iStickerNum < 0 || iStickerSetNum < 0)
    {
        return false;
    }
    
    return IsStickerInSet(iStickerSetNum, iStickerNum);
}

    /*      Agents      */


public int Native_GetAgentNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arAgentsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetAgentNumByDefIndex(iDefIndex);
}

public int Native_GetAgentDefIndexByAgentNum(Handle hPlugin, int iNumParams)
{
    int iAgentNum = GetNativeCell(1);

    if(g_iAgentsCount < iAgentNum)
    {
        return -1;
    }
    return GetAgentDefIndexByAgentNum(iAgentNum);
}

public int Native_GetAgentDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arAgentsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetAgentDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetAgentDisplayNameByAgentNum(Handle hPlugin, int iNumParams)
{
    int iAgentNum = GetNativeCell(1);

    if(g_iAgentsCount < iAgentNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetAgentDisplayNameByAgentNum(iAgentNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetAgentPlayerModelByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arAgentsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szPlayerModel[PLATFORM_MAX_PATH];

    if(!GetAgentPlayerModelByDefIndex(iDefIndex, szPlayerModel, sizeof(szPlayerModel)))
    {
       return false; 
    }

    return SetNativeString(2, szPlayerModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetAgentPlayerModelByAgentNum(Handle hPlugin, int iNumParams)
{
    int iAgentNum = GetNativeCell(1);

    if(g_iAgentsCount < iAgentNum)
    {
        return -1;
    }

    char szPlayerModel[PLATFORM_MAX_PATH];

    if(!GetAgentPlayerModelByAgentNum(iAgentNum, szPlayerModel, sizeof(szPlayerModel)))
    {
       return false; 
    }

    return SetNativeString(2, szPlayerModel, GetNativeCell(3)) == SP_ERROR_NONE;
}


public int Native_GetAgentTeamByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arAgentsNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetAgentTeamByDefIndex(iDefIndex);
}

public int Native_GetAgentTeamByAgentNum(Handle hPlugin, int iNumParams)
{
    int iAgentNum = GetNativeCell(1);

    if(g_iAgentsCount < iAgentNum)
    {
        return -1;
    }
    return GetAgentTeamByAgentNum(iAgentNum);
}

public int Native_GetAgentVOPrefixByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arAgentsNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szVOPrefix[64];

    if(!GetAgentVOPrefixByDefIndex(iDefIndex, szVOPrefix, sizeof(szVOPrefix)))
    {
       return false; 
    }

    return SetNativeString(2, szVOPrefix, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetAgentVOPrefixByAgentNum(Handle hPlugin, int iNumParams)
{
    int iAgentNum = GetNativeCell(1);

    if(g_iAgentsCount < iAgentNum)
    {
        return -1;
    }

    char szVOPrefix[64];

    if(!GetAgentVOPrefixByAgentNum(iAgentNum, szVOPrefix, sizeof(szVOPrefix)))
    {
       return false; 
    }

    return SetNativeString(2, szVOPrefix, GetNativeCell(3)) == SP_ERROR_NONE;
}

    /*      Patches      */

public int Native_GetPatchNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arPatchesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetPatchNumByDefIndex(iDefIndex);
}

public int Native_GetPatchDefIndexByPatchNum(Handle hPlugin, int iNumParams)
{
    int iPatchNum = GetNativeCell(1);

    if(g_iPatchesCount < iPatchNum)
    {
        return -1;
    }
    return GetPatchDefIndexByPatchNum(iPatchNum);
}

public int Native_GetPatchDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arPatchesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetPatchDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetPatchDisplayNameByPatchNum(Handle hPlugin, int iNumParams)
{
    int iPatchNum = GetNativeCell(1);

    if(g_iPatchesCount < iPatchNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetPatchDisplayNameByPatchNum(iPatchNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

    /*      Crates      */

public int Native_GetCrateNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCratesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetCrateNumByDefIndex(iDefIndex);
}

public int Native_GetCrateDefIndexByCrateNum(Handle hPlugin, int iNumParams)
{
    int iCrateNum = GetNativeCell(1);

    if(g_iCratesCount < iCrateNum)
    {
        return -1;
    }
    return GetCrateDefIndexByCrateNum(iCrateNum);
}

public int Native_GetCrateDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCratesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetCrateDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCrateDisplayNameByCrateNum(Handle hPlugin, int iNumParams)
{
    int iCrateNum = GetNativeCell(1);

    if(g_iCratesCount < iCrateNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetCrateDisplayNameByCrateNum(iCrateNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCrateWorldModelByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCratesNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetCrateWorldModelByDefIndex(iDefIndex, szWorldModel, sizeof(szWorldModel)))
    {
       return false; 
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCrateWorldModelByCrateNum(Handle hPlugin, int iNumParams)
{
    int iCrateNum = GetNativeCell(1);

    if(g_iCratesCount < iCrateNum)
    {
        return -1;
    }

    char szWorldModel[PLATFORM_MAX_PATH];

    if(!GetCrateWorldModelByCrateNum(iCrateNum, szWorldModel, sizeof(szWorldModel)))
    {
       return false; 
    }

    return SetNativeString(2, szWorldModel, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetCrateItemsCountByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arCratesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetCrateItemsCountByDefIndex(iDefIndex);
}

public int Native_GetCrateItemsCountByCrateNum(Handle hPlugin, int iNumParams)
{
    int iCrateNum = GetNativeCell(1);

    if(g_iCratesCount < iCrateNum)
    {
        return -1;
    }
    return GetCrateItemsCountByCrateNum(iCrateNum);
}


public int Native_GetCrateItemByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);
    int iCrateItemNum = GetNativeCell(2);

    if(g_arCratesNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }

    eItems_CrateItem CrateItem;
    if(!GetCrateItemByDefIndex(iDefIndex, iCrateItemNum, CrateItem, sizeof(eItems_CrateItem)))
    {
        return false;
    }

    return SetNativeArray(3, CrateItem, GetNativeCell(4)) == SP_ERROR_NONE;
}

public int Native_GetCrateItemByCrateNum(Handle hPlugin, int iNumParams)
{
    int iCrateNum = GetNativeCell(1);
    int iCrateItemNum = GetNativeCell(2);

    if(g_iCratesCount < iCrateNum)
    {
        return false;
    }

    eItems_CrateItem CrateItem;
    if(!GetCrateItemByCrateNum(iCrateNum, iCrateItemNum, CrateItem, sizeof(eItems_CrateItem)))
    {
        return false;
    }

    return SetNativeArray(3, CrateItem, GetNativeCell(4)) == SP_ERROR_NONE;
}

    /*      Sprays      */

public int Native_GetSpraySetIdBySpraySetNum(Handle hPlugin, int iNumParams)
{
    int iSpraySetNum = GetNativeCell(1);

    if(g_iSpraysSetsCount < iSpraySetNum)
    {
        return -1;
    }
    return GetSpraySetIdBySpraySetNum(iSpraySetNum);
}

public int Native_GetSpraySetNumBySpraySetId(Handle hPlugin, int iNumParams)
{
    int iSpraySetId = GetNativeCell(1);

    if(g_arSpraysSetsNum.FindValue(iSpraySetId) == -1)
    {
        return -1;
    }
    return GetSpraySetNumBySpraySetId(iSpraySetId);
}

public int Native_GetSpraySetDisplayNameBySpraySetNum(Handle hPlugin, int iNumParams)
{
    int iSpraySetNum = GetNativeCell(1);

    if(g_iSpraysSetsCount < iSpraySetNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetSpraySetDisplayNameBySpraySetNum(iSpraySetNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSpraySetDisplayNameBySpraySetId(Handle hPlugin, int iNumParams)
{
    int iSpraySetId = GetNativeCell(1);

    if(g_arSpraysSetsNum.FindValue(iSpraySetId) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetSpraySetDisplayNameBySpraySetId(iSpraySetId, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSprayNumByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSpraysNum.FindValue(iDefIndex) == -1)
    {
        return -1;
    }
    return GetSprayNumByDefIndex(iDefIndex);
}

public int Native_GetSprayDefIndexBySprayNum(Handle hPlugin, int iNumParams)
{
    int iSprayNum = GetNativeCell(1);

    if(g_iSpraysCount < iSprayNum)
    {
        return -1;
    }
    return GetSprayDefIndexBySprayNum(iSprayNum);
}

public int Native_GetSprayDisplayNameByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSpraysNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szDisplayName[64];

    if(!GetSprayDisplayNameByDefIndex(iDefIndex, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSprayDisplayNameBySprayNum(Handle hPlugin, int iNumParams)
{
    int iSprayNum = GetNativeCell(1);

    if(g_iSpraysCount < iSprayNum)
    {
        return -1;
    }

    char szDisplayName[64];

    if(!GetSprayDisplayNameBySprayNum(iSprayNum, szDisplayName, sizeof(szDisplayName)))
    {
       return false; 
    }

    return SetNativeString(2, szDisplayName, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSprayMaterialPathByDefIndex(Handle hPlugin, int iNumParams)
{
    int iDefIndex = GetNativeCell(1);

    if(g_arSpraysNum.FindValue(iDefIndex) == -1)
    {
        return false;
    }

    char szMaterialPath[PLATFORM_MAX_PATH];

    if(!GetSprayMaterialPathByDefIndex(iDefIndex, szMaterialPath, sizeof(szMaterialPath)))
    {
       return false; 
    }

    return SetNativeString(2, szMaterialPath, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_GetSprayMaterialPathBySprayNum(Handle hPlugin, int iNumParams)
{
    int iSprayNum = GetNativeCell(1);

    if(g_iSpraysCount < iSprayNum)
    {
        return -1;
    }

    char szMaterialPath[PLATFORM_MAX_PATH];

    if(!GetSprayMaterialPathBySprayNum(iSprayNum, szMaterialPath, sizeof(szMaterialPath)))
    {
       return false; 
    }

    return SetNativeString(2, szMaterialPath, GetNativeCell(3)) == SP_ERROR_NONE;
}

public int Native_IsSprayInSet(Handle hPlugin, int iNumParams)
{
    int iSpraySetNum = GetNativeCell(1);
    int iSprayNum = GetNativeCell(2);
    

    if(iSprayNum < 0 || iSpraySetNum < 0)
    {
        return false;
    }
    
    return IsSprayInSet(iSpraySetNum, iSprayNum);
}

public int Natives_GetSkinsDefIndexArrByWeaponNum(Handle hPlugin, int iNumParams){
    int iWeaponNum = GetNativeCell(1);

    ArrayList arSkinsDefIndex = null;
    
    if(!GetSkinsDefIndexArrByWeaponNum(iWeaponNum, arSkinsDefIndex)){
        return -1;
    }

    SetNativeCellRef(2, arSkinsDefIndex)

    return 1;
}

public int Natives_GetSkinsDefIndexArrByWeaponDefIndex(Handle hPlugin, int iNumParams){
    int iWeaponDefIndex = GetNativeCell(1);

    ArrayList arSkinsDefIndex = null;
    
    if(!GetSkinsDefIndexArrByWeaponDefIndex(iWeaponDefIndex, arSkinsDefIndex)){
        return -1;
    }

    SetNativeCellRef(2, arSkinsDefIndex);

    return 1;
}

public int Natives_GetSkinsDefIndexArrByWeaponClassName(Handle hPlugin, int iNumParams){
    char sWeaponClassName[PLATFORM_MAX_PATH];
    GetNativeString(1, sWeaponClassName, sizeof(sWeaponClassName));

    ArrayList arSkinsDefIndex = null;
    
    if(!GetSkinsDefIndexArrByWeaponClassName(sWeaponClassName, arSkinsDefIndex)){
        return -1;
    }

    SetNativeCellRef(2, arSkinsDefIndex);

    return 1;
}

public int Natives_GetSkinsDefIndexArrByGloveNum(Handle hPlugin, int iNumParams){
    int iGloveNum = GetNativeCell(1);

    ArrayList arSkinsDefIndex = null;
    
    if(!GetSkinsDefIndexArrByGloveNum(iGloveNum, arSkinsDefIndex)){
        return -1;
    }

    SetNativeCellRef(2, arSkinsDefIndex);

    return 1;
}

public int Natives_GetSkinsDefIndexArrByGloveDefIndex(Handle hPlugin, int iNumParams){
    int iGloveDefIndex = GetNativeCell(1);

    ArrayList arSkinsDefIndex = null;
    
    if(!GetSkinsDefIndexArrByGloveDefIndex(iGloveDefIndex, arSkinsDefIndex)){
        return -1;
    }

    SetNativeCellRef(2, arSkinsDefIndex);

    return 1;
}