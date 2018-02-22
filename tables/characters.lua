Characters = {}
Characters = setmetatable(Characters, {})
Characters.List = {}
Characters.Functions = {}

Characters.Functions.AddPlayerCharacter = function(id, character_info)
    table.insert(Characters.List, {
        id = id, 
        name = character_info.name, 
        dob = character_info.dob, 
        gender = character_info.gender,
        inventory = json.decode(character_info.inventory),
        hygiene = json.decode(character_info.hygiene),
    })
    print(tostring(json.encode(Characters.List)))
    TriggerClientEvent("XRPLife:CloseCharacterMenu", id)
end

Characters.Functions.RemovePlayerCharacter = function(id)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            table.remove(Characters.List, a)
            print(tostring(json.encode(Characters.List)))
            return
        end
    end
end

Characters.Functions.GetPlayerInventory = function(id)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            return Characters.List[a].inventory
        end
    end
end

Characters.Functions.AddItem = function(id, item)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            for b = 1, #Characters.List[a].inventory do
                if Characters.List[a].inventory[b].item == item then
                    Characters.List[a].inventory[b].amount = Characters.List[a].inventory[b].amount + 1
                    return
                else
                    table.insert(Characters.List[a].inventory, {item = item, amount = 1})
                    return
                end
            end
        end
    end
end

Characters.Functions.RemoveItem = function(id, item)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            for b = 1, #Characters.List[a].inventory do
                if Characters.List[a].inventory[b].item == item then
                    if Characters.List[a].inventory[b].amount == 0 then
                        table.remove(Characters.List[a].inventory, b)
                        return
                    else
                        Characters.List[a].inventory[b].amount = Characters.List[a].inventory.amount - 1
                        return
                    end
                end
            end
        end
    end
end

Characters.Functions.GetPlayerName = function(id)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            return Characters.List[a].name
        end
    end
    return tostring("RPName Not Found: " .. GetPlayerName(id))
end

Characters.Functions.GetCurrentCharacter = function(id)
    for a = 1, #Characters.List do
        if Characters.List[a].id == id then
            return Characters.List[a]
        end
    end
end