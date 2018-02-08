local anim_dic = "mp_arresting"
local anim_name = "idle"

local handcuffed = false

RegisterNetEvent("XRPLife:ItemHandcuff")
AddEventHandler("XRPLife:ItemHandcuff", function(player, playername)
    local ped = ClientHelpers.LocalPed()
    if DoesEntityExist(ped) then
        if IsEntityPlayingAnim(ped, anim_dic, anim_name, 3) then
            handcuffed = false
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been unhandcuffed by " .. playername),
                time = 5000,
            })
            -- Add Handcuff to player
        else
            handcuffed = true
            RequestAnimDict(anim_dic)
            while not HasAnimDictLoaded(anim_dic) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
            SetEnableHandcuffs(ped, true)
            TriggerEvent("XRPLife:ErrorNotification", {
                title = "XRPLife",
                message = tostring("You have been handcuffed by " .. playername),
                time = 5000,
            })
            -- Remove Handcuff From Player
        end
    end
end)