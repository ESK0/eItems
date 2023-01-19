public Action Timer_ParseItems(Handle timer)
{
    ParseItems();
    return Plugin_Continue;
}

public void ParseItems()
{

    char szFileToDownload[128];
    Format(szFileToDownload, sizeof szFileToDownload, "items_%s.json", g_szLanguageCode);

    if (g_bUseLocal)
    {
        PrintToServer("%s Using local file as a source. Language: '%s'", TAG_NCLR, g_szLanguageCode);

        char szLocalFilePath[PLATFORM_MAX_PATH];
        BuildPath(Path_SM, szLocalFilePath, sizeof szLocalFilePath, "data/%s", szFileToDownload);

        if (!FileExists(szLocalFilePath))
        {
            SetFailState("%s Unable to find: %s", TAG_NCLR, szLocalFilePath);
            return;
        }

        JSONObject jData = JSONObject.FromFile(szLocalFilePath);
        ParseData(view_as<JSON>(jData));
        return;
    }

    PrintToServer("%s Downloading eItems data from GitHub", TAG_NCLR);

    char szURL[512];
    Format(szURL, sizeof(szURL), "https://raw.githubusercontent.com/ESK0/eItems/main/data//%s", szFileToDownload);

    httpRequest = new HTTPRequest(szURL);
    httpRequest.Get(ParseItemsDownloaded);
}


public Action Timer_AttemptDownload(Handle timer)
{
    ParseItems();
    return Plugin_Continue;
}
public void ParseItemsDownloaded(HTTPResponse response, any value)
{
    if (response.Status != HTTPStatus_OK)
    {
        if(g_iAPIDownloadAttempt <= 5)
        {
            g_iAPIDownloadAttempt++;
            PrintToServer("%s Downloading eItems data from GitHub failed! Attempt: %i/5, Trying again in 2 seconds", TAG_NCLR, g_iAPIDownloadAttempt);
            CreateTimer(2.0, Timer_AttemptDownload, TIMER_FLAG_NO_MAPCHANGE); 
        }
        else
        {
            PrintToServer("%s Downloading eItems data from GitHub failed!", TAG_NCLR);
        }
        return;
    }
    if (response.Data == null)
    {
        PrintToServer("%s Downloading eItems data from GitHub failed!", TAG_NCLR);
        return;
    }
    PrintToServer("%s eItems data for '%s' language downloaded successfully", TAG_NCLR, g_szLanguageCode);
    ParseData(response.Data);
}

public void ParseData(JSON json)
{
    JSONObject jRoot = view_as<JSONObject>(json);

    g_bItemsSyncing = true;
    g_fStart = GetEngineTime();

    JSONArray   jPaints         = view_as<JSONArray>(jRoot.Get("paints"));
    JSONArray   jWeapons        = view_as<JSONArray>(jRoot.Get("weapons"));
    JSONArray   jGloves         = view_as<JSONArray>(jRoot.Get("gloves"));
    JSONArray   jMusicKits      = view_as<JSONArray>(jRoot.Get("music_kits"));
    JSONArray   jPins           = view_as<JSONArray>(jRoot.Get("pins"));
    JSONObject  jCoins          = view_as<JSONObject>(jRoot.Get("coins"));
    JSONObject  jStickers       = view_as<JSONObject>(jRoot.Get("stickers"));
    JSONArray   jAgents         = view_as<JSONArray>(jRoot.Get("agents"));
    JSONArray   jPatches        = view_as<JSONArray>(jRoot.Get("patches"));
    JSONArray   jCrates         = view_as<JSONArray>(jRoot.Get("crates"));
    JSONObject   jSprays         = view_as<JSONObject>(jRoot.Get("sprays"));

    /*              Paints parse                */

    ParsePaints(jPaints);

    /*              Weapon parse                */

    ParseWeapons(jWeapons);

    /*             Gloves parse                */

    ParseGloves(jGloves);

    /*           Music Kits parse               */

    ParseMusicKits(jMusicKits);

    /*              Pins parse                  */

    ParsePins(jPins);

    /*              Coins parse                  */

    ParseCoins(jCoins);

    /*              Stickers parse                  */

    ParseStickers(jStickers);

    /*              Agents parse                  */

    ParseAgents(jAgents);

    /*              Patches parse                  */

    ParsePatches(jPatches);

    /*              Crates parse                  */

    ParseCrates(jCrates);

    /*             Sprays parse                  */

    ParseSprays(jSprays);
    

    delete jRoot;
    delete jWeapons;
    delete jPaints;
    delete jGloves;
    delete jCoins;
    delete jPins;
    delete jCrates;
    delete jMusicKits;
    delete jPatches;
    delete jSprays;
    delete jStickers;
    delete jAgents;

    float fEnd = GetEngineTime();
    PrintToServer("%s Items synced successfully in %0.5f seconds", TAG_NCLR, fEnd - g_fStart);
    g_bItemsSynced = true;
    g_bItemsSyncing = false;

    Call_StartForward(g_OnItemsSynced);
    Call_Finish();

    CheckHibernation(true);
    AddSpraysToDownloadsTable();
    //CreateTimer(60.0, Timer_ParseFinished, _, TIMER_FLAG_NO_MAPCHANGE);
}

