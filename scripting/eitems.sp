#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <ripext>
#include <eItems>

#pragma newdecls required
#pragma semicolon 1


#define TAG_NCLR "[eItems]"
#define AUTHOR "ESK0, modded by corrreia"
#define VERSION "0.20.3"

#include "files/globals.sp"
#include "files/client.sp"
#include "files/parse.sp"
#include "files/natives.sp"
#include "files/forwards.sp"
#include "files/func.sp"
#include "files/config.sp"

public Plugin myinfo =
{
    name = "eItems",
    author = AUTHOR,
    version = VERSION
};

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    RegPluginLibrary("eItems");

    CreateNatives();
    CreateForwards();
    return APLRes_Success;
}

public void OnPluginStart()
{

    //Skins
    g_smSkinInfo            = new StringMap();
    g_arSkinsNum            = new ArrayList();

    // Weapons
    g_smWeaponPaints        = new StringMap();
    g_smWeaponInfo          = new StringMap();
    g_arWeaponsNum          = new ArrayList();

    // Gloves
    g_smGlovePaints         = new StringMap();
    g_smGloveInfo           = new StringMap();
    g_arGlovesNum           = new ArrayList();

    // Music Kits
    g_arMusicKitsNum        = new ArrayList();
    g_smMusicKitInfo        = new StringMap();

    // Pins
    g_arPinsNum             = new ArrayList();
    g_smPinInfo             = new StringMap();

    // Coins
    g_arCoinsSetsNum        = new ArrayList();
    g_arCoinsNum            = new ArrayList();
    g_smCoinsSets           = new StringMap();
    g_smCoinsInfo           = new StringMap();

    // Stickers
    g_arStickersSetsNum     = new ArrayList();
    g_arStickersNum         = new ArrayList();
    g_smStickersSets        = new StringMap();
    g_smStickersInfo        = new StringMap();

    // Agents
    g_arAgentsNum           = new ArrayList();
    g_smAgentsInfo          = new StringMap();

    // Patches
    g_arPatchesNum          = new ArrayList();
    g_smPatchesInfo         = new StringMap();

    // Crates
    g_arCratesNum           = new ArrayList();
    g_smCratesInfo          = new StringMap();

    // Sprays
    g_arSpraysSetsNum       = new ArrayList();
    g_arSpraysNum           = new ArrayList();
    g_smSpraysSets          = new StringMap();
    g_smSpraysInfo          = new StringMap();
    
    g_cvHibernationWhenEmpty    = FindConVar("sv_hibernate_when_empty");
    g_iHibernateWhenEmpty       = g_cvHibernationWhenEmpty.IntValue;

    CheckHibernation();

    BuildPath(Path_SM, g_szConfigFilePath, sizeof g_szConfigFilePath, "configs/eItems.json");

    LoadConfig();
    ParseItems();

    HookEvent("player_death",       Event_PlayerDeath);
    HookEvent("round_poststart",    Event_OnRoundStart);
    HookEvent("cs_pre_restart",     Event_OnRoundEnd);

    AddNormalSoundHook(OnNormalSoundPlayed);

    Handle hConfig = LoadGameConfigFile("sdkhooks.games");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(hConfig, SDKConf_Virtual, "Weapon_Switch");
    PrepSDKCall_AddParameter(SDKType_CBaseEntity, SDKPass_Pointer);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain);

    g_hSwitchWeaponCall = EndPrepSDKCall();
}

