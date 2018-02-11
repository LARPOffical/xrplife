JobsConfig = {}
JobsConfig = setmetatable(JobsConfig, {})

JobsConfig.PaycheckTimer = 30 -- 480

JobsConfig.StarterJob = "Unemployed"
JobsConfig.StarterJobPaycheck = 25

JobsConfig.PoliceJobName = "Police Officer"
JobsConfig.PoliceJobPaycheck = 300
JobsConfig.PoliceJobLocations = {
    {x = 1848.6, y = 3689.6, z = 34.2},
}

JobsConfig.SheriffJobName = "Sheriff's Deputy"
JobsConfig.SheriffJobPaycheck = 300
JobsConfig.SheriffJobLocations = {
    {x = 0.0, y = 0.0, z = 0.0},
}

JobsConfig.StateJobName = "State Trooper"
JobsConfig.StateJobPaycheck = 300
JobsConfig.StateJobLocations = {
    {x = 0.0, y = 0.0, z = 0.0},
}

--[[ DONT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING ]]--

JobsConfig.Jobs = {
    -- Starter Job
    [JobsConfig.StarterJob] = {name = JobsConfig.StarterJob, whitelisted = false, paycheck = JobsConfig.StarterJobPaycheck, markers = false},
    -- Police Job
    [JobsConfig.PoliceJobName] = {name = JobsConfig.PoliceJobName, whitelisted = true, paycheck = JobsConfig.PoliceJobPaycheck, markers = JobsConfig.PoliceJobLocations},
    -- Sheriff Job
    [JobsConfig.SheriffJobName] = {name = JobsConfig.SheriffJobName, whitelisted = true, paycheck = JobsConfig.SheriffJobPaycheck, markers = false},
    -- State Job
    [JobsConfig.StateJobName] = {name = JobsConfig.StateJobName, whitelisted = true, paycheck = JobsConfig.StateJobPaycheck, markers = false}
}

JobsConfig.Markers = {
    {jobName = JobsConfig.Jobs[JobsConfig.PoliceJobName].name, jobPos = JobsConfig.Jobs[JobsConfig.PoliceJobName].markers}
}