public Action Timer_ParseFinished(Handle timer)
{
    CheckHibernation(true);
    return Plugin_Continue;
}

public void ParseWeapons(JSONArray array)
{
    g_iWeaponCount = array.Length;
    JSONObject jItem;
    char szWeaponClassname[48];
    char szWeaponDisplayName[64];
    char szWeaponViewModel[PLATFORM_MAX_PATH];
    char szWeaponWorldModel[PLATFORM_MAX_PATH];
    char szPosTemp[12];
    char szWepDefIndex[12];
    int iSkinDefIndex;
    int iWepDefIndex;
    bool bHasRareInspect;
    bool bHasRareDraw;
    int iRareInspect;
    int iRareDraw;
    int iTeam;
    int iSlot;
    int iClipAmmo;
    int iStickerSlotsCount;
    int iReserveAmmo;
    int iMaxPlayerSpeed;
    int iPrice;
    int iDamage;
    int iFullAuto;

    float fCycleTime;
    float fSpread;
 
    for(int iWeaponNum = 0; iWeaponNum < array.Length; iWeaponNum++)
    {
        iSkinDefIndex = 0;
        iWepDefIndex = 0;
        iTeam = 0;
        bHasRareInspect = false;
        bHasRareDraw = false;
        iRareInspect = -1;
        iRareDraw = -1;
        iSlot = -1;
        iClipAmmo = -1;
        iReserveAmmo = -1;
        iMaxPlayerSpeed = -1;
        iPrice = -1;
        iDamage = -1;
        iFullAuto = 0;
        iStickerSlotsCount = 0;
        fCycleTime = 0.0;
        fSpread = 0.0;
 
        jItem = view_as<JSONObject>(array.Get(iWeaponNum));
        iWepDefIndex = jItem.GetInt("def_index");
        iTeam = jItem.GetInt("team");

        if(jItem.HasKey("slot"))
        {
            iSlot = jItem.GetInt("slot");
        }
        
        bHasRareInspect = jItem.GetBool("has_rare_inspect");
        bHasRareDraw = jItem.GetBool("has_rare_draw");

        if(jItem.HasKey("rare_inspect"))
        {
            iRareInspect = jItem.GetInt("rare_inspect");
        }

        if(jItem.HasKey("rare_draw"))
        {
            iRareDraw = jItem.GetInt("rare_draw");
        }
        
        jItem.GetString("item_name", szWeaponDisplayName, sizeof(szWeaponDisplayName));
        jItem.GetString("class_name", szWeaponClassname, sizeof(szWeaponClassname));
        jItem.GetString("view_model", szWeaponViewModel, sizeof(szWeaponViewModel));
        jItem.GetString("world_model", szWeaponWorldModel, sizeof(szWeaponWorldModel));

        if(!jItem.IsNull("stickers_count"))
        {
            iStickerSlotsCount = jItem.GetInt("stickers_count");
        }

        IntToString(iWepDefIndex, szWepDefIndex, sizeof(szWepDefIndex));
    
        ArrayList arWeaponPaints = new ArrayList();
        if(jItem.HasKey("paints"))
        {
            JSONObject jPaintsObj = view_as<JSONObject>(jItem.Get("paints"));
            for(int iPos = 0; iPos < jPaintsObj.Size; iPos++)
            {
                IntToString(iPos, szPosTemp, sizeof(szPosTemp));
                iSkinDefIndex = jPaintsObj.GetInt(szPosTemp);
                arWeaponPaints.Push(iSkinDefIndex);
            }
            g_smWeaponPaints.SetValue(szWepDefIndex, arWeaponPaints);
            delete jPaintsObj;
        }

        if(jItem.HasKey("attributes"))
        {
            JSONObject jAttributesObj = view_as<JSONObject>(jItem.Get("attributes"));
            
            if(jAttributesObj.HasKey("primary_clip_size"))
            {
                iClipAmmo = jAttributesObj.GetInt("primary_clip_size");
            }

            if(jAttributesObj.HasKey("primary_reserve_ammo_max"))
            {
                iReserveAmmo = jAttributesObj.GetInt("primary_reserve_ammo_max");
            }

            if(jAttributesObj.HasKey("max_player_speed"))
            {
                iMaxPlayerSpeed = jAttributesObj.GetInt("max_player_speed");
            }

            if(jAttributesObj.HasKey("in_game_price"))
            {
                iPrice = jAttributesObj.GetInt("in_game_price");
            }

            if(jAttributesObj.HasKey("damage"))
            {
                iDamage = jAttributesObj.GetInt("damage");
            }

            if(jAttributesObj.HasKey("is_full_auto"))
            {
                iFullAuto = jAttributesObj.GetInt("is_full_auto");
            }

            if(jAttributesObj.HasKey("cycletime"))
            {
                fCycleTime = jAttributesObj.GetFloat("cycletime");
            }

            if(jAttributesObj.HasKey("spread"))
            {
                fSpread = jAttributesObj.GetFloat("spread");
            }




            delete jAttributesObj;
        }

        delete jItem;

        eWeaponInfo WeaponInfo;

        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.ClassName,       sizeof(eWeaponInfo::ClassName),     szWeaponClassname);
        strcopy(WeaponInfo.ViewModel,       sizeof(eWeaponInfo::ViewModel),     szWeaponViewModel);
        strcopy(WeaponInfo.WorldModel,      sizeof(eWeaponInfo::WorldModel),    szWeaponWorldModel);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);
        strcopy(WeaponInfo.DisplayName,     sizeof(eWeaponInfo::DisplayName),   szWeaponDisplayName);

        WeaponInfo.WeaponNum            = iWeaponNum;
        WeaponInfo.Paints               = arWeaponPaints;
        WeaponInfo.Team                 = iTeam;
        WeaponInfo.Slot                 = iSlot;
        WeaponInfo.ClipAmmo             = iClipAmmo;
        WeaponInfo.ReserveAmmo          = iReserveAmmo;
        WeaponInfo.MaxPlayerSpeed       = iMaxPlayerSpeed;
        WeaponInfo.Price                = iPrice;
        WeaponInfo.Damage               = iDamage;
        WeaponInfo.StickerSlotsCount    = iStickerSlotsCount;
        WeaponInfo.FullAuto             = iFullAuto;
        WeaponInfo.CycleTime            = fCycleTime;
        WeaponInfo.Spread               = fSpread;
        WeaponInfo.HasRareInspect       = bHasRareInspect;
        WeaponInfo.HasRareDraw          = bHasRareDraw;
        WeaponInfo.RareInspect          = iRareInspect;
        WeaponInfo.RareDraw             = iRareDraw;

        g_smWeaponInfo.SetArray(szWepDefIndex, WeaponInfo, sizeof(eWeaponInfo));
        g_arWeaponsNum.Push(iWepDefIndex);
    }
    PrintToServer("%s %i weapons synced successfully!", TAG_NCLR, array.Length);
}

