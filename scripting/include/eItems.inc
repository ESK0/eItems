#if defined _eItems_included_
#endinput
#endif
#define _eItems_included_

#define SEQUENCE_DEFAULT_DRAW 0
#define SEQUENCE_DEFAULT_IDLE1 1
#define SEQUENCE_DEFAULT_IDLE2 2
#define SEQUENCE_DEFAULT_LIGHT_MISS1 3
#define SEQUENCE_DEFAULT_LIGHT_MISS2 4
#define SEQUENCE_DEFAULT_LIGHT_HIT1 5
#define SEQUENCE_DEFAULT_LIGHT_HIT2 6
#define SEQUENCE_DEFAULT_LIGHT_BACKSTAB1 7
#define SEQUENCE_DEFAULT_LIGHT_BACKSTAB2 8
#define SEQUENCE_DEFAULT_HEAVY_MISS1 9
#define SEQUENCE_DEFAULT_HEAVY_HIT1 10
#define SEQUENCE_DEFAULT_HEAVY_BACKSTAB1 11
#define SEQUENCE_DEFAULT_LOOKAT01 12

#define SEQUENCE_BUTTERFLY_DRAW1 0
#define SEQUENCE_BUTTERFLY_DRAW2 1
#define SEQUENCE_BUTTERFLY_IDLE1 2
#define SEQUENCE_BUTTERFLY_IDLE2 3
#define SEQUENCE_BUTTERFLY_LIGHT_MISS1 4
#define SEQUENCE_BUTTERFLY_LIGHT_MISS2 5
#define SEQUENCE_BUTTERFLY_LIGHT_HIT1 6
#define SEQUENCE_BUTTERFLY_LIGHT_HIT2 7
#define SEQUENCE_BUTTERFLY_LIGHT_BACKSTAB1 8
#define SEQUENCE_BUTTERFLY_LIGHT_BACKSTAB2 9
#define SEQUENCE_BUTTERFLY_HEAVY_MISS1 10
#define SEQUENCE_BUTTERFLY_HEAVY_HIT1 11
#define SEQUENCE_BUTTERFLY_HEAVY_BACKSTAB1 12
#define SEQUENCE_BUTTERFLY_LOOKAT01 13
#define SEQUENCE_BUTTERFLY_LOOKAT02 14
#define SEQUENCE_BUTTERFLY_LOOKAT03 15

#define SEQUENCE_FALCHION_IDLE1 1
#define SEQUENCE_FALCHION_HEAVY_MISS1 8
#define SEQUENCE_FALCHION_HEAVY_MISS1_NOFLIP 9
#define SEQUENCE_FALCHION_LOOKAT01 12
#define SEQUENCE_FALCHION_LOOKAT02 13

#define SEQUENCE_DAGGERS_DRAW 0
#define SEQUENCE_DAGGERS_IDLE1 1
#define SEQUENCE_DAGGERS_LIGHT_MISS1 2
#define SEQUENCE_DAGGERS_LIGHT_MISS2 3
#define SEQUENCE_DAGGERS_LIGHT_MISS3 4
#define SEQUENCE_DAGGERS_LIGHT_MISS4 5
#define SEQUENCE_DAGGERS_LIGHT_MISS5 6
#define SEQUENCE_DAGGERS_LIGHT_HIT1 7
#define SEQUENCE_DAGGERS_LIGHT_HIT2 8
#define SEQUENCE_DAGGERS_LIGHT_BACKSTAB1 9
#define SEQUENCE_DAGGERS_LIGHT_BACKSTAB2 10
#define SEQUENCE_DAGGERS_HEAVY_MISS1 11
#define SEQUENCE_DAGGERS_HEAVY_MISS2 12
#define SEQUENCE_DAGGERS_HEAVY_HIT1 13
#define SEQUENCE_DAGGERS_HEAVY_BACKSTAB1 14
#define SEQUENCE_DAGGERS_LOOKAT01 15

