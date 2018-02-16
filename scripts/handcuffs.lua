local anim_dic = "mp_arresting"
local anim_name = "idle"

RegisterNetEvent("XRPLife:HandcuffTogglePlayer")
AddEventHandler("XRPLife:HandcuffTogglePlayer", function(officername)
    local ped = ClientHelpers.LocalPed()
    if DoesEntityExist(ped) then
        if ClientHelpers.PlayerHandcuffed then
            ClientHelpers.PlayerHandcuffed = false
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been uncuffed by " .. officername),
                time = 5000
            })
        else
            ClientHelpers.PlayerHandcuffed = true
            if ClientHelpers.PlayerHandsUp then
                ClientHelpers.PlayerHandsUp = false
            end
            RequestAnimDict(anim_dic)
            while not HasAnimDictLoaded(anim_dic) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
            SetEnableHandcuffs(ped, true)
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been cuffed by " .. officername),
                time = 5000
            })
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, "handcuff", 1.0)
        end
    end
end)

-- Keeps Player Handcuffed.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ClientHelpers.PlayerHandcuffed then
            if ClientHelpers.PlayerHandsUp then
                ClientHelpers.PlayerHandsUp = false
            end
            if ClientHelpers.IsPlayerPlayingAnim(anim_dic, anim_name) == false then
                RequestAnimDict(anim_dic)
                while not HasAnimDictLoaded(anim_dic) do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
            end
        end
    end
end)