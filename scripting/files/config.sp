public void LoadConfig()
{
    KeyValues kvConfig = new KeyValues("eItems");

    if(!kvConfig.ImportFromFile(g_szConfigFilePath))
    {
        SetFailState("%s Unable to import config file!", TAG_NCLR);
        return;
    }

    kvConfig.GetString("Language", g_szLanguageCode, sizeof g_szLanguageCode, "en");    
    delete kvConfig;
}