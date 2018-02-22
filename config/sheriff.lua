SheriffConfig = {}
SheriffConfig = setmetatable(SheriffConfig, {})

SheriffConfig.Ranks = {
    'Cadet',
    'Deputy',
    'Corporal',
    'Sergeant',
    'Lieutenant',
    'Captain'
}

SheriffConfig.Divisions = {
    'RECRUIT'
}

SheriffConfig.DefaultDivisions = {
    'RECRUIT'
}

SheriffConfig.LoadoutsList = {
    'RECRUIT'
}

SheriffConfig.LoadoutsData = {
    ['RECRUIT'] = {
        required_division = "RECRUIT",
        uniform = {
            model = "Nothing",
            components = {

            },
            props = {

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

SheriffConfig.Vehicles = {
    {name = "Vehicle Name", model = "model_name", livery = 1, extras = {}, allowedRanks = {}, allowedDivisions = {"PATROL"}, inventory = {}}
}