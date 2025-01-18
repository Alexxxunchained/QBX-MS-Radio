local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("radio", function(source)
    TriggerClientEvent('ms_radio:client:useRadio', source)
end)

-- AddEventHandler('onResourceStart', function(resourceName)
--     if (GetCurrentResourceName() ~= resourceName) then
--         return
--     end
-- end)

-- AddEventHandler('onResourceStop', function(resourceName)
--     if (GetCurrentResourceName() ~= resourceName) then
--         return
--     end
-- end)

local radioChannels = {}

RegisterNetEvent('ms_radio:server:joinChannel')
AddEventHandler('ms_radio:server:joinChannel', function(channel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
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
        name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        job = Player.PlayerData.job.name
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