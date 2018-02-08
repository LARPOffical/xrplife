AddEventHandler("playerConnecting", function(name, callback, deferrals)
    deferrals.defer() -- Hold Connection

    local src = source

    local wait_time = 20
    local update_msg = {"Please Wait"}

    local connectPlayer = false
    local connectFailMsg = ""

    for a = 1, wait_time do
        if #update_msg == 5 then
            for b = 1, #update_msg - 1 do
                table.remove(update_msg, #update_msg)
            end
        end

        deferrals.update(table.concat(update_msg))
        Wait(500)
        table.insert(update_msg, ".")
    end

    if PlayerDB.DoesPlayerExist(src) then
        -- Getting Data
        local player_data = PlayerDB.GetPlayerData(src)
        local banstatus = json.decode(player_data.ban_status)
        local whiteliststatus = player_data.whitelisted

        if BaseConfig.Whitelisted then
            if whiteliststatus then
                if banstatus.banned then
                    connectPlayer = false
                    connectFailMsg = tostring("[XRPLife] You have been banned for (" .. banstatus.reason .. ") by (" .. banstatus.banner .. ")")
                else
                    connectPlayer = true
                    connectFailMsg = tostring("[XRPLife] You have been banned for (" .. banstatus.reason .. ") by (" .. banstatus.banner .. ")")
                end
            else
                connectPlayer = false
                connectFailMsg = "[XRPLife] You are not whitelisted."
            end
        else
            if banstatus.banned then
                connectPlayer = false
                connectFailMsg = tostring("[XRPLife] You have been banned for (" .. banstatus.reason .. ") by (" .. banstatus.banner .. ")")
            else
                connectPlayer = true
            end
        end
    else
        if BaseConfig.Whitelisted then
            connectPlayer = false
            connectFailMsg = "[XRPLife] You are not whitelisted."
        else
            connectPlayer = true
        end
        PlayerDB.CreatePlayer(src)
    end

    if connectPlayer then
        deferrals.done()
    else
        deferrals.done(connectFailMsg)
    end
end)

RegisterServerEvent("XRPLife:InitializePlayer")
AddEventHandler("XRPLife:InitializePlayer", function()
    local src = source
    
    -- Add player to player list
    PlayerTable.Functions.AddPlayerToTable(src)

    -- Recieve Initial Player Characters
    local current_chars = CharacterDB.GetPlayerCharacters(src)
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

    TriggerClientEvent("XRPLife:EnableCharacterMenu", src, char_list)
end)

AddEventHandler("playerDropped", function()
    local src = source
    PlayerTable.Functions.RemovePlayerFromTable(src)
    Characters.Functions.RemovePlayerCharacter(src)
end)