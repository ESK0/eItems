ConVar g_cvHibernationWhenEmpty;
int g_iHibernateWhenEmpty = 0;

HTTPRequest httpRequest;

enum struct eWearRemap
{
    float Min;
    float Max;
}

enum struct eSkinInfo
{
    int SkinNum;
    char DisplayName[64];
    bool GloveApplicable;
    int SkinRarity;
    char RarityName[48];
    eWearRemap WearRemap;
}

enum struct eGlovesInfo
{
    int GloveNum;
    char DisplayName[64];
    char ViewModel[PLATFORM_MAX_PATH];
    char WorldModel[PLATFORM_MAX_PATH];
    ArrayList Paints;
}

enum struct eMusicKitsInfo
{
    int MusicKitNum;
    char DisplayName[64];
}

enum struct ePinInfo
{
    int PinNum;
    char DisplayName[64];
}


enum struct eCoinsSets
{
    int CoinSetNum;
    char DisplayName[64];
    ArrayList Coins;
}

enum struct eCoinInfo
{
    int CoinNum;
    char DisplayName[64];
}

enum struct eStickersSets
{
    int StickerSetNum;
    char DisplayName[64];
    ArrayList Stickers;
}

enum struct eStickerInfo
{
    int StickerNum;
    char DisplayName[64];
}

enum struct eAgentInfo
{
    int AgentNum;
    int Team;
    char DisplayName[64];
    char PlayerModel[PLATFORM_MAX_PATH];
}

enum struct ePatchInfo
{
    int PatchNum;
    char DisplayName[64];
}

enum struct eCrateInfo
{
    int CrateNum;
    int ItemsCount;
    ArrayList Items;
    char DisplayName[64];  
    char WorldModel[PLATFORM_MAX_PATH];
}

enum struct eCrateItem
{
    int WeaponDefIndex;
    int SkinDefIndex;
}

enum struct eWeaponInfo
{
    int WeaponNum;
    char DisplayName[64];
    char ClassName[48];
    char ViewModel[PLATFORM_MAX_PATH];
    char WorldModel[PLATFORM_MAX_PATH];
    ArrayList Paints;
    int Team;
    int Slot;
    int ClipAmmo;
    int StickerSlotsCount;
    int ReserveAmmo;
    int MaxPlayerSpeed;
    int Price;
    float CycleTime;
    float Spread;
    int Damage;
    int FullAuto;
    bool HasRareInspect;
    bool HasRareDraw;
    int RareInspect;
    int RareDraw;
}

enum struct eClientInfo
{
    bool GivingWeapon;

    bool Reset()
    {
        this.GivingWeapon = false;
    }  
}

eClientInfo ClientInfo[MAXPLAYERS + 1];

StringMap g_smSkinInfo = null;
ArrayList g_arSkinsNum = null;

StringMap g_smWeaponPaints = null;
StringMap g_smWeaponInfo = null;
ArrayList g_arWeaponsNum = null;

StringMap g_smGlovePaints = null;
StringMap g_smGloveInfo = null;
ArrayList g_arGlovesNum = null;

ArrayList g_arMusicKitsNum = null;
StringMap g_smMusicKitInfo = null;

ArrayList g_arPinsNum = null;
StringMap g_smPinInfo = null;

ArrayList g_arCoinsSetsNum = null;
ArrayList g_arCoinsNum = null;
StringMap g_smCoinsSets = null;
StringMap g_smCoinsInfo = null;

ArrayList g_arStickersSetsNum = null;
ArrayList g_arStickersNum = null;
StringMap g_smStickersSets = null;
StringMap g_smStickersInfo = null;

ArrayList g_arAgentsNum = null;
StringMap g_smAgentsInfo = null;

ArrayList g_arPatchesNum = null;
StringMap g_smPatchesInfo = null;

ArrayList g_arCratesNum = null;
StringMap g_smCratesInfo = null;

float g_fStart;

int g_iWeaponCount = 0;
int g_iPaintsCount = 0;
int g_iGlovesCount = 0;
int g_iMusicKitsCount = 0;
int g_iPinsCount = 0;
int g_iCoinsSetsCount = 0;
int g_iCoinsCount = 0;
int g_iStickersSetsCount = 0;
int g_iStickersCount = 0;
int g_iAgentsCount = 0;
int g_iPatchesCount = 0;
int g_iCratesCount = 0;

bool g_bItemsSynced = false;
bool g_bItemsSyncing = false;
bool g_bIsRoundEnd = false;


bool g_bIsStickerInSet[200][8000];


Handle g_hSwitchWeaponCall = null;

GlobalForward g_OnWeaponGiven;
GlobalForward g_OnItemsSynced;

char g_szConfigFilePath[PLATFORM_MAX_PATH];
char g_szLanguageCode[12];

int g_iAPIDownloadAttempt = 0;