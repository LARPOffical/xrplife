CharacterDB = {}
CharacterDB = setmetatable(CharacterDB, {})

MySQL.ready(function()

    -- Gets ALL player characters
    CharacterDB.GetPlayerCharacters = function(id)
        local results = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        return results
    end

    -- Check if character alraedy exists
    CharacterDB.CheckCharacterExist = function(name, dob)
        local results = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE name = @name AND dob = @dob", {['@name'] = name, ['@dob'] = dob})
        if results[1] then
            return true
        else
            return false
        end
    end

    -- Gets Players Targeted Character
    CharacterDB.GetPlayerCharacter = function(id, name, dob)
        local results = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE license = @license AND name = @name AND dob = @dob", {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = name,
            ['@dob'] = dob
        })
        if results[1] then
            return results[1]
        else
            return false
        end
    end

    -- Gets Players Character Count
    CharacterDB.GetCharacterCount = function(id)
        local results = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        local count = #results
        return count
    end

    -- Creates Player Character
    CharacterDB.CreateCharacter = function(id, data)
        MySQL.Async.execute("INSERT INTO characters (`license`, `name`, `dob`, `gender`, `model_components`, `bank`, `inventory`, `state`, `sheriff`, `police`, `fire`) VALUES (@license, @name, @dob, @gender, @model, @bank, @inventory, @state, @sheriff, @police, @fire)", {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = data.name,
            ['@dob'] = data.dob,
            ['@gender'] = data.gender,
            ['@model'] = tostring(json.encode({
                model = data.model,
                modelStatus = "newcharacter",
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
                    ['TORSO2'] = {drawid = 1, textureid = 1, paletteid = 1}},
                props = {
                    ['HATS'] = {drawid = 1, textureid = 1, paletteid = 1},
                    ['GLASSES'] = {drawid = 1, textureid = 1, paletteid = 1},
                    ['EARS'] = {drawid = 1, textureid = 1, paletteid = 1}
                }
            })),
            ['@bank'] = BaseConfig.StarterBank,
            ['@inventory'] = json.encode({}),
            ['@state'] = json.encode({rank = "", divisions = {}, hasPermission = false}),
            ['@sheriff'] = json.encode({rank = "", divisions = {}, hasPermission = false}),
            ['@police'] = json.encode({rank = "", divisions = {}, hasPermission = false}),
            ['@fire'] = json.encode({rank = "", divisions = {}, hasPermission = false}),
        }, function(results)
            print(results)
            TriggerEvent("XRPLife:UpdatePlayerCharacters", id)
        end)
    end

    -- Updates Character Clothing
    CharacterDB.UpdateSelectedCharacter = function(id, name, dob, data)
        MySQL.Async.execute("UPDATE characters SET model_components = @data WHERE license = @license AND name = @name AND dob = @dob", {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = name,
            ['@dob'] = dob,
            ['@data'] = tostring(json.encode(data))
        }, function(results)
            print("UPDATING CHARACTER")
            print(results)
        end)
    end

    -- Add Money To Character Bank
    CharacterDB.AddMoneyCharacterBank = function(id, name, dob, amount)
        local current_bank_amount = MySQL.Sync.fetchAll("SELECT bank FROM characters WHERE license = @license AND name = @name AND dob = @dob", {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = name,
            ['@dob'] = dob
        })

        MySQL.Async.execute("UPDATE characters SET bank = @bank WHERE license = @license AND name = @name AND dob = @dob", {
            ['@bank'] = current_bank_amount[1].bank + amount,
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = name,
            ['@dob'] = dob
        }, function(results)
            print(results)
        end)
    end

    -- Removes Character
    CharacterDB.DeleteCharacter = function(id, name, dob)
        MySQL.Async.execute("DELETE FROM characters WHERE license = @license AND name = @name AND dob = @dob", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id), ['@name'] = name, ['@dob'] = dob}, function(results)
            print(results)
            TriggerEvent("XRPLife:UpdatePlayerCharacters", id)
        end)
    end

    CharacterDB.CharacterPoliceData = function(id, name, dob)
        local results = MySQL.Sync.fetchAll("SELECT police FROM characters WHERE license = @license AND name = @name AND dob = @dob",  {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = name,
            ['@dob'] = dob
        })
        local data = json.decode(results[1].police)
        return data
    end
end)