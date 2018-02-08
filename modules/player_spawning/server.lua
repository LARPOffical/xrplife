RegisterCommand("respawn", function(source, args, string)
    local src = source
    TriggerClientEvent("XRPLife:Respawn", src)
end, false)