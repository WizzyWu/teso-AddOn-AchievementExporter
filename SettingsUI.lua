SettingsUI = {}

local function ExportAchievements()
    local achievements = AchievementsLogic.GetAchievementsByCategory()
    FileSaver.SaveToFile(achievements)
end

function SettingsUI.Initialize()
    local panelData = {
        type = "panel",
        name = "Achievement Exporter",
        displayName = "Achievement Exporter Settings",
        author = "@WizzyWu",
        version = "0.1",
    }

    local optionsTable = {
        {
            type = "button",
            name = "Export Achievements",
            tooltip = "Export all your achievements to JSON format",
            func = ExportAchievements  -- Using the function here
        },
    }

    LibAddonMenu2:RegisterAddonPanel("AchievementExporterOptions", panelData)
    LibAddonMenu2:RegisterOptionControls("AchievementExporterOptions", optionsTable)
end