RegisterNetEvent("XRPLife:StartHygiene")
AddEventHandler("XRPLife:StartHygiene", function(time, newHunger, newThirst)
    -- Set Menu Hunger
    -- Set Menu Thirst
    -- Start Hygiene Timer
end)

RegisterNetEvent("XRPLife:RestartHygieneTimer")
AddEventHandler("XRPLife:RestartHygieneTimer", function(time)
    StartHygieneTimer(time)
end)

function StartHygieneTimer(time)
    for a = 1, time do
        Citizen.Wait(1000)
    end
    TriggerServerEvent("XRPLife:")
end