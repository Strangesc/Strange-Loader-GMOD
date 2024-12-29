# Strange Loader [CORE Loader] 

## Description
Echo Loader is a lightweight and flexible LUA file loader for Garry's Mod. It automatically loads files from a specified folder and supports multiple interface languages: English, Russian, and French.

This script simplifies the organization and loading of modules in your projects, minimizing manual effort.

---

## Features
- **Automatic File Loading:** Recursively finds and loads LUA files from the specified folder.
- **Server and Client Compatibility:** Handles files appropriately for server and client environments (AddCSLuaFile and include).
- **Localization:** Console messages are displayed in the language matching the game's settings (supported: English, Russian, French).
- **Informative Output:** Lists all loaded files in the console.

---

## Installation

1. Download or clone this repository:
   ```bash
   git clone https://github.com/Strangesc/EchoLoader.git
   ```

2. Place the script in your addon directory or your module folder.

3. Ensure the files are organized as follows:
   ```
   addons/
   ├── myaddon/
       ├── lua/
           ├── module/
               ├── file1.lua
               └── subfolder/
                   └── file2.lua
       └── echo_loader.lua
   ```

4. Include `echo_loader.lua` in your project to automatically load files from the `module/` folder:
   ```lua
   include("echo_loader.lua")
   ```

---

## Usage

1. Place all your modules and scripts in the `lua/module/` folder of your addon.
2. Start your Garry's Mod server or client.
3. Echo Loader will automatically load all files from the specified folder and output the list of loaded files to the console.

Example console output:
```
[Echo Loader] All LUA files loaded successfully.
[Echo Loader] Loaded files:
module/file1.lua
module/subfolder/file2.lua
```

---

## Localization
Echo Loader supports multiple languages and automatically detects the game's language using the `gmod_language` console variable.

### Supported Languages:
- **English (en):**
  - "All LUA files loaded successfully."
  - "Loaded files:"
- **Русский (ru):**
  - "Все файлы LUA успешно загружены."
  - "Загруженные файлы:"
- **Français (fr):**
  - "Tous les fichiers LUA ont été chargés avec succès."
  - "Fichiers chargés :"

If the game's language is not supported, English is used by default.

---

## Adding a New Language
1. Open the `echo_loader.lua` script.
2. Locate the `translations` table.
3. Add a new language in the following format:
   ```lua
   translations["language_code"] = {
       all_files_loaded = "Your translation for \"All LUA files loaded successfully.\"",
       loaded_files = "Your translation for \"Loaded files:\""
   }
   ```
4. Save the changes. The new language will be automatically used if it matches the game's settings.

---

## Support and Feedback
If you have questions, issues, or suggestions, create an [Issue](https://github.com/Strangesc/EchoLoader/issues) in the repository or submit a Pull Request.

**Thank you for using Echo Loader!**


