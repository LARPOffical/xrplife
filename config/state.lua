StateConfig = {}
StateConfig = setmetatable(StateConfig, {})

-- Ranks for player in this department [The top rank is the auto assigned rank per player]
StateConfig.Ranks = {
    "Probationary",
    "Trooper",
    "Corporal",
    "Sergeant",
    "Lieutenant",
    "Captain"
}

StateConfig.Divisions = {
    'RECRUIT',
}

StateConfig.DefaultDivisions = {
    'RECRUIT'
}

StateConfig.LoadoutsList = {
    'RECRUIT'
}

StateConfig.LoadoutsData = {
    ['RECRUIT'] = {
        required_division = "RECRUIT",
        uniform = {
            model = "Nothing",
            components = {
                -- None Yet
            },
            props = {
                -- None Yet
            }
        },
        weapons = {
            {model = "weapon_stungun", attachments = {}, ammo = -1},
            {model = "weapon_fireextinguisher", attachments = {}, ammo = -1},
            {model = "weapon_flashlight", attachments = {}, ammo = -1},
            {model = "weapon_nightstick", attachments = {}, ammo = -1}
        }
    },
}

StateConfig.Vehicles = {
    {name = "Vehicle Name", model = "model_name", livery = 1, extras = {}, allowedRanks = {}, allowedDivisions = {"PATROL"}, inventory = {}}
}