#define SEQUENCE_BOWIE_DRAW 0
#define SEQUENCE_BOWIE_IDLE1 1
#define SEQUENCE_BOWIE_LIGHT_MISS1 2
#define SEQUENCE_BOWIE_LIGHT_MISS2 3
#define SEQUENCE_BOWIE_LIGHT_HIT1 4
#define SEQUENCE_BOWIE_LIGHT_HIT2 5
#define SEQUENCE_BOWIE_LIGHT_BACKSTAB1 6
#define SEQUENCE_BOWIE_LIGHT_BACKSTAB2 7
#define SEQUENCE_BOWIE_HEAVY_MISS1 8
#define SEQUENCE_BOWIE_HEAVY_HIT1 9
#define SEQUENCE_BOWIE_HEAVY_BACKSTAB1 10
#define SEQUENCE_BOWIE_LOOKAT01 11

#define ITEMTYPE_WEAPON 0
#define ITEMTYPE_GLOVES 1

enum WearRemap
{
    Min,
    Max
};

native int      eItems_GetWeaponCount();
native int      eItems_GetPaintsCount();
native int      eItems_GetGlovesCount();
native int      eItems_GetMusicKitsCount();
native int      eItems_GetPinsCount();
native int      eItems_GetCoinsCount();
native int      eItems_GetCoinsSetsCount();
native int      eItems_GetStickersCount();
native int      eItems_GetStickersSetsCount();
native int      eItems_GetAgentsCount();
native int      eItems_GetPatchesCount();
native int      eItems_GetCratesCount();
native int      eItems_GetSpraysCount();
native int      eItems_GetSpraysSetsCount();

native bool     eItems_AreItemsSynced();
native bool     eItems_AreItemsSyncing();
native bool     eItems_ReSync();

forward void    eItems_OnItemsSynced();
forward void    eItems_OnWeaponGiven(const int client, const int iWeapon, const char[] szClassName, const int iWeaponDefIndex, const int iSlot, const bool Skinnable, const bool Knife);

/*              Weapons             */

    /*     Generic     */

native int      eItems_GetWeaponNumByDefIndex(int iDefIndex);
native int      eItems_GetWeaponNumByClassName(const char[] szClassName);
native int      eItems_GetWeaponNumByWeapon(int iWeapon);

native int      eItems_GetWeaponDefIndexByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponDefIndexByClassName(const char[] szClassName); 
native int      eItems_GetWeaponDefIndexByWeapon(int iWeapon); 

native bool     eItems_IsDefIndexKnife(int iDefIndex);
native int      eItems_GetActiveWeaponNum(int client);
native int      eItems_GetActiveWeaponDefIndex(int client);
native int      eItems_GetActiveWeapon(int client);
native int      eItems_GetActiveWeaponClassName(int client, char[] szBuffer, int iLength);
native int      eItems_GetInSlotWeaponNum(int client, int iSlot);
native int      eItems_GetInSlotWeaponDefIndex(int client, int iSlot);
native int      eItems_GetInSlotWeapon(int client, int iSlot);
native int      eItems_GetInSlotWeaponClassName(int client, int iSlot, char[] szBuffer, int iLength);
native bool     eItems_IsSkinnableDefIndex(int iDefIndex);
native int      eItems_FindWeaponByWeaponNum(int client, int iWeaponNum);
native int      eItems_FindWeaponByDefIndex(int client, int iDefIndex);
native int      eItems_FindWeaponByClassName(int client, const char[] szClassName);
native bool     eItems_RefillClipAmmo(int iWeapon);
native bool     eItems_RefillReserveAmmo(int iWeapon);
native bool     eItems_IsValidWeapon(int iWeapon);
native int      eItems_GiveWeapon(int client, const char[] szClassName, int iReserveAmmo = -1, int iClipAmmo = -1, int iSwitchTo = -1, bool bSwitchAnimation = true);
native bool     eItems_RemoveKnife(int client);
native bool     eItems_RemoveWeapon(int client, int iWeapon);
native int      eItems_RespawnWeapon(int client, int iWeapon, bool bSwitchAnimation = true);
native int      eItems_RespawnWeaponBySlot(int client, int iWeaponSlot);
native int      eItems_RemoveAllWeapons(int client, int iSkipSlot = -1);
native bool     eItems_SetWeaponAmmo(int iWeapon, int iReserveAmmo = -1, int iClipAmmo = -1);
native bool     eItems_SetAllWeaponsAmmoByClassName(const char[] szClassName, int iReserveAmmo = -1, int iClipAmmo = -1);
native bool     eItems_SetAllWeaponsAmmo(int iReserveAmmo = -1, int iClipAmmo = -1);
native bool     eItems_SetActiveWeapon(int client, int iWeapon);
native bool     eItems_DropWeapon(int client, int iWeapon);
native bool     eItems_HasRareInspectByDefIndex(int iWeaponDefIndex);
native bool     eItems_HasRareDrawByDefIndex(int iWeaponDefIndex);
native int      eItems_GetRareInspectSequenceByDefIndex(int iWeaponDefIndex);
native int      eItems_GetRareDrawSequenceByDefIndex(int iWeaponDefIndex);

    /*  ClassNames  */

