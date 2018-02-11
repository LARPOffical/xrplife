local anim_dic = "mp_arresting"
local anim_name = "idle"

local handcuffed = false

RegisterNetEvent("XRPLife:ItemHandcuff")
AddEventHandler("XRPLife:ItemHandcuff", function(officername)
    local ped = ClientHelpers.LocalPed()
    if DoesEntityExist(ped) then
        if IsEntityPlayingAnim(ped, anim_dic, anim_name, 3) then
            handcuffed = false
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been unhandcuffed by " .. officername),
                time = 5000,
            })
        else
            RequestAnimDict(anim_dic)
            while not HasAnimDictLoaded(anim_dic) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
            SetEnableHandcuffs(ped, true)
            handcuffed = true
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been handcuffed by " .. officername),
                time = 5000,
            })
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3.5, "handcuff", 1.0)
        end
    end
end)

-- Keeps Player Handcuffed.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if handcuffed and not IsEntityPlayingAnim(ClientHelpers.LocalPed(), anim_dic, anim_name, 3) then
            RequestAnimDict(anim_dic)
            while not HasAnimDictLoaded(anim_dic) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
        end
    end
end)