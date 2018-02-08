RegisterNetEvent("XRPLife:SendLocalMessage")
AddEventHandler("XRPLife:SendLocalMessage", function(distance, senderdata) -- id - name - rank - message
    local LPly = GetPlayerPed(PlayerId())
    local LPlyCoords = GetEntityCoords(LPly, false)
    local OPly = GetPlayerPed(GetPlayerFromServerId(senderdata.id))
    local OPlyCoords = GetEntityCoords(OPly, false)
    local plyDistance = Vdist(LPlyCoords.x, LPlyCoords.y, LPlyCoords.z, OPlyCoords.x, OPlyCoords.y, OPlyCoords.z)

    if plyDistance <= distance then
        TriggerEvent("chatMessage", tostring("^3[LOCAL] " .. "^1[" .. senderdata.rank .. "]" .. " ^5" .. senderdata.name .. ": ^0" .. senderdata.message))
    end
end)