public void ParsePaints(JSONArray array)
{

    g_iPaintsCount = array.Length;
    JSONObject jItem;
    int iDefIndex = 0;
    char szDisplayName[64];
    char szDisplayNameExtra[32];
    char szSkinDef[12];
    char szRarityName[48];
    char szWearRemapMin[12];
    char szWearRemapMax[12];

    for(int iSkinNum = 0; iSkinNum < array.Length; iSkinNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iSkinNum));

        JSONObject jRarity = view_as<JSONObject>(jItem.Get("rarity"));

        jRarity.GetString("name", szRarityName, sizeof(szRarityName));
        
        JSONObject jWearRemap = view_as<JSONObject>(jItem.Get("wear_remap"));
        jWearRemap.GetString("min", szWearRemapMin, sizeof(szWearRemapMin));
        jWearRemap.GetString("max", szWearRemapMax, sizeof(szWearRemapMax));

        iDefIndex = jItem.GetInt("def_index");
        g_arSkinsNum.Push(iDefIndex);

        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        
        if(jItem.HasKey("item_name_extra"))
        {
            jItem.GetString("item_name_extra", szDisplayNameExtra, sizeof(szDisplayNameExtra));
            FormatEx(szDisplayName, sizeof(szDisplayName), "%s %s", szDisplayName, szDisplayNameExtra);
        }

        IntToString(iDefIndex, szSkinDef, sizeof(szSkinDef));

        eSkinInfo SkinInfo;
        SkinInfo.SkinNum = iSkinNum;
        SkinInfo.SkinRarity = jRarity.GetInt("id");
        strcopy(SkinInfo.DisplayName, sizeof(eSkinInfo::DisplayName), szDisplayName);
        strcopy(SkinInfo.RarityName, sizeof(eSkinInfo::RarityName), szRarityName);
        SkinInfo.GloveApplicable = false;
        SkinInfo.WearRemap.Min = StringToFloat(szWearRemapMin);
        SkinInfo.WearRemap.Max = StringToFloat(szWearRemapMax);
        g_smSkinInfo.SetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));

        delete jItem;
        delete jRarity;
        delete jWearRemap;
    }
    PrintToServer("%s %i paints synced successfully!", TAG_NCLR, array.Length);
}