native bool     eItems_GetWeaponClassNameByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponClassNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponClassNameByWeapon(int iWeapon, char[] szBuffer, int iLength);

    /*  DisplayNames    */

native bool     eItems_GetWeaponDisplayNameByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponDisplayNameByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*    ViewModel     */

native bool     eItems_GetWeaponViewModelByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponViewModelByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*    WorldModel     */

native bool     eItems_GetWeaponWorldModelByWeaponNum(int iWeaponNum, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByWeapon(int iWeapon, char[] szBuffer, int iLength);
native bool     eItems_GetWeaponWorldModelByClassName(const char[] szClassName, char[] szBuffer, int iLength);

    /*     Slot     */

native int      eItems_GetWeaponSlotByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponSlotByDefIndex(int iDefIndex);
native int      eItems_GetWeaponSlotByWeapon(int iWeapon);
native int      eItems_GetWeaponSlotByClassName(const char[] szClassName);

    /*     Team     */

native int      eItems_GetWeaponTeamByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponTeamByDefIndex(int iDefIndex);
native int      eItems_GetWeaponTeamByWeapon(int iWeapon);
native int      eItems_GetWeaponTeamByClassName(const char[] szClassName);

    /*     Clip Ammo     */

native int      eItems_GetWeaponClipAmmoByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponClipAmmoByDefIndex(int iDefIndex);
native int      eItems_GetWeaponClipAmmoByWeapon(int iWeapon);
native int      eItems_GetWeaponClipAmmoByClassName(const char[] szClassName);

    /*     Reserve Ammo     */

native int      eItems_GetWeaponReserveAmmoByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponReserveAmmoByDefIndex(int iDefIndex);
native int      eItems_GetWeaponReserveAmmoByWeapon(int iWeapon);
native int      eItems_GetWeaponReserveAmmoByClassName(const char[] szClassName);

    /*     Price     */

native int      eItems_GetWeaponPriceByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponPriceByDefIndex(int iDefIndex);
native int      eItems_GetWeaponPriceByWeapon(int iWeapon);
native int      eItems_GetWeaponPriceByClassName(const char[] szClassName);

    /*     Max Player Speed     */

native int      eItems_GetWeaponMaxPlayerSpeedByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponMaxPlayerSpeedByDefIndex(int iDefIndex);
native int      eItems_GetWeaponMaxPlayerSpeedByWeapon(int iWeapon);
native int      eItems_GetWeaponMaxPlayerSpeedByClassName(const char[] szClassName);

    /*     Damage     */

native int      eItems_GetWeaponDamageByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponDamageByDefIndex(int iDefIndex);
native int      eItems_GetWeaponDamageByWeapon(int iWeapon);
native int      eItems_GetWeaponDamageByClassName(const char[] szClassName);

    /*     Full Auto     */

native bool     eItems_IsWeaponFullAutoByWeaponNum(int iWeaponNum);
native bool     eItems_IsWeaponFullAutoByDefIndex(int iDefIndex);
native bool     eItems_IsWeaponFullAutoByWeapon(int iWeapon);
native bool     eItems_IsWeaponFullAutoByClassName(const char[] szClassName);

    /*     Spread     */

native float    eItems_GetWeaponSpreadByWeaponNum(int iWeaponNum);
native float    eItems_GetWeaponSpreadByDefIndex(int iDefIndex);
native float    eItems_GetWeaponSpreadByWeapon(int iWeapon);
native float    eItems_GetWeaponSpreadByClassName(const char[] szClassName);

    /*     Cycle Time     */

native float    eItems_GetWeaponCycleTimeByWeaponNum(int iWeaponNum);
native float    eItems_GetWeaponCycleTimeByDefIndex(int iDefIndex);
native float    eItems_GetWeaponCycleTimeByWeapon(int iWeapon);
native float    eItems_GetWeaponCycleTimeByClassName(const char[] szClassName);

    /*     Stickers Slots     */

native int      eItems_GetWeaponStickersSlotsByWeaponNum(int iWeaponNum);
native int      eItems_GetWeaponStickersSlotsByDefIndex(int iDefIndex);
native int      eItems_GetWeaponStickersSlotsByWeapon(int iWeapon);

/*              Skins             */

native bool     eItems_IsSkinNumGloveApplicable(int iSkinNum);
native int      eItems_GetSkinNumByDefIndex(int iDefIndex);
native int      eItems_GetSkinDefIndexBySkinNum(int iSkinNum);
native bool     eItems_GetSkinDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetSkinDisplayNameBySkinNum(int iSkinNum, char[] szBuffer, int iLength);
native bool     eItems_IsNativeSkin(int iSkinNum, int iItemNum, int iItemType);
native bool     eItems_IsNativeSkinByDefIndex(int iSkinDefIndex, int iItemDefIndex, int iItemType);
native int      eItems_GetSkinRarity(int iDefIndex);
native int      eItems_GetSkinRarityName(int iDefIndex, char[] szBuffer, int iLength);
native float    eItems_GetSkinWearRemapByDefIndex(int iDefIndex, WearRemap remap);
native float    eItems_GetSkinWearRemapBySkinNum(int iSkinNum, WearRemap remap);


/*              Gloves             */

native int      eItems_GetGlovesNumByDefIndex(int iDefIndex);
native int      eItems_GetGlovesDefIndexByGlovesNum(int iGlovesNum);
native bool     eItems_GetGlovesDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetGlovesDisplayNameByGlovesNum(int iGlovesNum, char[] szBuffer, int iLength);

native bool     eItems_GetGlovesViewModelByGlovesNum(int iGlovesNum, char[] szBuffer, int iLength);
native bool     eItems_GetGlovesViewModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetGlovesWorldModelByGlovesNum(int iGlovesNum, char[] szBuffer, int iLength);
native bool     eItems_GetGlovesWorldModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native int      eItems_GetGlovesNumBySkinNum(int iSkinNum);


/*              MusicKits             */

native int      eItems_GetMusicKitNumByDefIndex(int iDefIndex);
native int      eItems_GetMusicKitDefIndexByMusicKitNum(int iMusicKitNum);
native bool     eItems_GetMusicKitDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetMusicKitDisplayNameByMusicKitNum(int iMusicKitNum, char[] szBuffer, int iLength);

/*              Pins             */

native int      eItems_GetPinNumByDefIndex(int iDefIndex);
native int      eItems_GetPinDefIndexByPinNum(int iPinNum);
native bool     eItems_GetPinDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetPinDisplayNameByPinNum(int iPinNum, char[] szBuffer, int iLength);

/*              Coins             */

native int      eItems_GetCoinSetIdByCoinSetNum(int iCoinSetNum);
native int      eItems_GetCoinSetNumByCoinSetId(int iCoinSetId);
native bool     eItems_GetCoinSetDisplayNameByCoinSetId(int iCoinSetId, char[] szBuffer, int iLength);
native bool     eItems_GetCoinSetDisplayNameByCoinSetNum(int iCoinSetNum, char[] szBuffer, int iLength);

native int      eItems_GetCoinDefIndexByCoinNum(int iCoinNum);
native int      eItems_GetCoinNumByDefIndex(int iDefIndex);
native bool     eItems_GetCoinDisplayNameByCoinNum(int iCoinNum, char[] szBuffer, int iLength);
native bool     eItems_GetCoinDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);

