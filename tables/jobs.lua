CharacterJobs = {}
CharacterJobs = setmetatable(CharacterJobs, {})
CharacterJobs.List = {}
CharacterJobs.Functions = {}

CharacterJobs.Functions.AddPlayerJob = function(id, job)
    table.insert(CharacterJobs.List, {id = id, job = job})
    print(tostring(json.encode(CharacterJobs.List)))
end

CharacterJobs.Functions.RemovePlayerJob = function(id)
    for a = 1, #CharacterJobs.List do
        if CharacterJobs.List[a].id == id then
            table.remove(CharacterJobs.List, a)
            print(tostring(json.encode(CharacterJobs.List)))
            return
        end
    end
end

CharacterJobs.Functions.SetPlayerJob = function(id, job)
    for a = 1, #CharacterJobs.List do
        if CharacterJobs.List[a].id == id then
            CharacterJobs.List[a].job = job
            print(tostring(json.encode(CharacterJobs.List[a])))
            return
        end
    end
end

CharacterJobs.Functions.GetPlayerJob = function(id)
    for a = 1, #CharacterJobs.List do
        if CharacterJobs.List[a].id == id then
            return CharacterJobs.List[a].job
        end
    end
end