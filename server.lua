local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('chestanalyzersystem:getChests', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM chests', {}, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('chestanalyzersystem:openChest')
AddEventHandler('chestanalyzersystem:openChest', function(chestId)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE chests SET opened = TRUE WHERE id = @id', {
        ['@id'] = chestId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addInventoryItem('money', math.random(100, 500))
            TriggerClientEvent('esx:showNotification', source, 'Chest opened!')
        end
    end)
end)