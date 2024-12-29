--[[ 
-------------------------------------------
-- Created by StrangeSC                  --
-- https://github.com/Strangesc          --
-------------------------------------------
]] 

echo = echo or {}

local loadedFiles = {}

echo.colors = {
    brackets = Color(255, 255, 255),
    prefix = Color(250, 50, 46),
    module = Color(255, 255, 0),
    success = Color(0, 255, 0),
    reset = Color(255, 255, 255)
}

local translations = {
    en = {
        all_files_loaded = "All LUA files loaded successfully.",
        loaded_files = "Loaded files:"
    },
    ru = {
        all_files_loaded = "Все файлы LUA успешно загружены.",
        loaded_files = "Загруженные файлы:"
    },
    fr = {
        all_files_loaded = "Tous les fichiers LUA ont été chargés avec succès.",
        loaded_files = "Fichiers chargés :"
    }
}

local function echo_GetLanguage()
    local lang = GetConVar("gmod_language"):GetString()
    return translations[lang] and lang or "en"
end

local function echo_LoadFolder(folder)
    local files, folders = file.Find(folder .. "/*", "LUA")

    for _, fileName in ipairs(files) do
        local filePath = folder .. "/" .. fileName
        table.insert(loadedFiles, filePath)

        if SERVER then
            AddCSLuaFile(filePath)
            include(filePath)
        elseif CLIENT then
            include(filePath)
        end
    end

    for _, subFolder in ipairs(folders) do
        echo_LoadFolder(folder .. "/" .. subFolder)
    end
end

local function echo_LoadModules()
    local rootFolder = "module"
    local lang = echo_GetLanguage()

    echo_LoadFolder(rootFolder)

    MsgC(
        echo.colors.prefix, "[Strange Loader] ",
        echo.colors.success, translations[lang].all_files_loaded .. "\n"
    )
    MsgC(
        echo.colors.prefix, "[Strange Loader] ",
        echo.colors.module, translations[lang].loaded_files .. "\n"
    )

    for _, filePath in ipairs(loadedFiles) do
        MsgC(echo.colors.module, filePath .. "\n")
    end
end

echo_LoadModules()