public void ParseGloves(JSONArray array)
{

    g_iGlovesCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    int iSkinDefIndex;
    char szSkinDef[12];
    char szDisplayName[64];
    char szViewModel[PLATFORM_MAX_PATH];
    char szWorldModel[PLATFORM_MAX_PATH];
    char szGloveDef[12];
    char szPosTemp[12];

    for(int iGloveNum = 0; iGloveNum < array.Length; iGloveNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iGloveNum));

        iDefIndex = jItem.GetInt("def_index");
        g_arGlovesNum.Push(iDefIndex);

        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        jItem.GetString("view_model", szViewModel, sizeof(szViewModel));
        jItem.GetString("world_model", szWorldModel, sizeof(szWorldModel));

        IntToString(iDefIndex, szGloveDef, sizeof(szGloveDef));

        ArrayList arGlovePaints = new ArrayList();
        if(jItem.HasKey("paints"))
        {
            JSONObject jPaintsObj = view_as<JSONObject>(jItem.Get("paints"));
            for(int iPos = 0; iPos < jPaintsObj.Size; iPos++)
            {
                IntToString(iPos, szPosTemp, sizeof(szPosTemp));
                iSkinDefIndex = jPaintsObj.GetInt(szPosTemp);
                IntToString(iSkinDefIndex, szSkinDef, sizeof(szSkinDef));
                eSkinInfo SkinInfo;
                g_smSkinInfo.GetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));
                SkinInfo.GloveApplicable = true;
                g_smSkinInfo.SetArray(szSkinDef, SkinInfo, sizeof(eSkinInfo));
                arGlovePaints.Push(iSkinDefIndex);
            }
            g_smGlovePaints.SetValue(szGloveDef, arGlovePaints);
            delete jPaintsObj;
        }

        eGlovesInfo GloveInfo;
        GloveInfo.GloveNum = iGloveNum;
        strcopy(GloveInfo.DisplayName, sizeof(eGlovesInfo::DisplayName), szDisplayName);
        strcopy(GloveInfo.ViewModel, sizeof(eGlovesInfo::ViewModel), szViewModel);
        strcopy(GloveInfo.WorldModel, sizeof(eGlovesInfo::WorldModel), szWorldModel);
        GloveInfo.Paints = arGlovePaints;

        g_smGloveInfo.SetArray(szGloveDef, GloveInfo, sizeof(eGlovesInfo));

        delete jItem;
    }
    PrintToServer("%s %i gloves synced successfully!", TAG_NCLR, array.Length);
}

