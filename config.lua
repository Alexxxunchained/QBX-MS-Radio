Config = {}

Config.Debug = false

Config.MaxFrequency = 999   -- 最大频道数 max channel
Config.MinFrequency = 1    -- 最小频道数 min channel
Config.DefaultVolume = 50  -- 默认音量 default volume

-- 职业频道列表 job channel with restric
Config.JobChannels = {
    police = { -- job name
        title = "警察专频", -- LSPD
        channels = {
            { name = "调度中心", channel = 1 }, -- dispatch center
            { name = "战术-01", channel = 2 }, -- tactical-01
            { name = "战术-02", channel = 3 }, -- tactical-02
            { name = "特警组", channel = 4 }, -- special police group
            { name = "巡逻-01", channel = 5 }, -- patrol-01
            { name = "巡逻-02", channel = 6 }, -- patrol-02
            { name = "会议频道", channel = 7 }, -- meeting channel
            { name = "IA内务", channel = 8 } -- IA internal affairs
        }
    },
    ambulance = {
        title = "EMS专频", -- EMS
        channels = {
            { name = "急救中心", channel = 9 }, -- emergency center
            { name = "医疗-01", channel = 10 }, -- medical-01
            { name = "医疗-02", channel = 11 }, -- medical-02
            { name = "会诊-01", channel = 12 }, -- consultation-01
            { name = "会诊-02", channel = 13 }, -- consultation-02
            { name = "紧急-01", channel = 14 }, -- emergency-01
            { name = "紧急-02", channel = 15 }, -- emergency-02
            { name = "创伤小组", channel = 16 } -- trauma group
        }
    },
    gov = {
        title = "政府专频", -- GOV
        channels = {
            { name = "市政中心", channel = 17 }, -- municipal center
            { name = "办公-01", channel = 18 }, -- office-01
            { name = "办公-02", channel = 19 }, -- office-02
            { name = "会议频道", channel = 20 }, -- meeting channel
            { name = "紧急频道", channel = 21 }, -- emergency channel
            { name = "IA内务-01", channel = 22 }, -- IA internal affairs-01
            { name = "IA内务-02", channel = 23 }, -- IA internal affairs-02
            { name = "市政府对公频道", channel = 24 } -- 该频道为无限制的对外公开频道, 所有人都可以进 City government public channel Warning: This is a public channel, so it is not restricted
        }
    },
    ymj = {
        title = "移民局专频", -- Immigration Bureau
        channels = {
            { name = "移民中心", channel = 25 }, -- immigration center
            { name = "办公-01", channel = 26 }, -- office-01
            { name = "办公-02", channel = 27 }, -- office-02
            { name = "会议频道", channel = 28 }, -- meeting channel
            { name = "紧急频道", channel = 29 }, -- emergency channel
            { name = "外勤-01", channel = 30 }, -- patrol-01
            { name = "外勤-02", channel = 31 }, -- patrol-02
            { name = "移民局对公频道", channel = 32 } -- 该频道为无限制的对外公开频道, 所有人都可以进 Immigration Bureau public channel Warning: This is a public channel, so it is not restricted
        }
    },
    mechanic = {
        title = "AK技工厂", -- Change this lable to ur mechanic job lable
        channels = {
            { name = "公共频道", channel = 33 }, -- public channel
            { name = "工坊-01", channel = 34 }, -- workshop-01
            { name = "工坊-02", channel = 35 }, -- workshop-02
            { name = "会议频道", channel = 36 }, -- meeting channel
            { name = "紧急频道", channel = 37 } -- emergency channel
        }
    },
    mechanic2 = {
        title = "Psycho技工厂", -- Change this lable to ur mechanic job lable
        channels = {
            { name = "公共频道", channel = 38 }, -- public channel
            { name = "工坊-01", channel = 39 }, -- workshop-01
            { name = "工坊-02", channel = 40 }, -- workshop-02
            { name = "会议频道", channel = 41 }, -- meeting channel
            { name = "紧急频道", channel = 42 } -- emergency channel
        }
    },
    catcafe = {
        title = "UwU猫咖", -- Cat Cafe
        channels = {
            { name = "公共频道", channel = 43 }, -- public channel
            { name = "前厅频道", channel = 44 }, -- front hall channel
            { name = "后厨后厨", channel = 45 }, -- kitchen channel
            { name = "会议频道", channel = 46 }, -- meeting channel
            { name = "紧急频道", channel = 47 } -- emergency channel
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

-- UI设置
-- UI settings, I made this cuz some of player has different screen solution, so I made this to make it more flexible
Config.UI = {
    position = "right", -- 频道列表位置 channel list position
    width = "300px",   -- 宽度 channel list width
    margin = "20px"    -- 边距 channel list margin
}

-- 添加声音配置
-- Add sound configuration, not fully implemented yet
Config.Sounds = {
    join = 'radio_on',
    leave = 'radio_off',
    switch = 'radio_beep'
}