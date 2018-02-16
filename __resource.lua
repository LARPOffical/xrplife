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
server_script "config/jobs.lua"
server_script "config/police.lua"
server_script "config/blips.lua"

-- [[ Table Files ]]--
server_script "tables/characters.lua"
server_script "tables/jobs.lua"
server_script "tables/players.lua"

--[[ Interface Files ]]--
ui_page("interface/index.html")
files {
    -- UI PAGE
    "interface/index.html",

    -- CSS
    "interface/css/character_menu.css",
    "interface/css/inventory.css",
    "interface/css/player_interaction.css",
    "interface/css/license_template.css",
    "interface/css/leo_loadouts.css",

    -- JS
    "interface/js/inbound.js",
    "interface/js/character_menu.js",
    "interface/js/inventory.js",
    "interface/js/player_interaction.js",
    "interface/js/license_template.js",
    "interface/js/leo_loadouts.js",
    "interface/js/notification.js"
}

--[[ Extra Scripts ]]--
client_script "scripts/handcuffs.lua"
client_script "scripts/idrequest.lua"
client_script "scripts/handsup.lua"

--[[ Interace Lua Scripts ]]--
-- Character Menu
server_script "interface/lua/character_menu/server.lua"
client_script "interface/lua/character_menu/client.lua"
-- Notifications
client_script "interface/lua/notification/client.lua"
-- Inventory
server_script "interface/lua/inventory/server.lua"
client_script "interface/lua/inventory/client.lua"

-- Player Interaction
server_script "interface/lua/player_interaction/server.lua"
client_script "interface/lua/player_interaction/client.lua"
client_script "interface/lua/player_interaction/scripts/handcuffs.lua"
client_script "interface/lua/player_interaction/scripts/idrequest.lua"

--[[ Module Files ]]--
-- Player Spawning --
server_script "modules/player_spawning/server.lua"
client_script "modules/player_spawning/client.lua"

-- Chat Handler --
server_script "modules/chat_handler/server.lua"
server_script "modules/chat_handler/commands.lua"
client_script "modules/chat_handler/client.lua"

-- Job Paychecks --
server_script "modules/job_paychecks/server.lua"
client_script "modules/job_paychecks/client.lua"

-- Job Markers --
server_script "modules/job_markers/server.lua"
client_script "modules/job_markers/client.lua"

--[[ Server Scripts ]]--
server_script "init.lua"

--[[ Client Scripts ]]--
client_script "base.lua"

