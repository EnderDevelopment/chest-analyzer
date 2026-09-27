local ESX = nil
local chests = {}
local autoOpenEnabled = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('chestanalyzersystem:getChests', function(response)
        chests = response
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, chest in ipairs(chests) do
            local chestCoords = vector3(chest.x, chest.y, chest.z)
            local distance = #(playerCoords - chestCoords)

            if distance < Config.ESPSettings.distance then
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(chestCoords.x, chestCoords.y, chestCoords.z)

                if onScreen then
                    local chestType = Config.ChestTypes[chest.rarity:lower()]
                    DrawText3D(screenX, screenY, chestType.rarity, chestType.color)
                end
            end
        end
    end
end)

function DrawText3D(x, y, text, color)
    SetTextFont(Config.ESPSettings.font)
    SetTextScale(Config.ESPSettings.scale, Config.ESPSettings.scale)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextOutline(Config.ESPSettings.outline)
    SetTextCentre(true)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

RegisterCommand('toggleautoopen', function()
    autoOpenEnabled = not autoOpenEnabled
    ESX.ShowNotification('Auto open ' .. (autoOpenEnabled and 'enabled' or 'disabled'))
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if autoOpenEnabled then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, chest in ipairs(chests) do
                if not chest.opened then
                    local chestCoords = vector3(chest.x, chest.y, chest.z)
                    local distance = #(playerCoords - chestCoords)

                    if distance < 2.0 then
                        TaskGoToCoordAnyMeans(playerPed, chestCoords.x, chestCoords.y, chestCoords.z, Config.AutoOpenSettings.speed, 0, 0, 786603, 0xbf800000)
                        Citizen.Wait(1000)
                        TriggerServerEvent('chestanalyzersystem:openChest', chest.id)
                        break
                    end
                end
            end
        end
    end
end)