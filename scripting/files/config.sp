public void LoadConfig()
{
    if (!FileExists(g_szConfigFilePath))
    {
        SetFailState("%s Unable to import config file!", TAG_NCLR);
        return;
    }

    JSONObject jRoot = JSONObject.FromFile(g_szConfigFilePath);
    jRoot.GetString("Language", g_szLanguageCode, sizeof g_szLanguageCode);    
    g_bUseLocal = jRoot.GetBool("UseLocal");
    
    delete jRoot;
}