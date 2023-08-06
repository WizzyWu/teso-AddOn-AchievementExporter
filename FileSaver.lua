FileSaver = {}

function FileSaver.SaveToFile(data)
    AchievementExporterSavedData.achievements = data
    d("Data has been saved to SavedVariables. Check `AchievementExporterSavedData` in `SavedVariables/AchievementExporter.lua` after logging out or reloading UI.")
end