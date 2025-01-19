local QBCore = exports['qb-core']:GetCoreObject()
local radioMenu = false
local onRadio = false
local radioChannel = 0
local radioVolume = Config.DefaultVolume
local isTalking = false

-- c从qbx_radio借用(偷来)的代码 Borrowed(Stolen) from qbx_radio
local function connectToRadio(channel)
    if channel < Config.MinFrequency or channel > Config.MaxFrequency then
        QBCore.Functions.Notify('Invalid channel', 'error')
        return
    end

    if Config.RestrictedChannels[channel] then
        local hasPermission = Config.RestrictedChannels[channel][QBCore.Functions.GetPlayerData().job.name]
        if not hasPermission then
            QBCore.Functions.Notify('You don\'t have permission to use this channel', 'error')
            return
        end
    end

    radioChannel = channel
    exports['pma-voice']:setRadioChannel(channel)
    exports['pma-voice']:setVoiceProperty('radioEnabled', true)

    TriggerServerEvent("InteractSound_SV:PlayOnSource", "radio", 0.1) -- Play join sound
    
    local channelName = nil
    if Config.JobChannels then
        for _, jobData in pairs(Config.JobChannels) do
            for _, chanData in ipairs(jobData.channels) do
                if chanData.channel == channel then
                    channelName = chanData.name
                    break
                end
            end
            if channelName then break end
        end
    end

    SendNUIMessage({
        type = 'updateChannel',
        channel = channel,
        channelName = channelName
    })
    
    QBCore.Functions.Notify('Joined channel: ' .. channel, 'success')
    
    TriggerServerEvent('ms_radio:server:joinChannel', channel)
end

local function leaveRadio()

    if radioChannel ~= 0 then
        TriggerServerEvent('ms_radio:server:leaveChannel', radioChannel)
    end
    
    radioChannel = 0
    exports['pma-voice']:setRadioChannel(0)
    exports['pma-voice']:setVoiceProperty('radioEnabled', false)
    
    SendNUIMessage({
        type = 'updateChannel',
        channel = 0
    })
    
    QBCore.Functions.Notify('Left channel', 'error')
end

RegisterNetEvent('ms_radio:client:useRadio')
AddEventHandler('ms_radio:client:useRadio', function()
    if not radioMenu then
        local PlayerData = QBCore.Functions.GetPlayerData()
        local jobChannels = Config.JobChannels[PlayerData.job.name]
        
        SendNUIMessage({
            type = 'openRadio',
            job = PlayerData.job.name,
            jobChannels = jobChannels
        })
        SetNuiFocus(true, true)
        radioMenu = true
    end
end)

RegisterNUICallback('joinChannel', function(data, cb)
    connectToRadio(tonumber(data.channel))
    cb('ok')
end)

RegisterNUICallback('leaveChannel', function(_, cb)
    leaveRadio()
    cb('ok')
end)

RegisterNUICallback('closeRadio', function(_, cb)
    SetNuiFocus(false, false)
    radioMenu = false
    SendNUIMessage({
        type = 'hideRadio'
    })
    cb('ok')
end)

RegisterNUICallback('setVolume', function(data, cb)
    radioVolume = tonumber(data.volume)
    exports['pma-voice']:setRadioVolume(radioVolume)
    cb('ok')
end)

RegisterNetEvent('ms_radio:client:updateChannelMembers')
AddEventHandler('ms_radio:client:updateChannelMembers', function(channel, members)
    if radioChannel == channel then
        SendNUIMessage({
            type = 'updateMembers',
            members = members
        })
    end
end)

CreateThread(function()
    while true do
        Wait(200)
        if radioChannel ~= 0 then
            local talking = MumbleIsConnected() and NetworkIsPlayerTalking(PlayerId())
            
            if isTalking ~= talking then
                isTalking = talking
                TriggerServerEvent('ms_radio:server:updateTalkingState', radioChannel, isTalking)
            end
        end
    end
end)

RegisterNetEvent('ms_radio:client:updateTalking')
AddEventHandler('ms_radio:client:updateTalking', function(channel, source, isSpeaking)
    if radioChannel == channel then
        SendNUIMessage({
            type = 'updateTalking',
            source = source,
            isSpeaking = isSpeaking
        })
    end
end)

-- this part is to fix the bug that the radio list will still showing when the player is in the pause menu
CreateThread(function()
    while true do
        Wait(500)
        if IsPauseMenuActive() then
            SendNUIMessage({
                type = 'hideAll'
            })
        elseif radioChannel ~= 0 then
            SendNUIMessage({
                type = 'showPermanent'
            })
        end
    end
end)