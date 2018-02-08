PlayerDB = {}
PlayerDB = setmetatable(PlayerDB, {})

MySQL.ready(function()

    PlayerDB.DoesPlayerExist = function(id)
        local results = MySQL.Sync.fetchAll("SELECT * FROM players WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        if results[1] then
            return true
        else
            return false
        end
    end

    PlayerDB.GetPlayerData = function(id)
        local results = MySQL.Sync.fetchAll("SELECT * FROM players WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        if results[1] then
            return results[1]
        end
    end

    PlayerDB.CreatePlayer = function(id)
        MySQL.Async.execute("INSERT INTO players (`license`, `name`, `com_rank`, `ban_status`, `whitelisted`, `characters`) VALUES (@license, @name, @rank, @ban, @whitelisted, @chars)", {
            ['@license'] = ServerHelpers.FindPlayerIdentifier("license", id),
            ['@name'] = GetPlayerName(id),
            ['@rank'] = ComranksConfig.Ranks[1].rank,
            ['@ban'] = json.encode({banned = false, reason = "", banner = ""}),
            ['@whitelisted'] = false,
            ['@chars'] = 0
        })
    end

    PlayerDB.GetCharacterCount = function(id)
        local results = MySQL.Sync.fetchAll("SELECT characters FROM players WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        return results[1].characters
    end

    PlayerDB.AddCharacterCount = function(id, amount)
        MySQL.Async.execute("UPDATE players SET characters = @characters", {['@characters'] = amount})
    end

    PlayerDB.RemoveCharacterCount = function(id, amount)
        MySQL.Async.execute("UPDATE players SET characters = @characters", {['@characters'] = amount})
    end

    PlayerDB.GetPlayerRank = function(id)
        local results = MySQL.Sync.fetchAll("SELECT com_rank FROM players WHERE license = @license", {['@license'] = ServerHelpers.FindPlayerIdentifier("license", id)})
        return results[1].com_rank
    end

    PlayerDB.SetPlayerRank = function(id, rank)
        MySQL.Async.execute("UPDATE players SET com_rank = @rank", {['@rank'] = rank})
    end
end)