public void ParseMusicKits(JSONArray array)
{

    g_iMusicKitsCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    char szDisplayName[64];
    char szMusicKitDefIndex[12];

    for(int iMusicKitNum = 0; iMusicKitNum < array.Length; iMusicKitNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iMusicKitNum));

        iDefIndex = jItem.GetInt("def_index");
        g_arMusicKitsNum.Push(iDefIndex);
        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));

        IntToString(iDefIndex, szMusicKitDefIndex, sizeof(szMusicKitDefIndex));

        eMusicKitsInfo MusicKitsInfo;
        MusicKitsInfo.MusicKitNum = iMusicKitNum;
        strcopy(MusicKitsInfo.DisplayName, sizeof(eMusicKitsInfo::DisplayName), szDisplayName);

        g_smMusicKitInfo.SetArray(szMusicKitDefIndex, MusicKitsInfo, sizeof(eMusicKitsInfo));

        delete jItem;
    }
    PrintToServer("%s %i music kits synced successfully!", TAG_NCLR, array.Length);
}

public void ParsePins(JSONArray array)
{

    g_iPinsCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    char szDisplayName[64];
    char szPinKitDefIndex[12];

    for(int iPinNum = 0; iPinNum < array.Length; iPinNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iPinNum));

        iDefIndex = jItem.GetInt("def_index");
        g_arPinsNum.Push(iDefIndex);
        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));

        IntToString(iDefIndex, szPinKitDefIndex, sizeof(szPinKitDefIndex));

        ePinInfo PinInfo;
        PinInfo.PinNum = iPinNum;
        strcopy(PinInfo.DisplayName, sizeof(ePinInfo::DisplayName), szDisplayName);

        g_smPinInfo.SetArray(szPinKitDefIndex, PinInfo, sizeof(ePinInfo));

        delete jItem;
    }
    PrintToServer("%s %i pins synced successfully!", TAG_NCLR, array.Length);
}

public void ParseCoins(JSONObject array)
{
    JSONArray jCategories   = view_as<JSONArray>(array.Get("categories"));
    JSONArray jCoins        = view_as<JSONArray>(array.Get("items"));

    g_iCoinsSetsCount = jCategories.Length;
    g_iCoinsCount = jCoins.Length;

    int iID;
    char szDisplayName[64];
    char szCoinIndex[12];
    char szCoinSetIndex[12];
    for(int iCoinSet = 0; iCoinSet < g_iCoinsSetsCount; iCoinSet++)
    {
        JSONObject jSet = view_as<JSONObject>(jCategories.Get(iCoinSet));

        iID = jSet.GetInt("id");
        jSet.GetString("name", szDisplayName, sizeof(szDisplayName));
        IntToString(iID, szCoinSetIndex, sizeof(szCoinSetIndex));
        JSONObject jItems = view_as<JSONObject>(jSet.Get("items"));

        ArrayList arCoins = new ArrayList();

        for(int iItems = 0; iItems < jItems.Size; iItems++)
        {
            IntToString(iItems, szCoinIndex, sizeof(szCoinIndex));

            int iCoinDefIndex = jItems.GetInt(szCoinIndex);
            arCoins.Push(iCoinDefIndex);
        }


        g_arCoinsSetsNum.Push(iID);

        eCoinsSets CoinsSets;
        CoinsSets.CoinSetNum = iCoinSet;
        strcopy(CoinsSets.DisplayName, sizeof(eCoinsSets::DisplayName), szDisplayName);
        CoinsSets.Coins = arCoins;

        g_smCoinsSets.SetArray(szCoinSetIndex, CoinsSets, sizeof(eCoinsSets));
        
        delete jItems;
        delete jSet;
    }

    for(int iCoinNum = 0; iCoinNum < g_iCoinsCount; iCoinNum++)
    {
        JSONObject jCoin = view_as<JSONObject>(jCoins.Get(iCoinNum));

        iID = jCoin.GetInt("def_index");
        IntToString(iID, szCoinIndex, sizeof(szCoinIndex));

        g_arCoinsNum.Push(iID);
        jCoin.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        eCoinInfo CoinInfo;
        CoinInfo.CoinNum = iCoinNum;
        strcopy(CoinInfo.DisplayName, sizeof(eCoinInfo::DisplayName), szDisplayName);

        g_smCoinsInfo.SetArray(szCoinIndex, CoinInfo, sizeof(eCoinInfo));
        delete jCoin;
    }

    delete jCategories;
    delete jCoins;

    PrintToServer("%s %i coins (in %i sets) synced successfully!", TAG_NCLR, g_iCoinsCount, g_iCoinsSetsCount);
}

