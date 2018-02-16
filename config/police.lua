PoliceConfig = {}
PoliceConfig = setmetatable(PoliceConfig, {})

PoliceConfig.Ranks = {
    "Police Officer",
    "Senior Officer",
    "Corporal",
    "Sergeant",
    "Lieutenant",
    "Captain"
}

PoliceConfig.Divisions = {
    "PATROL",
    "SWAT"
}

PoliceConfig.LoadoutsList = {
    "TRAFFIC",
    "PATROL",
    "SWAT"
}

PoliceConfig.LoadoutsData = {
    ['TRAFFIC_1'] = {
        uniform = {
            model = "s_m_y_cop_01", 
            components = {
                {drawable = 1, texture = 1}
            }, 
            props = {}
        },
        weapons = {
            {model = "WEAPON_COMBATPISTOL", attachments = {}, ammo = 120},
            {model = "WEAPON_STUNGUN", attachments = {}, ammo = -1},
            {model = "WEAPON_PUMPSHOTGUN", attachments = {}, ammo = 50},
            {model = "WEAPON_NIGHTSTICK", attachments = {}, ammo = -1}
        }
    },

    ['TRAFFIC_2'] = {
        uniform = {
            model = "s_m_y_cop_01", 
            components = {}, 
            props = {}
        },
        weapons = {
            {model = "WEAPON_COMBATPISTOL", attachments = {}, ammo = 80},
            {model = "WEAPON_STUNGUN", attachments = {}, ammo = -1},
            {model = "WEAPON_CARBINERIFLE", attachments = {}, ammo = 150},
            {model = "WEAPON_NIGHTSTICK", attachments = {}, ammo = -1}
        }
    }
}

PoliceConfig.Vehicles = {
    {name = "Supervisor Tahoe", model = "model_tahoe", livery = "livery_something", allowedRanks = {"Sergeant", "Lieutenant", "Captain"}, allowedDivisions = {}}
}