local isFrozen = true

-- Enable character menu and set screen focus and cursor
RegisterNetEvent("XRPLife:EnableCharacterMenu")
AddEventHandler("XRPLife:EnableCharacterMenu", function(characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type="open_character_menu",
        chars = characters
    })
end)

-- After closing the menu use the to remove the cursor / focus
RegisterNUICallback("closecharactermenu", function(data)
    SetNuiFocus(false, false)
end)

-- Requesting peds for the gender chosen on the menu
RegisterNUICallback("requestpedmodels", function(data)
    TriggerServerEvent("XRPLife:RequestPlayerModelsList", data.gender)
end)

-- Padding mode
RegisterNetEvent("XRPLife:PassModelsList")
AddEventHandler("XRPLife:PassModelsList", function(models)
    SendNUIMessage({
        type="passing_models_list",
        list = models
    })
end)

-- Sending character to create to the server
RegisterNUICallback("requestcreatecharacter", function(data)
    TriggerServerEvent("XRPLife:CreatePlayerAccount", data)
end)

-- Recieving if the server Created or Failed to create the character
RegisterNetEvent("XRPLife:PassAccountReturn")
AddEventHandler("XRPLife:PassAccountReturn", function(created)
    SendNUIMessage({
        type="account_created_status",
        results = created
    })
end)

-- Recieving and Passing updated characters
RegisterNetEvent("XRPLife:PassUpdatedCharacters")
AddEventHandler("XRPLife:PassUpdatedCharacters", function(characters)
    Citizen.Trace(tostring("CLIENT: Recieved Updated Characters"))
    Citizen.Trace(tostring(json.encode(characters)))
    SendNUIMessage({
        type="pass_updated_characters",
        chars = characters
    })
end)

-- Sending character to delete to the server
RegisterNUICallback("deletecharacter", function(data)
    TriggerServerEvent("XRPLife:DeletePlayerCharacter", data.name, data.dob)
end)

-- Passing Character To Select
RegisterNUICallback("selectcharacter", function(data)
    TriggerServerEvent("XRPLife:SelectPlayerCharacter", data)
end)

-- Send Message To Close Character Menu
RegisterNetEvent("XRPLife:CloseCharacterMenu")
AddEventHandler("XRPLife:CloseCharacterMenu", function()
    SendNUIMessage({
        type="close_character_menu",
    })
    isFrozen = false
    FreezeEntityPosition(ClientHelpers.LocalPed(), false)
end)

RegisterNetEvent("XRPLife:SetUpdatedModelComponents")
AddEventHandler("XRPLife:SetUpdatedModelComponents", function(modelinfo)
    -- Set Preconfigured Model Here
    Citizen.Trace("SetUpdateModelComponents Called")

    local model = GetHashKey(modelinfo.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), model)

    local ped = ClientHelpers.LocalPed()
    SetPedDefaultComponentVariation(ped)

    Citizen.Wait(500)

    -- Face
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['FACE'], modelinfo.clothing['FACE'].drawid, modelinfo.clothing['FACE'].textureid, modelinfo.clothing['FACE'].paletteid)
    -- Head
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['HEAD'], modelinfo.clothing['HEAD'].drawid, modelinfo.clothing['HEAD'].textureid, modelinfo.clothing['HEAD'].paletteid)
    -- Hair
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['HAIR'], modelinfo.clothing['HAIR'].drawid, modelinfo.clothing['HAIR'].textureid, modelinfo.clothing['HAIR'].paletteid)
    -- Torso
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['TORSO'], modelinfo.clothing['TORSO'].drawid, modelinfo.clothing['TORSO'].textureid, modelinfo.clothing['TORSO'].paletteid)
    -- Legs
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['LEGS'], modelinfo.clothing['LEGS'].drawid, modelinfo.clothing['LEGS'].textureid, modelinfo.clothing['LEGS'].paletteid)
    -- Hands
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['HANDS'], modelinfo.clothing['HANDS'].drawid, modelinfo.clothing['HANDS'].textureid, modelinfo.clothing['HANDS'].paletteid)
    -- Feet
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['FEET'], modelinfo.clothing['FEET'].drawid, modelinfo.clothing['FEET'].textureid, modelinfo.clothing['FEET'].paletteid)
    -- Eyes
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['EYES'], modelinfo.clothing['EYES'].drawid, modelinfo.clothing['EYES'].textureid, modelinfo.clothing['EYES'].paletteid)
    -- Accessories
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['ACCESSORIES'], modelinfo.clothing['ACCESSORIES'].drawid, modelinfo.clothing['ACCESSORIES'].textureid, modelinfo.clothing['ACCESSORIES'].paletteid)
    -- Tasks
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['TASKS'], modelinfo.clothing['TASKS'].drawid, modelinfo.clothing['TASKS'].textureid, modelinfo.clothing['TASKS'].paletteid)
    -- Textures
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['TEXTURES'], modelinfo.clothing['TEXTURES'].drawid, modelinfo.clothing['TEXTURES'].textureid, modelinfo.clothing['TEXTURES'].paletteid)
    -- Torso2
    SetPedComponentVariation(ped, ClientHelpers.ModelComponentsIds['TORSO2'], modelinfo.clothing['TORSO2'].drawid, modelinfo.clothing['TORSO2'].textureid, modelinfo.clothing['TORSO2'].paletteid)

    --Helmet
    SetPedComponentVariation(ped, ClientHelpers.PropComponentIds['HELMETS'], modelinfo.props['HELMETS'].drawid, modelinfo.props['HELMETS'].textureid, modelinfo.props['HELMETS'].paletteid)
    -- Glasses
    SetPedComponentVariation(ped, ClientHelpers.PropComponentIds['GLASSES'], modelinfo.props['GLASSES'].drawid, modelinfo.props['GLASSES'].textureid, modelinfo.props['GLASSES'].paletteid)
    -- Ears
    SetPedComponentVariation(ped, ClientHelpers.PropComponentIds['EARS'], modelinfo.props['EARS'].drawid, modelinfo.props['EARS'].textureid, modelinfo.props['EARS'].paletteid)

    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 0)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 1)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 2)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 3)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 4)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 5)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 6)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 7)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 8)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 9)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 10)))
    Citizen.Trace(tostring(GetPedDrawableVariation(ped, 11)))
