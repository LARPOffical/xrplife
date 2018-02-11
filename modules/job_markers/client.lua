local first_data_entered = false
local jobmarkers = {}

RegisterNetEvent("XRPLife:RequestJobMarkers")
AddEventHandler("XRPLife:RequestJobMarkers", function()
    print("Requesting Job Markers")
    TriggerServerEvent("XRPLife:SendJobMarkers")
end)

RegisterNetEvent("XRPLife:RecieveJobMarkers")
AddEventHandler("XRPLife:RecieveJobMarkers", function(jobs)
    jobmarkers = jobs
    first_data_entered = true
    print("Recieving Job Markers")
    print(tostring(json.encode(jobmarkers)))
end)

-- Checks Distance and Keypress
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if first_data_entered then
            for a = 1, #jobmarkers do
                local ped = ClientHelpers.LocalPed()
                local pedPos = GetEntityCoords(ped, false)
                for b = 1, #jobmarkers[a].jobPos do
                    local markerCoords = jobmarkers[a].jobPos[b]
                    local distance = Vdist(pedPos.x, pedPos.y, pedPos.z, markerCoords.x, markerCoords.y, markerCoords.z)
                    if distance < 10.0 then
                        DrawMarker(1, markerCoords.x, markerCoords.y, markerCoords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 0.0, 255, 0.3, 0, 0, 2, 0, 0, 0, 0)
                        if distance < 1.5 then
                            ClientHelpers.Draw3DText(markerCoords.x, markerCoords.y, markerCoords.z, tostring("Press E to be a " .. jobmarkers[a].jobName))
                            if IsControlJustPressed(1, 38) then
                                TriggerServerEvent("", jobmarkers[a].jobName)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Refreshes the markers in-case of client sided changes
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
        if first_data_entered then
            print("Auto Requesting Markers")
            TriggerEvent("XRPLife:RequestJobMarkers")
        end
    end
end)