native bool     eItems_IsCoinInSet(int iCoinNum, int iCoinSetId);

/*              Stickers             */

native int      eItems_GetStickerSetIdByStickerSetNum(int iStickerSetNum);
native int      eItems_GetStickerSetNumByStickerSetId(int iStickerSetId);
native bool     eItems_GetStickerSetDisplayNameByStickerSetId(int iStickerSetId, char[] szBuffer, int iLength);
native bool     eItems_GetStickerSetDisplayNameByStickerSetNum(int iStickerSetNum, char[] szBuffer, int iLength);

native int      eItems_GetStickerDefIndexByStickerNum(int iStickerNum);
native int      eItems_GetStickerNumByDefIndex(int iDefIndex);
native bool     eItems_GetStickerDisplayNameByStickerNum(int iStickerNum, char[] szBuffer, int iLength);
native bool     eItems_GetStickerDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);

native bool     eItems_IsStickerInSet(int iStickerSetNum, int iStickerNum);

/*              Agents             */

native int      eItems_GetAgentNumByDefIndex(int iDefIndex);
native int      eItems_GetAgentDefIndexByAgentNum(int iAgentNum);
native bool     eItems_GetAgentDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetAgentDisplayNameByAgentNum(int iAgentNum, char[] szBuffer, int iLength);
native bool     eItems_GetAgentPlayerModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetAgentPlayerModelByAgentNum(int iAgentNum, char[] szBuffer, int iLength);
native int      eItems_GetAgentTeamByDefIndex(int iDefIndex);
native int      eItems_GetAgentTeamByAgentNum(int iAgentNum);
native bool     eItems_GetAgentVOPrefixByDefIndex(int iDefIndex, char[] szBuffer, int iLength); // szBuffer wil be blank if agent has no vo_prefix defined
native bool     eItems_GetAgentVOPrefixByAgentNum(int iAgentNum, char[] szBuffer, int iLength); // szBuffer wil be blank if agent has no vo_prefix defined

