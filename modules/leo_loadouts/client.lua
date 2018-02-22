local markers = {}
local markers_active = false
local loadouts = {}

AddEventHandler("onClientMapStart", function()
    TriggerServerEvent("XRPLife:RequestLEOLoadoutMarkers")
end)

RegisterNetEvent("XRPLife:RecieveLoadoutMarkers")
AddEventHandler("XRPLife:RecieveLoadoutMarkers", function(loadoutmarkers)
    markers = loadoutmarkers
    markers_active = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if markers_active then
            for a = 1, #markers do
                local ped = ClientHelpers.LocalPed()
                local pedCoords = GetEntityCoords(ped, false)
                local distance = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, markers[a].x, markers[a].y, markers[a].z)

                if distance < 10.0 then
                    DrawMarker(1, markers[a].x, markers[a].y, markers[a].z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 0.0, 255, 0.3, 0, 0, 2, 0, 0, 0, 0)
                    if distance < 1.2 then
                        ClientHelpers.Draw3DText(markers[a].x, markers[a].y, markers[a].z, tostring("Press E to open loadout menu"))
                        if IsControlJustPressed(1, 38) then
                            TriggerServerEvent("XRPLife:RequestDepartmentLoadouts")
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("XRPLife:OpenLEOLoadoutMenu")
AddEventHandler("XRPLife:OpenLEOLoadoutMenu", function(loadouts)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_leo_loadout_menu",
        loadout = loadouts
    })
end)

RegisterNUICallback("requestleoloadout", function(data)
    TriggerServerEvent("XRPLife:RequestLoadout", data.chosen_loadout)
end)

RegisterNUICallback("closeleoloadoutmenu", function(data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "close_leo_loadout_menu"
    })
end)

RegisterNetEvent("XRPLife:SetPlayerLoadout")
AddEventHandler("XRPLife:SetPlayerLoadout", function(loadout_data)
    local model = GetHashKey(loadout_data.uniform.model)
    local components = loadout_data.uniform.components
    local props =  loadout_data.uniform.props
    local weapons = loadout_data.weapons

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), model)
    Citizen.Wait(1000)
    local ped = ClientHelpers.LocalPed()

    for c = 1, #components do
        Citizen.Trace("Setting Component")
        SetPedComponentVariation(ped, components[c].component, components[c].drawable, components[c].texture, 1)
    end

    for p = 1, #props do
        SetPedPropIndex(ped, props[p].component, props[p].drawable, props[p].texture, true)
    end

    for w = 1, #weapons do
        GiveWeaponToPed(ped, GetHashKey(weapons[w].model), weapons[w].ammo, false, false)
        for attach = 1, #weapons[w].attachments do
            GiveWeaponComponentToPed(ped, GetHashKey(weapons[w].model), weapons[w].attachments[attach])
        end
    end
end)