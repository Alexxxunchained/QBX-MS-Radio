Config = {}

Config.Debug = false

Config.MaxFrequency = 999   -- Maximum channel number
Config.MinFrequency = 1    -- Minimum channel number 
Config.DefaultVolume = 50  -- Default volume

-- Job Channel List with Restrictions
Config.JobChannels = {
    police = {
        title = "LSPD Radio",
        channels = {
            { name = "Dispatch Center", channel = 1 },
            { name = "Tactical-01", channel = 2 },
            { name = "Tactical-02", channel = 3 },
            { name = "Special Police Group", channel = 4 },
            { name = "Patrol-01", channel = 5 },
            { name = "Patrol-02", channel = 6 },
            { name = "Meeting Channel", channel = 7 },
            { name = "IA Internal Affairs", channel = 8 }
        }
    },
    ambulance = {
        title = "EMS Radio",
        channels = {
            { name = "Emergency Center", channel = 9 },
            { name = "Medical-01", channel = 10 },
            { name = "Medical-02", channel = 11 },
            { name = "Consultation-01", channel = 12 },
            { name = "Consultation-02", channel = 13 },
            { name = "Emergency-01", channel = 14 },
            { name = "Emergency-02", channel = 15 },
            { name = "Trauma Team", channel = 16 }
        }
    },
    gov = {
        title = "Government Radio",
        channels = {
            { name = "Municipal Center", channel = 17 },
            { name = "Office-01", channel = 18 },
            { name = "Office-02", channel = 19 },
            { name = "Meeting Channel", channel = 20 },
            { name = "Emergency Channel", channel = 21 },
            { name = "IA Internal Affairs-01", channel = 22 },
            { name = "IA Internal Affairs-02", channel = 23 },
            { name = "City Public Channel", channel = 24 } -- This is a public channel, not restricted
        }
    },
    ymj = {
        title = "Immigration Bureau",
        channels = {
            { name = "Immigration Center", channel = 25 },
            { name = "Office-01", channel = 26 },
            { name = "Office-02", channel = 27 },
            { name = "Meeting Channel", channel = 28 },
            { name = "Emergency Channel", channel = 29 },
            { name = "Field-01", channel = 30 },
            { name = "Field-02", channel = 31 },
            { name = "Public Channel", channel = 32 } -- This is a public channel, not restricted
        }
    },
    mechanic = {
        title = "AK Mechanics",
        channels = {
            { name = "Public Channel", channel = 33 },
            { name = "Workshop-01", channel = 34 },
            { name = "Workshop-02", channel = 35 },
            { name = "Meeting Channel", channel = 36 },
            { name = "Emergency Channel", channel = 37 }
        }
    },
    mechanic2 = {
        title = "Psycho Mechanics",
        channels = {
            { name = "Public Channel", channel = 38 },
            { name = "Workshop-01", channel = 39 },
            { name = "Workshop-02", channel = 40 },
            { name = "Meeting Channel", channel = 41 },
            { name = "Emergency Channel", channel = 42 }
        }
    },
    catcafe = {
        title = "UwU Cat Cafe",
        channels = {
            { name = "Public Channel", channel = 43 },
            { name = "Front Hall", channel = 44 },
            { name = "Kitchen", channel = 45 },
            { name = "Meeting Channel", channel = 46 },
            { name = "Emergency Channel", channel = 47 }
        }
    },
}

-- 限制频道设置 Restricted channels
-- I know this looks dumb, but it's a good way to restrict channels, Im just lazy to fix all of those channels
Config.RestrictedChannels = {
    [1] = {
        police = true,
        ambulance = true,
        gov = true
    },
    [2] = {
        police = true
    },
    [3] = {
        police = true
    },
    [4] = {
        police = true
    },
    [5] = {
        police = true
    },
    [6] = {
        police = true
    },
    [7] = {
        police = true
    },
    [8] = {
        police = true
    },
    [9] = {
        ambulance = true
    },
    [10] = {
        ambulance = true
    },
    [11] = {
        ambulance = true
    },
    [12] = {
        ambulance = true
    },
    [13] = {
        ambulance = true
    },
    [14] = {
        ambulance = true
    },
    [15] = {
        ambulance = true
    },
    [16] = {
        ambulance = true
    },
    [17] = {
        gov = true
    },
    [18] = {
        gov = true
    },
    [19] = {
        gov = true
    },
    [20] = {
        gov = true
    },
    [21] = {
        gov = true
    },
    [22] = {
        gov = true
    },
    [23] = {
        gov = true
    },
    [25] = {
        ymj = true
    },
    [26] = {
        ymj = true
    },
    [27] = {
        ymj = true
    },
    [28] = {
        ymj = true
    },
    [29] = {
        ymj = true
    },
    [30] = {
        ymj = true
    },
    [31] = {
        ymj = true
    },
    [33] = {
        mechanic = true
    },
    [34] = {
        mechanic = true
    },
    [35] = {
        mechanic = true
    },
    [36] = {
        mechanic = true
    },
    [37] = {
        mechanic = true
    },
    [38] = {
        mechanic2 = true
    },
    [39] = {
        mechanic2 = true
    },
    [40] = {
        mechanic2 = true
    },
    [41] = {
        mechanic2 = true
    },
    [42] = {
        mechanic2 = true
    },
    [43] = {
        catcafe = true
    },
    [44] = {
        catcafe = true
    },
    [45] = {
        catcafe = true
    },
    [46] = {
        catcafe = true
    },
    [47] = {
        catcafe = true
    },
}

-- UI Settings
Config.UI = {
    position = "right", -- Channel list position
    width = "300px",   -- Channel list width
    margin = "20px"    -- Channel list margin
}

-- Sound Configuration
Config.Sounds = {
    join = 'radio_on',
    leave = 'radio_off',
    switch = 'radio_beep'
}