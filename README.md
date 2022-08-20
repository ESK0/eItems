## **eItems**
eItems is an API designed to provide extended information and functionality to the CSGO Item Economy.

**Dependencies:**

- [**REST in Pawn** - HTTP client for JSON REST APIs](https://forums.alliedmods.net/showthread.php?t=298024) - ver. 1.3.0+

**Instalation:**

1. Upload configs and eitems.smx to your server.
2. Change language in eItems.json if needed.
3. Upload selected language data file to your server. ***(Only if UseLocal is set to true in config)***
4. Restart your server or load plugin manually.
5. Upload Graffiti files to server + fastdl. ***(Only if DownloadSprays is set to true in config, skip otherwise)***

**Troubleshooting:**

```
[SM] Exception reported: Invalid JSON in line
```
- This happens mostly only for Windows users. Windows have an issue with HTTP/2 requests. Set `UseLocal` to true and upload selected language file (items_XX.json) to data folder.

```
Native "HTTPRequest.HTTPRequest" was not found
```
- Update Rest In Pawn to version 1.3.0 or newer.

```
eItems.smx (eItems): unexpected error 23 in AskPluginLoad callback
```
- Make sure you do not have multiple copies of eitems.smx in plugins folder.

**Natives:**
```
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
native bool     eItems_GetGlovesPaintsByGlovesNum(int iGlovesNum, ArrayList &arPaints);
native bool 	 eItems_GetGlovesPaintsByDefIndex(int iDefIndex, ArrayList &arPaints);
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
```