/*              Patches             */

native int      eItems_GetPatchNumByDefIndex(int iDefIndex);
native int      eItems_GetPatchDefIndexByPatchNum(int iPatchNum);
native bool     eItems_GetPatchDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetPatchDisplayNameByPatchNum(int iPatchNum, char[] szBuffer, int iLength);

/*              Crates             */

native int      eItems_GetCrateNumByDefIndex(int iDefIndex);
native int      eItems_GetCrateDefIndexByCrateNum(int iCrateNum);
native bool     eItems_GetCrateDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetCrateDisplayNameByCrateNum(int iCrateNum, char[] szBuffer, int iLength);
native bool     eItems_GetCrateWorldModelByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetCrateWorldModelByCrateNum(int iCrateNum, char[] szBuffer, int iLength);
native int      eItems_GetCrateItemsCountByDefIndex(int iDefIndex);
native int      eItems_GetCrateItemsCountByCrateNum(int iCrateNum);
native bool     eItems_GetCrateItemByDefIndex(int iDefIndex, int CrateItemNum, any[] StructDefinition, int iLength);
native bool     eItems_GetCrateItemByCrateNum(int iCrateNum, int CrateItemNum, any[] StructDefinition, int iLength);
enum struct eItems_CrateItem
{
    int WeaponDefIndex;
    int SkinDefIndex;
}

/*              Sprays             */

native int      eItems_GetSpraySetIdBySpraySetNum(int iSpraySetNum);
native int      eItems_GetSpraySetNumBySpraySetId(int iSpraySetId);
native bool     eItems_GetSpraySetDisplayNameBySpraySetId(int iSpraySetId, char[] szBuffer, int iLength);
native bool     eItems_GetSpraySetDisplayNameBySpraySetNum(int iSpraySetNum, char[] szBuffer, int iLength);

native int      eItems_GetSprayNumByDefIndex(int iDefIndex);
native int      eItems_GetSprayDefIndexBySprayNum(int iSprayNum);
native bool     eItems_GetSprayDisplayNameByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetSprayDisplayNameBySprayNum(int iSprayNum, char[] szBuffer, int iLength);
native bool     eItems_GetSprayMaterialPathByDefIndex(int iDefIndex, char[] szBuffer, int iLength);
native bool     eItems_GetSprayMaterialPathBySprayNum(int iSprayNum, char[] szBuffer, int iLength);

native bool     eItems_IsSprayInSet(int iSpraySetNum, int iSprayNum);

/*              Other             */

//weapon skins
native int    eItems_GetSkinsDefIndexArrByWeaponNum(int iWeaponNum, ArrayList &arSkins);
native int    eItems_GetSkinsDefIndexArrByWeaponDefIndex(int iWeaponDefIndex, ArrayList &arSkins);
native int    eItems_GetSkinsDefIndexArrByWeaponClassName(char[] szClassName, ArrayList &arSkins);

//glove skins
native int    eItems_GetSkinsDefIndexArrByGloveNum(int iGloveNum, ArrayList &arSkins);
native int    eItems_GetSkinsDefIndexArrByGloveDefIndex(int iGloveDefIndex, ArrayList &arSkins);