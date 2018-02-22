-- Global Chat --
RegisterCommand("g", function(source, args, string)
    local src = source
    local rank = PlayerTable.Functions.GetPlayerRank(src)
    local name = Characters.Functions.GetPlayerName(src)
    local message = table.concat(args, " ")
    TriggerClientEvent("chatMessage", -1, tostring("^3[GLOBAL] " .. "^1[" .. rank .. "]" .. " ^5" .. name .. ": ^0" .. message))
end, false)

-- Handsup Command --
RegisterCommand("hu", function(source, args, string)
    local src = source
    TriggerClientEvent("XRPLife:Handsup", src)
end, false)