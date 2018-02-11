-- Called one time when map starts
AddEventHandler("onClientMapStart", function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(2500)
    exports.spawnmanager:setAutoSpawn(false)
    RemoveDispatch()
    TriggerServerEvent("XRPLife:InitializePlayer")
    TriggerEvent("XRPLife:RequestJobMarkers")
end)

-- Called Every Frame
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        RemoveWantedLevel()
        RemoveHealthRegen()
    end
end)

function RemoveDispatch()
    for a = 1, 15 do
        EnableDispatchService(a, false)
    end
end

function RemoveWantedLevel()
    if GetPlayerWantedLevel(PlayerId()) >= 1 then
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end
end

function RemoveHealthRegen()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end