public void OnPluginEnd()
{
    delete g_smSkinInfo;
    delete g_arSkinsNum;

    delete g_smWeaponPaints;
    delete g_smWeaponInfo;
    delete g_arWeaponsNum;

    delete g_smGlovePaints;
    delete g_smGloveInfo;  
    delete g_arGlovesNum;

    delete g_arMusicKitsNum;
    delete g_smMusicKitInfo;

    delete g_arPinsNum;
    delete g_smPinInfo;

    delete g_arCoinsSetsNum;
    delete g_arCoinsNum;
    delete g_smCoinsSets;
    delete g_smCoinsInfo;

    delete g_arStickersSetsNum;
    delete g_arStickersNum;
    delete g_smStickersSets;
    delete g_smStickersInfo;

    delete g_arAgentsNum;
    delete g_smAgentsInfo;

    delete g_arPatchesNum;
    delete g_smPatchesInfo;

    for (int iCrateNum = 0; iCrateNum < g_iCratesCount; iCrateNum++)
    {
        int iDefIndex = GetCrateDefIndexByCrateNum(iCrateNum);
        char szDefIndex[12];

        IntToString(iDefIndex, szDefIndex, sizeof(szDefIndex));

        eCrateInfo CrateInfo;
        g_smCratesInfo.GetArray(szDefIndex, CrateInfo, sizeof(eCrateInfo));

        delete CrateInfo.Items;
    }
    delete g_arCratesNum;
    delete g_smCratesInfo;

    delete g_arSpraysSetsNum;
    delete g_arSpraysNum;
    delete g_smSpraysSets;
    delete g_smSpraysInfo;
}

public void OnMapStart()
{
    if (g_iSpraysCount < 1)
    {
        return;
    }

    AddSpraysToDownloadsTable();
}

public void AddSpraysToDownloadsTable()
{
    if (!g_bDownloadSprays)
    {
        return;
    }

    for(int iSprayNum = 0; iSprayNum < g_iSpraysCount; iSprayNum++)
    {
        char szMaterialPath[PLATFORM_MAX_PATH];
        char szMaterialDownloadPath[PLATFORM_MAX_PATH];
        GetSprayMaterialPathBySprayNum(iSprayNum, szMaterialPath, sizeof(szMaterialPath));

        Format(szMaterialDownloadPath, sizeof(szMaterialDownloadPath), "materials/%s.vmt", szMaterialPath);
        if (FileExists(szMaterialDownloadPath))
        {
            AddFileToDownloadsTable(szMaterialDownloadPath);
        }

        Format(szMaterialDownloadPath, sizeof(szMaterialDownloadPath), "materials/%s.vtf", szMaterialPath);
        if (FileExists(szMaterialDownloadPath))
        {
            AddFileToDownloadsTable(szMaterialDownloadPath);
        }
    }
}

public void Event_OnRoundStart(Handle hEvent, char[] szName, bool bDontBroadcast)
{
    g_bIsRoundEnd = false;
}
public void Event_OnRoundEnd(Handle hEvent, char[] szName, bool bDontBroadcast) 
{
    g_bIsRoundEnd = true;
}

public void Event_PlayerDeath(Handle hEvent, const char[] szName, bool bDontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(hEvent, "userid"));
	
	ClientInfo[client].GivingWeapon = false;
}

public void OnClientPutInServer(int client)
{
    ClientInfo[client].Reset();
}

public Action OnNormalSoundPlayed(int clients[64], int &iNumClients, char szSample[PLATFORM_MAX_PATH], int &iEntity, int &iChannel, float &iVolume, int &iLevel, int &iPitch, int &iFlags)
{
    if(StrContains(szSample, "itempickup.wav", false) > -1 || StrContains(szSample, "ClipEmpty_Rifle.wav", false) > -1 || StrContains(szSample, "buttons/", false) > -1)
    {
        for(int client = 0; client <= MaxClients; client++)
        {
            if(!IsValidClient(client))
            {
                continue;
            }

            if(ClientInfo[client].GivingWeapon == true)
            {
                return Plugin_Handled;
            }
        }
    }
    return Plugin_Continue;
}

stock void CheckHibernation(bool bToDefault = false)
{
    if (!g_bForceDisableHibernation)
    {
        return;
    }

    if (g_iHibernateWhenEmpty == 0)
    {
        return;
    }
    
    if (bToDefault)
    {
        PrintToServer("%s Hibernation returned back to default", TAG_NCLR);
        g_cvHibernationWhenEmpty.SetInt(g_iHibernateWhenEmpty);
        return;
    }

    PrintToServer("%s Hibernation disabled", TAG_NCLR);
    g_cvHibernationWhenEmpty.SetInt(0);
}