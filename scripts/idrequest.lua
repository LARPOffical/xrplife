local officer_id = nil
local license_open = false

RegisterNetEvent("XRPLife:SendIDRequest")
AddEventHandler("XRPLife:SendIDRequest", function(officername, officerid)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type="request_player_id",
        officer = officername
    })
    officer_id = officerid
end)

RegisterNUICallback("sendidresults", function(data)
    SetNuiFocus(false, false)
    if data.accepted then
        TriggerServerEvent("XRPLife:RecieveCharacterID", officer_id)
        officer_id = nil
    else
        TriggerServerEvent("XRPLife:RecieveCharacterIDRefused", officer_id)
        officer_id = nil
    end
end)

-- OFFICER SCRIPT --
RegisterNetEvent("XRPLife:OpenLicenseMenu")
AddEventHandler("XRPLife:OpenLicenseMenu", function(char)
    if not license_open then
        Citizen.Trace("RECIEVE CLIENT CHARACTER DATA")
        Citizen.Trace(tostring(json.encode(data)))
        SendNUIMessage({
            type = "enable_license_ui",
            data = char
        })
        license_open = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if license_open then
            ClientHelpers.DisplayTopLeftNotification(tostring("Press ~INPUT_CELLPHONE_OPTION~ to remove license from screen."))
            if IsControlJustPressed(1, 178) or IsControlJustPressed(1, 38) then -- END KEY???? E as backup
                SendNUIMessage({
                    type = "remove_license_ui"
                })
                license_open = false
            end
        end
    end
end)