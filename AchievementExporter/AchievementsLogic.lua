AchievementsLogic = {}

function AchievementsLogic.GetAchievementsByCategory()
    local categories = {}

    local function handleAchievement(id)
        local name, description, points, _, completed, date, _  = GetAchievementInfo(id)
        if name then
            return {
                type = "achievement",
                id = id,
                name = name,
                description = description,
                points = points,
                completed = completed,
                date = date,
                children = {}
            }
        end
        return nil
    end

    -- Go through each category
    for ci = 1, GetNumAchievementCategories() do
        local categoryName, subcategoryCount, achievementCount = GetAchievementCategoryInfo(ci)
        local category = {
            type = "category",
            name = categoryName,
            children = {}
        }

        -- Handle achievements nested directly under a category.
        for ai = 1, achievementCount do
            local id = GetAchievementId(ci, nil, ai)
            local achievement = handleAchievement(id)
            if achievement then
                table.insert(category.children, achievement)
            end
        end

        -- Go through each subcategory within the category
        for si = 1, subcategoryCount do
            local subcategoryName, achievementCount = GetAchievementSubCategoryInfo(ci, si)
            local subcategory = {
                type = "subcategory",
                name = subcategoryName,
                children = {}
            }

            for ai = 1, achievementCount do
                -- Handle achievements nested under a subcategory.
                local id = GetAchievementId(ci, si, ai)
                local achievement = handleAchievement(id)
                if achievement then
                    table.insert(subcategory.children, achievement)
                end
            end

            -- If subcategory has achievements, add it to the category's children
            if #subcategory.children > 0 then
                table.insert(category.children, subcategory)
            end
        end

        -- If category has children (either achievements or subcategories), add it to the result
        if #category.children > 0 then
            table.insert(categories, category)
        end
    end

    return categories
end