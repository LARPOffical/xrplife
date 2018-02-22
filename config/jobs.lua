JobsConfig = {}
JobsConfig = setmetatable(JobsConfig, {})

-- Time in seconds between paychecks
JobsConfig.PaycheckTimer = 480 -- seconds

-- Starter Job (Default)
JobsConfig.StarterJob = "Unemployed"
JobsConfig.StarterJobPaycheck = 25

-- Police Job (Default)
JobsConfig.PoliceJobName = "Police Officer"
JobsConfig.PoliceJobPaycheck = 300
JobsConfig.PoliceJobLocations = {
    {x = 1848.6, y = 3689.6, z = 34.2},
    {x = 459.0, y = -992.4, z = 30.6}
}

-- Sheriff Job (Default)
JobsConfig.SheriffJobName = "Sheriff's Deputy"
JobsConfig.SheriffJobPaycheck = 300
JobsConfig.SheriffJobLocations = {
    {x = 1849.6, y = 3687.8, z = 34.2},
}

-- State Police Job (Default)
JobsConfig.StateJobName = "State Trooper"
JobsConfig.StateJobPaycheck = 300
JobsConfig.StateJobLocations = {
    {x = 1850.7, y = 3685.67, z = 34.2},
}

-- This is the job names passed to the menus if they are restricted.
JobsConfig.JobsForMenus = {
    {name = JobsConfig.PoliceJobName, actions = {"LEO"}},
    {name = JobsConfig.SheriffJobName, actions = {"LEO"}},
    {name = JobsConfig.StateJobName, actions = {"LEO"}}
}

-- Where LEO Loadout markers are on the map.
JobsConfig.LeoLoadoutMarkers = {
    {x = 1857.1, y = 3688.7, z = 34.2},
    {x = 451.4, y = -980.2, z = 30.6}
}

-- Jobs that are allowed to use the LEO Loadout Markers
JobsConfig.AllowedUseLoadoutMarkers = {
    JobsConfig.PoliceJobName,
    JobsConfig.SheriffJobName,
    JobsConfig.StateJobName
}

-- [[ DO NOT ADD OR EDIT DOWN HERE UNLESS YOU KNOW WHAT YOU ARE DOING ]]

-- Sets easy access to job data so you can target easier. ['JobVariable or pass job to target rows of data'].
JobsConfig.Jobs = {
    -- Starter Job
    [JobsConfig.StarterJob] = {
        name = JobsConfig.StarterJob, 
        whitelisted = false, 
        paycheck = JobsConfig.StarterJobPaycheck, 
        markers = false,
        leo = false
    },

    -- Police Job
    [JobsConfig.PoliceJobName] = {
        name = JobsConfig.PoliceJobName, 
        whitelisted = true, 
        paycheck = JobsConfig.PoliceJobPaycheck, 
        markers = JobsConfig.PoliceJobLocations,
        leo = true,
        loadouts = PoliceConfig.LoadoutsList, 
        loadout_data = PoliceConfig.LoadoutsData
    },

    -- Sheriff Job
    [JobsConfig.SheriffJobName] = {
        name = JobsConfig.SheriffJobName, 
        whitelisted = true, 
        paycheck = JobsConfig.SheriffJobPaycheck, 
        markers = JobsConfig.SheriffJobLocations,
        leo = false,
        loadouts = {}, 
        loadout_data = {}
    },

    -- State Job
    [JobsConfig.StateJobName] = {
        name = JobsConfig.StateJobName, 
        whitelisted = true, 
        paycheck = JobsConfig.StateJobPaycheck, 
        markers = JobsConfig.StateJobLocations,
        leo = false,
        loadouts = {}, 
        loadout_data = {}
    }
}

-- Allows me to loop through job markers as the table above can't be looped through.
JobsConfig.Markers = {
    -- Police Job Markers
    {jobName = JobsConfig.Jobs[JobsConfig.PoliceJobName].name, jobPos = JobsConfig.Jobs[JobsConfig.PoliceJobName].markers},
    -- Sheriff Job Markers
    {jobName = JobsConfig.Jobs[JobsConfig.SheriffJobName].name, jobPos = JobsConfig.Jobs[JobsConfig.SheriffJobName].markers},
    -- State Job Markers
    {jobName = JobsConfig.Jobs[JobsConfig.StateJobName].name, jobPos = JobsConfig.Jobs[JobsConfig.StateJobName].markers}
}