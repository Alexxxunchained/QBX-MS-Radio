local QBCore = nil
local ESX = nil

if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
end

if Config.Framework == 'qbcore' then
    QBCore.Functions.CreateUseableItem("radio", function(source)
        TriggerClientEvent('ms_radio:client:useRadio', source)
    end)
elseif Config.Framework == 'esx' then
    ESX.RegisterUsableItem("radio", function(source)
        TriggerClientEvent('ms_radio:client:useRadio', source)
    end)
end

local radioChannels = {}

RegisterNetEvent('ms_radio:server:joinChannel')
AddEventHandler('ms_radio:server:joinChannel', function(channel)
    local src = source
    local Player = nil
    if Config.Framework == 'qbcore' then
        Player = QBCore.Functions.GetPlayer(src)
    elseif Config.Framework == 'esx' then
        Player = ESX.GetPlayerFromId(src)
    end
    if not Player then return end

    for chan, players in pairs(radioChannels) do
        for i, playerData in ipairs(players) do
            if playerData.source == src then
                table.remove(radioChannels[chan], i)
                break
            end
        end
    end

    if not radioChannels[channel] then
        radioChannels[channel] = {}
    end
    
    table.insert(radioChannels[channel], {
        source = src,
        name = Player.getName(),
        job = Player.getJob().name
    })

    for _, playerData in ipairs(radioChannels[channel]) do
        TriggerClientEvent('ms_radio:client:updateChannelMembers', playerData.source, channel, radioChannels[channel])
    end
end)

RegisterNetEvent('ms_radio:server:leaveChannel')
AddEventHandler('ms_radio:server:leaveChannel', function(channel)
    local src = source
    if not radioChannels[channel] then return end

    for i, playerData in ipairs(radioChannels[channel]) do
        if playerData.source == src then
            table.remove(radioChannels[channel], i)
            for _, remainingPlayer in ipairs(radioChannels[channel]) do
                TriggerClientEvent('ms_radio:client:updateChannelMembers', remainingPlayer.source, channel, radioChannels[channel])
            end
            break
        end
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    for channel, players in pairs(radioChannels) do
        for i, playerData in ipairs(players) do
            if playerData.source == src then
                table.remove(radioChannels[channel], i)
                for _, remainingPlayer in ipairs(radioChannels[channel]) do
                    TriggerClientEvent('ms_radio:client:updateChannelMembers', remainingPlayer.source, channel, radioChannels[channel])
                end
                break
            end
        end
    end
end)

RegisterNetEvent('ms_radio:server:updateTalkingState')
AddEventHandler('ms_radio:server:updateTalkingState', function(channel, isTalking)
    local src = source
    if not radioChannels[channel] then return end
    
    for _, playerData in ipairs(radioChannels[channel]) do
        TriggerClientEvent('ms_radio:client:updateTalking', playerData.source, channel, src, isTalking)
    end
end)