public void ParseStickers(JSONObject array)
{
    JSONArray jCategories   = view_as<JSONArray>(array.Get("categories"));
    JSONArray jStickers     = view_as<JSONArray>(array.Get("items"));

    g_iStickersSetsCount = jCategories.Length;
    g_iStickersCount = jStickers.Length;

    int iID;
    char szDisplayName[64];
    char szStickerIndex[12];
    char szStickerSetIndex[12];
    for(int iStickerSet = 0; iStickerSet < g_iStickersSetsCount; iStickerSet++)
    {
        JSONObject jSet = view_as<JSONObject>(jCategories.Get(iStickerSet));

        iID = jSet.GetInt("id");
        jSet.GetString("name", szDisplayName, sizeof(szDisplayName));
        IntToString(iID, szStickerSetIndex, sizeof(szStickerSetIndex));
        JSONObject jItems = view_as<JSONObject>(jSet.Get("items"));

        ArrayList arStickers = new ArrayList();

        for(int iItems = 0; iItems < jItems.Size; iItems++)
        {
            IntToString(iItems, szStickerIndex, sizeof(szStickerIndex));
            
            int iStickerDefIndex = jItems.GetInt(szStickerIndex);
            arStickers.Push(iStickerDefIndex);
        }


        g_arStickersSetsNum.Push(iID);

        eStickersSets StickersSets;
        StickersSets.StickerSetNum = iStickerSet;
        strcopy(StickersSets.DisplayName, sizeof(eStickersSets::DisplayName), szDisplayName);
        StickersSets.Stickers = arStickers;

        g_smStickersSets.SetArray(szStickerSetIndex, StickersSets, sizeof(eStickersSets));
        
        delete jItems;
        delete jSet;
    }

    for(int iStickerNum = 0; iStickerNum < g_iStickersCount; iStickerNum++)
    {
        JSONObject jSticker = view_as<JSONObject>(jStickers.Get(iStickerNum));

        iID = jSticker.GetInt("def_index");
        IntToString(iID, szStickerIndex, sizeof(szStickerIndex));

        g_arStickersNum.Push(iID);
        jSticker.GetString("item_name", szDisplayName, sizeof(szDisplayName));

        eStickerInfo StickerInfo;
        StickerInfo.StickerNum = iStickerNum;
        strcopy(StickerInfo.DisplayName, sizeof(eStickerInfo::DisplayName), szDisplayName);
        g_smStickersInfo.SetArray(szStickerIndex, StickerInfo, sizeof(eStickerInfo));

        for(int x = 0; x < g_iStickersSetsCount; x++)
        {
            int iStickerSetId = GetStickerSetIdByStickerSetNum(x);
            char szStickerSetId[12];
            IntToString(iStickerSetId, szStickerSetId, sizeof(szStickerSetId));

            eStickersSets StickersSets;
            g_smStickersSets.GetArray(szStickerSetId, StickersSets, sizeof(eStickersSets));

            ArrayList arStickers = StickersSets.Stickers;
            int iFound;
            if((iFound = arStickers.FindValue(iID) != -1) >= 0)
            {
                g_bIsStickerInSet[x][iStickerNum] = view_as<bool>(iFound);
            }
        }

        delete jSticker;
    }

    delete jCategories;
    delete jStickers;

    PrintToServer("%s %i stickers (in %i sets) synced successfully!", TAG_NCLR, g_iStickersCount, g_iStickersSetsCount);
}

