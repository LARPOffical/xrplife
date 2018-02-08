RegisterNetEvent("XRPLife:Respawn")
AddEventHandler("XRPLife:Respawn", function()
    if IsEntityDead(GetPlayerPed(PlayerId())) then
        exports.spawnmanager.spawnPlayer()
    end
end)