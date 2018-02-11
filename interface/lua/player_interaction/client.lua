local menu_open = false
local selected_server_id = nil

RegisterNetEvent("XRPLife:OpenPlayerInteraction")
AddEventHandler("XRPLife:OpenPlayerInteraction", function(job)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type="open_player_interaction",
        job=job
    })
    menu_open = true
end)

RegisterNUICallback("closeinteractionmenu", function()
    SetNuiFocus(false, false)
    selected_player = nil
    menu_open = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local tartgetped = ClientHelpers.GetPedAheadOfPlayer()
        if IsPedAPlayer(tartgetped) then
            local targetPedCoords = GetEntityCoords(tartgetped, false)
            ClientHelpers.Draw3DText(targetPedCoords.x, targetPedCoords.y, targetPedCoords.z, "Press E to interact")
            if IsControlJustPressed(1, 38) then
                local players = ClientHelpers.GetPlayers()
                Citizen.Trace(tostring(json.encode(players)))

                for a = 1, #players do
                    local ped = GetPlayerPed(players[a])
                    local server_id = GetPlayerServerId(players[a])
                    if tartgetped == ped then
                        TriggerServerEvent("XRPLife:GetInteractionPermissions")
                        selected_server_id = server_id
                    end
                end
            end
        end
    end
end)

--[[ Acctions ]]--
RegisterNUICallback("handcuffcallback", function()
    TriggerServerEvent("XRPLife:SendHandcuffRequest", selected_server_id)
end)