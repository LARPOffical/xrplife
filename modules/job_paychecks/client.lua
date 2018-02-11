RegisterNetEvent("XRPLife:RequestCharacterPaycheck")
AddEventHandler("XRPLife:RequestCharacterPaycheck", function()
    TriggerServerEvent("XRPLife:RequestPaycheckTimer")
end)

RegisterNetEvent("XRPLife:StartCharacterPaycheck")
AddEventHandler("XRPLife:StartCharacterPaycheck", function(time)
    PaycheckTimer(time)
end)

function PaycheckTimer(time)
    local new_time = time
    for a = 1, time do
        Citizen.Wait(1000)
        new_time = new_time - 1
        if new_time <= 0 then
            TriggerServerEvent("XRPLife:PayCharacter")
        end
    end
end