public void ParseAgents(JSONArray array)
{
    g_iAgentsCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    int iTeam = 0;
    char szDisplayName[64];
    char szPlayerModel[PLATFORM_MAX_PATH];
    char szAgentDefIndex[12];
    char szVOPrefix[64];

    for(int iAgentNum = 0; iAgentNum < array.Length; iAgentNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iAgentNum));
        iDefIndex = jItem.GetInt("def_index");
        iTeam = jItem.GetInt("team");
        g_arAgentsNum.Push(iDefIndex);
        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        jItem.GetString("player_model", szPlayerModel, sizeof(szPlayerModel));

        if (jItem.HasKey("vo_prefix"))
        {
            jItem.GetString("vo_prefix", szVOPrefix, sizeof(szVOPrefix));
        }
        else
        {
            szVOPrefix = "";
        }

        IntToString(iDefIndex, szAgentDefIndex, sizeof(szAgentDefIndex));

        eAgentInfo AgentInfo;
        AgentInfo.AgentNum = iAgentNum;
        AgentInfo.Team = iTeam;

        strcopy(AgentInfo.DisplayName, sizeof(eAgentInfo::DisplayName), szDisplayName);
        strcopy(AgentInfo.PlayerModel, sizeof(eAgentInfo::PlayerModel), szPlayerModel);
        strcopy(AgentInfo.VOPrefix, sizeof(eAgentInfo::VOPrefix), szVOPrefix);

        g_smAgentsInfo.SetArray(szAgentDefIndex, AgentInfo, sizeof(eAgentInfo));

        delete jItem;
    }
    PrintToServer("%s %i agents synced successfully!", TAG_NCLR, array.Length);
}

public void ParsePatches(JSONArray array)
{
    g_iPatchesCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    char szDisplayName[64];
    char szPatchDefIndex[12];

    for(int iPatchNum = 0; iPatchNum < array.Length; iPatchNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iPatchNum));
        iDefIndex = jItem.GetInt("def_index");
        g_arPatchesNum.Push(iDefIndex);
        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));

        IntToString(iDefIndex, szPatchDefIndex, sizeof(szPatchDefIndex));

        ePatchInfo PatchInfo;
        PatchInfo.PatchNum = iPatchNum;

        strcopy(PatchInfo.DisplayName, sizeof(ePatchInfo::DisplayName), szDisplayName);
        g_smPatchesInfo.SetArray(szPatchDefIndex, PatchInfo, sizeof(ePatchInfo));

        delete jItem;
    }
    PrintToServer("%s %i patches synced successfully!", TAG_NCLR, array.Length);
}

public void ParseCrates(JSONArray array)
{
    g_iCratesCount = array.Length;
    JSONObject jItem;

    int iDefIndex = 0;
    char szDisplayName[64];
    char szCrateDefIndex[12];
    char szWorldModel[PLATFORM_MAX_PATH];

    for(int iCrateNum = 0; iCrateNum < array.Length; iCrateNum++)
    {
        jItem = view_as<JSONObject>(array.Get(iCrateNum));
        iDefIndex = jItem.GetInt("def_index");
        g_arCratesNum.Push(iDefIndex);
        jItem.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        jItem.GetString("view_model", szWorldModel, sizeof(szWorldModel));
        IntToString(iDefIndex, szCrateDefIndex, sizeof(szCrateDefIndex));

        JSONArray jItems = view_as<JSONArray>(jItem.Get("items"));

        ArrayList arCrateItems = new ArrayList(sizeof(eItems_CrateItem));
        for(int iItemNum = 0; iItemNum < jItems.Length; iItemNum++)
        {
            JSONObject jCrateItem = view_as<JSONObject>(jItems.Get(iItemNum));
            int iWeaponDefIndex = jCrateItem.GetInt("weapon_def_index");
            int iSkinDefIndex = jCrateItem.GetInt("paint_def_index");

            eItems_CrateItem CrateItem;
            CrateItem.WeaponDefIndex = iWeaponDefIndex;
            CrateItem.SkinDefIndex = iSkinDefIndex;

            arCrateItems.PushArray(CrateItem);
            delete jCrateItem;
        }

        eCrateInfo CrateInfo;
        CrateInfo.CrateNum = iCrateNum;
        CrateInfo.ItemsCount = jItems.Length;
        CrateInfo.Items = arCrateItems;

        strcopy(CrateInfo.DisplayName, sizeof(eCrateInfo::DisplayName), szDisplayName);
        strcopy(CrateInfo.WorldModel, sizeof(eCrateInfo::WorldModel), szWorldModel);
        g_smCratesInfo.SetArray(szCrateDefIndex, CrateInfo, sizeof(eCrateInfo));

        delete jItems;
        delete jItem;
    }
    PrintToServer("%s %i crates synced successfully!", TAG_NCLR, array.Length);
}

