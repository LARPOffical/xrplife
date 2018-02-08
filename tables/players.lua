PlayerTable = {}
PlayerTable = setmetatable(PlayerTable, {})
PlayerTable.List = {}
PlayerTable.Functions = {}

PlayerTable.Functions.AddPlayerToTable = function(id)
    print("Adding Player To Table")
    table.insert(PlayerTable.List, {id = id, rank = PlayerDB.GetPlayerRank(id)})
    print(tostring(json.encode(PlayerTable.List)))
end

PlayerTable.Functions.RemovePlayerFromTable = function(id)
    print("Removing Player From Table")
    for a = 1, #PlayerTable.List do
        if PlayerTable.List[a].id == id then
            table.remove(PlayerTable.List, a)
            print(tostring(json.encode(PlayerTable.List)))
            return
        end
    end
end

PlayerTable.Functions.GetPlayerRank = function(id)
    for a = 1, #PlayerTable.List do
        if PlayerTable.List[a].id == id then
            return PlayerTable.List[a].rank
        end
    end
    return tostring("Rank Not Found")
end