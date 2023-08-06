AchievementExporter = {}

-- Default data to initialize our saved variable if it's the user's first time running the addon
local defaultData = {
    achievements = ""
}

local function OnAddonLoaded(event, addonName)
    if addonName ~= "AchievementExporter" then return end

    -- Load saved variables
    AchievementExporterSavedData = AchievementExporterSavedData or defaultData

    -- Initialize other modules if needed
    SettingsUI.Initialize()


    EVENT_MANAGER:UnregisterForEvent("AchievementExporter", EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent("AchievementExporter", EVENT_ADD_ON_LOADED, OnAddonLoaded)