public void ParseSprays(JSONObject array)
{
    JSONArray jCategories   = view_as<JSONArray>(array.Get("categories"));
    JSONArray jSprays    = view_as<JSONArray>(array.Get("items"));

    g_iSpraysSetsCount = jCategories.Length;
    g_iSpraysCount = jSprays.Length;

    int iID;
    int iDefIndex = 0;
    char szDisplayName[64];
    char szSprayIndex[12];
    char szSpraySetIndex[12];
    char szMaterialPath[PLATFORM_MAX_PATH];
    char szSprayDefIndex[12];
    for(int iSpraySet = 0; iSpraySet < g_iSpraysSetsCount; iSpraySet++)
    {
        JSONObject jSet = view_as<JSONObject>(jCategories.Get(iSpraySet));

        iID = jSet.GetInt("id");
        jSet.GetString("name", szDisplayName, sizeof(szDisplayName));
        IntToString(iID, szSpraySetIndex, sizeof(szSpraySetIndex));
        JSONObject jItems = view_as<JSONObject>(jSet.Get("items"));

        ArrayList arSprays = new ArrayList();

        for(int iItems = 0; iItems < jItems.Size; iItems++)
        {
            IntToString(iItems, szSprayIndex, sizeof(szSprayIndex));
            
            int iSprayDefIndex = jItems.GetInt(szSprayIndex);
            arSprays.Push(iSprayDefIndex);
        }

        g_arSpraysSetsNum.Push(iID);

        eSpraysSets SpraysSets;
        SpraysSets.SpraySetNum = iSpraySet;
        strcopy(SpraysSets.DisplayName, sizeof(eSpraysSets::DisplayName), szDisplayName);
        SpraysSets.Sprays = arSprays;

        g_smSpraysSets.SetArray(szSpraySetIndex, SpraysSets, sizeof(eSpraysSets));
        
        delete jItems;
        delete jSet;
    }

    for(int iSprayNum = 0; iSprayNum < g_iSpraysCount; iSprayNum++)
    {   
        JSONObject jSpray = view_as<JSONObject>(jSprays.Get(iSprayNum));
        iDefIndex = jSpray.GetInt("def_index");
        g_arSpraysNum.Push(iDefIndex);
        jSpray.GetString("item_name", szDisplayName, sizeof(szDisplayName));
        jSpray.GetString("material", szMaterialPath, sizeof(szMaterialPath));

        Format(szMaterialPath, sizeof(szMaterialPath), "decals/eitems/sprays/%s", szMaterialPath);

        IntToString(iDefIndex, szSprayDefIndex, sizeof(szSprayDefIndex));

        eSprayInfo SprayInfo;
        SprayInfo.SprayNum = iSprayNum;

        strcopy(SprayInfo.DisplayName, sizeof(eSprayInfo::DisplayName), szDisplayName);
        strcopy(SprayInfo.MaterialPath, sizeof(eSprayInfo::MaterialPath), szMaterialPath);

        g_smSpraysInfo.SetArray(szSprayDefIndex, SprayInfo, sizeof(eSprayInfo));

        for(int x = 0; x < g_iSpraysSetsCount; x++)
        {
            int iSpraySetId = GetSpraySetIdBySpraySetNum(x);
            char szSpraySetId[12];
            IntToString(iSpraySetId, szSpraySetId, sizeof(szSpraySetId));

            eSpraysSets SpraysSets;
            g_smSpraysSets.GetArray(szSpraySetId, SpraysSets, sizeof(eSpraysSets));

            ArrayList arSprays = SpraysSets.Sprays;
            int iFound;
            if((iFound = arSprays.FindValue(iDefIndex) != -1) >= 0)
            {
                g_bIsSprayInSet[x][iSprayNum] = view_as<bool>(iFound);
            }
        }

        delete jSpray;
    }

    delete jCategories;
    delete jSprays;
    PrintToServer("%s %i sprays (in %i sets) synced successfully!", TAG_NCLR, g_iSpraysCount, g_iSpraysSetsCount);
}