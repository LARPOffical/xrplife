BaseConfig = {}
BaseConfig = setmetatable(BaseConfig, {})

-- Server Config
BaseConfig.Whitelisted = false

-- Community Ranks
BaseConfig.ComRanks = {
    {rank = "User", perms = {}},
    {rank = "Moderator", perms = {}},
    {rank = "Administrator", perms = {}},
    {rank = "Founder", perms = {}}
}

-- Character Base Config
BaseConfig.MaxCharacters = 5
BaseConfig.StarterBank = 5000

-- Character Licenses
BaseConfig.CharacterLicenses = {
    "Drivers License",
    "Handgun License",
    "Fishing License"
}

-- Local Message Distance --
BaseConfig.LocalMessageDistance = 20.0

-- Character Respawn Time
BaseConfig.RespawnTime = 600 -- seconds

-- Character Hygiene
BaseConfig.HygieneTimer = 30 -- seconds
BaseConfig.HungerRemoveIncriment = 1
BaseConfig.ThirstRemoveIncriment = 2 