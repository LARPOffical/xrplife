RegisterServerEvent("XRPLife:RequestPlayerModelsList")
AddEventHandler("XRPLife:RequestPlayerModelsList", function(gender)
    local src = source
    if gender == "Male" then
        TriggerClientEvent("XRPLife:PassModelsList", src, ClothingConfig.MaleModels)
    elseif gender == "Female" then
        TriggerClientEvent("XRPLife:PassModelsList", src, ClothingConfig.FemaleModels)
    end
end)


-- Determine to create the player account or not to create the account
RegisterServerEvent("XRPLife:CreatePlayerAccount")
AddEventHandler("XRPLife:CreatePlayerAccount", function(data)
    local src = source
    local results = {status = false, reason = ""}
    if CharacterDB.GetCharacterCount(src) == BaseConfig.MaxCharacters then
        results.status = false
        results.reason = "You have met the max character limit per player. Please remove one of your characters to make a new one."
    else
        if CharacterDB.CheckCharacterExist(data.name, data.dob) then
            results.status = false
            results.reason = "That name has already been taken. Sorry..."
        else
            CharacterDB.CreateCharacter(src, data)
            results.status = true
        end
    end
    TriggerClientEvent("XRPLife:PassAccountReturn", src, results)
end)

RegisterServerEvent("XRPLife:DeletePlayerCharacter")
AddEventHandler("XRPLife:DeletePlayerCharacter", function(name, dob)
    local src = source
    CharacterDB.DeleteCharacter(src, name, dob)
end)

-- Update Player Characters
RegisterServerEvent("XRPLife:UpdatePlayerCharacters")
AddEventHandler("XRPLife:UpdatePlayerCharacters", function(id)
    local current_chars = CharacterDB.GetPlayerCharacters(id)
    local char_list = {}
    for a = 1, #current_chars do
        local model = json.decode(current_chars[a].model_components)
        local inv = json.decode(current_chars[a].inventory)
        table.insert(char_list, {
            id=current_chars[a].id,
            name=current_chars[a].name,
            dob=current_chars[a].dob,
            gender=current_chars[a].gender,
            model=model.model,
            bank=current_chars[a].bank,
            inventory=inv
        })
    end
    TriggerClientEvent("XRPLife:PassUpdatedCharacters", id, char_list)
end)

RegisterServerEvent("XRPLife:SelectPlayerCharacter")
AddEventHandler("XRPLife:SelectPlayerCharacter", function(data)
    local src = source
    local character = CharacterDB.GetPlayerCharacter(src, data.name, data.dob)
    if character ~= false then
        local char_model = json.decode(character.model_components)
        Characters.Functions.AddPlayerCharacter(src, {
            name = character.name,
            dob = character.dob,
            gender = character.gender,
            inventory = character.inventory,
            hygiene = character.hygiene
        })
        TriggerClientEvent("XRPLife:SuccessNotification", src, {
            title = "XRPLife",
            message = "Welcome. You have selected " .. character.name .. ". Enjoy!",
            time = 2500
        })

        print(tostring(char_model.modelStatus))
        if char_model.modelStatus == "newcharacter" then
            TriggerClientEvent("XRPLife:UpdateNewModelComponents", src, char_model)
        else
            TriggerClientEvent("XRPLife:SetUpdatedModelComponents", src, char_model)
        end
    end
end)

RegisterServerEvent("XRPLife:UpdateNewCharacter")
AddEventHandler("XRPLife:UpdateNewCharacter", function(data)
    local src = source
    local character = Characters.Functions.GetCurrentCharacter(src)
    CharacterDB.UpdateSelectedCharacter(src, character.name, character.dob, data)
end)