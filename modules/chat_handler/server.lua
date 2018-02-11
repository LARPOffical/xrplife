--[[
    ^0 is White
    ^1 is Red (#ff4444)
    ^2 is Green/Lime (#99cc00)
    ^3 is Orange (#ffbb33)
    ^4 is Blue (#0099cc)
    ^5 is Light Blue (#33b5e5)
    ^6 is Purple (#aa66cc)
    ^7 is White
--]]

--[[ LOCAL CHAT HANDLER ]]--

AddEventHandler("chatMessage", function(source, name, message)
    CancelEvent()
    local src = source
    local rank = PlayerTable.Functions.GetPlayerRank(src)
    local name = Characters.Functions.GetPlayerName(src)
    local distance = BaseConfig.LocalMessageDistance
    local players = GetPlayers()

    for a = 1, #players do
        local targetplayer = tonumber(players[a])
        if targetplayer ~= src then
            TriggerClientEvent("XRPLife:SendLocalMessage", targetplayer, distance, {id = src, name = name, rank = rank, message = message})
        else
            TriggerClientEvent("chatMessage", src, tostring("^3[LOCAL] " .. "^1[" .. rank .. "]" .. " ^5" .. name .. ": ^0" .. message))
        end
    end
end)

--]]

--[[ GLOBAL CHAT HANDLER ]]--

RegisterCommand("g", function(source, args, string)
    local src = source
    local rank = PlayerTable.Functions.GetPlayerRank(src)
    local name = Characters.Functions.GetPlayerName(src)
    local message = table.concat(args, " ")

    TriggerClientEvent("chatMessage", -1, tostring("^3[GLOBAL] " .. "^1[" .. rank .. "]" .. " ^5" .. name .. ": ^0" .. message))
end, false)

--]]

--[[ Testing Commands ]]--
RegisterCommand("setjob", function(source, args, string)
    local src = source
    local job = tostring(table.concat(args, " "))
    CharacterJobs.Functions.SetPlayerJob(src, job)
end, false)