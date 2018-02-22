PoliceConfig = {}
PoliceConfig = setmetatable(PoliceConfig, {})

PoliceConfig.Ranks = {
    'Cadet',
    'Officer',
    'Corporal',
    'Sergeant',
    'Lieutenant',
    'Captain'
}

PoliceConfig.Divisions = {
    'RECRUIT',
    'PATROL'
}

-- Sets division on new characters for divisions should be set to NEW OFFICERS
PoliceConfig.DefaultDivisions = {
    'RECRUIT'
}

PoliceConfig.LoadoutsList = {
    'RECRUIT',
    'PATROL'
}

PoliceConfig.LoadoutsData = {
    ['RECRUIT'] = {
        required_division = "RECRUIT",
        uniform = {
            model = "Nothing",
            components = {
                -- Face (Done)
                {component = 0, drawable = 0, texture = 4},
                -- Long Sleeve
                {component = 3, drawable = 1, texture = 0},
            },
            props = {
                -- Hat
                {component = 0, drawable = 0, texture = 0}
            }
        },
        weapons = {
            {model = "weapon_stungun", attachments = {}, ammo = -1},
            {model = "weapon_fireextinguisher", attachments = {}, ammo = -1},
            {model = "weapon_flashlight", attachments = {}, ammo = -1},
            {model = "weapon_nightstick", attachments = {}, ammo = -1}
        }
    },
    ['PATROL'] = {
        required_division = "PATROL",
        uniform = {
            model = "s_m_y_cop_01", 
            components = {
                -- Face (Done)
                {component = 0, drawable = 0, texture = 4},
                -- Long Sleeve
                {component = 3, drawable = 1, texture = 0},
            }, 
            props = {
                -- Hat
                {component = 0, drawable = 0, texture = 0}
            }
        },
        weapons = {
            {model = "weapon_combatpistol", attachments = {"component_at_pi_flsh"}, ammo = 120},
            {model = "weapon_stungun", attachments = {}, ammo = -1},
            {model = "weapon_nightstick", attachments = {}, ammo = -1},
            {model = "weapon_fireextinguisher", attachments = {}, ammo = -1},
            {model = "weapon_flashlight", attachments = {}, ammo = -1}
        }
    },
}

PoliceConfig.Vehicles = {
    {name = "Vehicle Name", model = "model_name", livery = 1, extras = {}, allowedRanks = {}, allowedDivisions = {"PATROL"}, inventory = {}}
}