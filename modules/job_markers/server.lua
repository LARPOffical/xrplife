RegisterServerEvent("XRPLife:SendJobMarkers")
AddEventHandler("XRPLife:SendJobMarkers", function()
    local src = source
    TriggerClientEvent("XRPLife:RecieveJobMarkers", src, JobsConfig.Markers)
end)

RegisterServerEvent("XRPLife:ChangeJobs")
AddEventHandler("XRPLife:ChangeJobs", function()
    
end)