end)

RegisterNetEvent("XRPLife:UpdateNewModelComponents")
AddEventHandler("XRPLife:UpdateNewModelComponents", function(modelinfo)
    Citizen.Trace("UpdateNewModelComponents Called")
    local components = {
        model = "placeholder",
        modelStatus = "defaultmodel",
        clothing = {
            ['FACE'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['HEAD'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['HAIR'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['TORSO'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['LEGS'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['HANDS'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['FEET'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['EYES'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['ACCESSORIES'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['TASKS'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['TEXTURES'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['TORSO2'] = {drawid = 1, textureid = 1, paletteid = 1}
        },
        props = {
            ['HELMETS'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['GLASSES'] = {drawid = 1, textureid = 1, paletteid = 1},
            ['EARS'] = {drawid = 1, textureid = 1, paletteid = 1}
        }
    }

    local model = GetHashKey(modelinfo.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), model)

    local ped = ClientHelpers.LocalPed()
    SetPedDefaultComponentVariation(ped)

    Citizen.Wait(500)

    --[[ Clothing ]]--
    components.model = modelinfo.model

    local faceDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['FACE'])
    local faceText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['FACE'])
    components.clothing['FACE'].drawid = faceDraw
    components.clothing['FACE'].textureid = faceText
    components.clothing['FACE'].paletteid = 2
    Citizen.Trace(tostring("FACE: " .. faceDraw .. " | " .. faceText))

    local headDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['HEAD'])
    local headText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['HEAD'])
    components.clothing['HEAD'].drawid = headDraw
    components.clothing['HEAD'].textureid = headText
    components.clothing['HEAD'].paletteid = 2
    Citizen.Trace(tostring("HEAD: " .. headDraw .. " | " .. headText))

    local hairDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['HAIR'])
    local hairText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['HAIR'])
    components.clothing['HAIR'].drawid = hairDraw
    components.clothing['HAIR'].textureid = hairText
    components.clothing['HAIR'].paletteid = 2
    Citizen.Trace(tostring("HAIR: " .. hairDraw .. " | " .. hairText))

    local torsoDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['TORSO'])
    local torsoText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['TORSO'])
    components.clothing['TORSO'].drawid = torsoDraw
    components.clothing['TORSO'].textureid = torsoText
    components.clothing['TORSO'].paletteid = 2
    Citizen.Trace(tostring("TORSO: " .. torsoDraw .. " | " .. torsoText))

    local legsDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['LEGS'])
    local legsText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['LEGS'])
    components.clothing['LEGS'].drawid = legsDraw
    components.clothing['LEGS'].textureid = legsText
    components.clothing['LEGS'].paletteid = 2
    Citizen.Trace(tostring("LEGS: " .. legsDraw .. " | " .. legsText))

    local handsDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['HANDS'])
    local handsText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['HANDS'])
    components.clothing['HANDS'].drawid = handsDraw
    components.clothing['HANDS'].textureid = handsText
    components.clothing['HANDS'].paletteid = 2
    Citizen.Trace(tostring("HANDS: " .. handsDraw .. " | " .. handsText))

    local feetDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['FEET'])
    local feetText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['FEET'])
    components.clothing['FEET'].drawid = feetDraw
    components.clothing['FEET'].textureid = feetText
    components.clothing['FEET'].paletteid = 2
    Citizen.Trace(tostring("FEET: " .. feetDraw .. " | " .. feetText))

    local eyesDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['EYES'])
    local eyesText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['EYES'])
    components.clothing['EYES'].drawid = eyesDraw
    components.clothing['EYES'].textureid = eyesText
    components.clothing['EYES'].paletteid = 2
    Citizen.Trace(tostring("EYES: " .. eyesDraw .. " | " .. eyesText))

    local accessoriesDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['ACCESSORIES'])
    local accessoriesText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['ACCESSORIES'])
    components.clothing['ACCESSORIES'].drawid = accessoriesDraw
    components.clothing['ACCESSORIES'].textureid = accessoriesText
    components.clothing['ACCESSORIES'].paletteid = 2
    Citizen.Trace(tostring("ACCESSORIES: " .. accessoriesDraw .. " | " .. accessoriesText))

    local tasksDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['TASKS'])
    local tasksText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['TASKS'])
    components.clothing['TASKS'].drawid = tasksDraw
    components.clothing['TASKS'].textureid = tasksText
    components.clothing['TASKS'].paletteid = 2
    Citizen.Trace(tostring("TASKS: " .. tasksDraw .. " | " .. tasksText))

    local texturesDraw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['TEXTURES'])
    local texturesText = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['TEXTURES'])
    components.clothing['TEXTURES'].drawid = texturesDraw
    components.clothing['TEXTURES'].textureid = texturesText
    components.clothing['TEXTURES'].paletteid = 2
    Citizen.Trace(tostring("TEXTURES: " .. texturesDraw .. " | " .. texturesText))

    local torso2Draw = GetPedDrawableVariation(ped, ClientHelpers.ModelComponentsIds['TORSO2'])
    local torso2Text = GetPedTextureVariation(ped, ClientHelpers.ModelComponentsIds['TORSO2'])
    components.clothing['TORSO2'].drawid = torso2Draw
    components.clothing['TORSO2'].textureid = torso2Text
    components.clothing['TORSO2'].paletteid = 2
    Citizen.Trace(tostring("TOROS2: " .. torso2Draw .. " | " .. torso2Text))

    --[[ Props ]]--
    local helmetDraw = GetPedDrawableVariation(ped, ClientHelpers.PropComponentIds['HELMETS'])
    local helmetText = GetPedTextureVariation(ped, ClientHelpers.PropComponentIds['HELMETS'])
    components.props['HELMETS'].drawid = helmetDraw
    components.props['HELMETS'].textureid = helmetText
    Citizen.Trace(tostring("HELMET: " .. helmetDraw .. " | " .. helmetText))

    local glassesDraw = GetPedDrawableVariation(ped, ClientHelpers.PropComponentIds['GLASSES'])
    local glassesText = GetPedTextureVariation(ped, ClientHelpers.PropComponentIds['GLASSES'])
    components.props['GLASSES'].drawid = glassesDraw
    components.props['GLASSES'].textureid = glassesText
    Citizen.Trace(tostring("GLASSES: " .. helmetDraw .. " | " .. helmetText))

    local earsDraw = GetPedDrawableVariation(ped, ClientHelpers.PropComponentIds['EARS'])
    local earsText = GetPedTextureVariation(ped, ClientHelpers.PropComponentIds['EARS'])
    components.props['EARS'].drawid = earsDraw
    components.props['EARS'].textureid = earsText
    Citizen.Trace(tostring("EARS: " .. helmetDraw .. " | " .. helmetText))

    TriggerServerEvent("XRPLife:UpdateNewCharacter", components)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isFrozen then
            if DoesEntityExist(ClientHelpers.LocalPed()) then
                FreezeEntityPosition(ClientHelpers.LocalPed(), true)
            end
        end
    end
end)