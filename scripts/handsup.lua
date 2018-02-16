local anim_dic = "random@mugging3"
local anim_name = "handsup_standing_base"

RegisterNetEvent("XRPLife:Handsup")
AddEventHandler("XRPLife:Handsup", function()
    local ped = ClientHelpers.LocalPed()
    if not ClientHelpers.PlayerHandcuffed then
        if ClientHelpers.PlayerHandsUp then
            ClearPedSecondaryTask(ped)
            SetEnableHandcuffs(ped, false)
            ClientHelpers.PlayerHandsUp = false
        else
            RequestAnimDict(anim_dic)
            while not HasAnimDictLoaded(anim_dic) do
                Citizen.Wait(100)
            end
            TaskPlayAnim(ped, anim_dic, anim_name, 8.0, -8, -1, 49, 0, 0, 0, 0)
            SetEnableHandcuffs(ped, true)
            ClientHelpers.PlayerHandsUp = true
        end
    else
        TriggerEvent("XRPLife:ErrorNotification", {
            title = "XRPLife",
            message = "You can not put your hands up while handcuffed.",
            time = 5000
        })
    end
end)