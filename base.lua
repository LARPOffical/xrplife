-- Called one time when map starts
AddEventHandler("onClientMapStart", function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(2500)
    exports.spawnmanager:setAutoSpawn(false)
    RemoveDispatch()
    TriggerServerEvent("XRPLife:InitializePlayer")
    TriggerEvent("XRPLife:RequestJobMarkers")
    TriggerServerEvent("XRPLife:RequestBlips")
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

RegisterNetEvent("XRPLife:DrawBlips")
AddEventHandler("XRPLife:DrawBlips", function(blips)
    for a = 1, #blips do
        local blip = AddBlipForCoord(blips[a].coords.x, blips[a].coords.y, blips[a].coords.z)
        SetBlipSprite(blip, blips[a].blip)
        SetBlipDisplay(blip, 2)
        SetBlipColour(blip, blips[a].color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blips[a].name)
        EndTextCommandSetBlipName(blip)
    end
end)