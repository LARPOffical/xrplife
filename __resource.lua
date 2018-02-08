--[[ Gametype Name ]]--
resource_type 'gametype' { name = 'XRPLife' }

--[[ Resource Manifest ]]--
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

--[[ Dependencies ]]--
dependencies {
    "mysql-async",
    "InteractSound"
}

--[[ MySQL ]]--
server_script "@mysql-async/lib/MySQL.lua"
server_script "database/player.lua"
server_script "database/character.lua"

--[[ Lib Files ]]--
server_script "lib/server_helpers.lua"
client_script "lib/client_helpers.lua"

--[[ Config Files ]]--
server_script "config/base.lua"
server_script "config/community_ranks.lua"
server_script "config/clothing.lua"
server_script "config/items.lua"

-- [[ Table Files ]]--
server_script "tables/characters.lua"
server_script "tables/jobs.lua"
server_script "tables/players.lua"

--[[ Interface Files ]]--
ui_page("interface/index.html")
files {
    "interface/index.html",
    "interface/css/character_menu.css",
    "interface/css/inventory.css",
    "interface/js/inbound.js",
    "interface/js/character_menu.js",
    "interface/js/inventory.js",
    "interface/js/notification.js"
}

--[[ Interace Lua Scripts ]]--
-- Character Menu
server_script "interface/lua/character_menu/server.lua"
client_script "interface/lua/character_menu/client.lua"
-- Notifications
client_script "interface/lua/notification/client.lua"
-- Inventory
server_script "interface/lua/inventory/server.lua"
client_script "interface/lua/inventory/client.lua"
client_script "interface/lua/inventory/item_functions/handcuffs.lua"

--[[ Module Files ]]--
-- Player Spawning --
server_script "modules/player_spawning/server.lua"
client_script "modules/player_spawning/client.lua"

-- Chat Handler --
server_script "modules/chat_handler/server.lua"
client_script "modules/chat_handler/client.lua"

--[[ Server Scripts ]]--
server_script "init.lua"

--[[ Client Scripts ]]--
client_script "base.lua"

