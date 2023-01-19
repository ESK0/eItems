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
    char VOPrefix[64];
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

enum struct eSpraysSets
{
    int SpraySetNum;
    char DisplayName[64];
    ArrayList Sprays;
}

enum struct eSprayInfo
{
    int SprayNum;
    char DisplayName[64];
    char MaterialPath[PLATFORM_MAX_PATH];
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

    void Reset()
    {
        this.GivingWeapon = false;
    }  
}

eClientInfo ClientInfo[MAXPLAYERS + 1];

StringMap g_smSkinInfo = null;          // SkinDefIndex:[SkinInfo]        (SkinDefIndex is a string, SkinInfo is a struct) ([]is always a arraylist)
ArrayList g_arSkinsNum = null;          // position is SkinNum, value is SkinDefIndex

StringMap g_smWeaponPaints = null;      // WeaponDefIndex:[PaintDefIndex]   (WeaponDefIndex is a string, PaintDefIndex is an int)
StringMap g_smWeaponInfo = null;        // WeaponDefIndex:[WeaponInfo]    (WeaponDefIndex is a string, WeaponInfo is a struct)
ArrayList g_arWeaponsNum = null;        // position is WeaponNum, value is WeaponDefIndex

StringMap g_smGlovePaints = null;       // GloveDefIndex:[PaintDefIndex]   (GloveDefIndex is a string, PaintDefIndex is an int)
StringMap g_smGloveInfo = null;         // GloveDefIndex:[GloveInfo]    (GloveDefIndex is a string, GloveInfo is a struct)
ArrayList g_arGlovesNum = null;         // position is GloveNum, value is GloveDefIndex

ArrayList g_arMusicKitsNum = null;      // position is MusicKitNum, value is MusicKitDefIndex
StringMap g_smMusicKitInfo = null;      // MusicKitDefIndex:[MusicKitInfo]    (MusicKitDefIndex is a string, MusicKitInfo is a struct)

ArrayList g_arPinsNum = null;           // position is PinNum, value is PinDefIndex
StringMap g_smPinInfo = null;           // PinDefIndex:[PinInfo]    (PinDefIndex is a string, PinInfo is a struct)

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

ArrayList g_arSpraysSetsNum = null;
ArrayList g_arSpraysNum = null;
StringMap g_smSpraysSets = null;
StringMap g_smSpraysInfo = null;

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
int g_iSpraysSetsCount = 0;
int g_iSpraysCount = 0;

bool g_bItemsSynced = false;
bool g_bItemsSyncing = false;
bool g_bIsRoundEnd = false;
bool g_bUseLocal = false;
bool g_bForceDisableHibernation = false;
bool g_bDownloadSprays = false;


bool g_bIsStickerInSet[200][8000];
bool g_bIsSprayInSet[200][1000];

Handle g_hSwitchWeaponCall = null;

GlobalForward g_OnWeaponGiven;
GlobalForward g_OnItemsSynced;

char g_szConfigFilePath[PLATFORM_MAX_PATH];
char g_szLanguageCode[12];

int g_iAPIDownloadAttempt = 0;