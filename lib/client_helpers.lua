ClientHelpers = {}
ClientHelpers = setmetatable(ClientHelpers, {})

ClientHelpers.LocalPed = function()
    return GetPlayerPed(PlayerId())
end

ClientHelpers.GetPlayers = function()
    local players = {}
    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

ClientHelpers.GetPedAheadOfPlayer = function()
    local lPed = ClientHelpers.LocalPed()
    local lPedCoords = GetEntityCoords(lPed, alive)
    local lPedOffset = GetOffsetFromEntityInWorldCoords(lPed, 0.0, 3.0, 0.0)
    local rayHandle = StartShapeTestCapsule(lPedCoords.x, lPedCoords.y, lPedCoords.z, lPedOffset.x, lPedOffset.y, lPedOffset.z, 1.2, 12, lPed, 7)
    local returnValue, hit, endcoords, surface, ped = GetShapeTestResult(rayHandle)

    if hit then
        return ped
    else
        return false
    end
end

ClientHelpers.Draw3DText = function(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

ClientHelpers.ModelComponentsIds = {
    ['FACE'] = 0,
    ['HEAD'] = 1,
    ['HAIR'] = 2,
    ['TORSO'] = 3,
    ['LEGS'] = 4,
    ['HANDS'] = 5,
    ['FEET'] = 6,
    ['EYES'] = 7,
    ['ACCESSORIES'] = 8,
    ['TASKS'] = 9,
    ['TEXTURES'] = 10,
    ['TORSO2'] = -11,
}

ClientHelpers.PropComponentIds = {
    ['HELMETS'] = 0,
    ['GLASSES'] = 1,
    ['EARS'] = 2,
}