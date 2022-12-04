local QBCore = exports['qb-core']:GetCoreObject()

-- Eventos
QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('mt-fishing:client:ComecarPesca', source)
    end
end)

RegisterNetEvent('mt-fishing:server:PerderIsco', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = 1

    Player.Functions.RemoveItem('fishingbait', quantity)
end)

RegisterNetEvent('mt-fishing:server:DarPeixe', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = 1
    local prob = math.random(1, 100)

    if prob > 0 and prob < 10 then
        if Player.Functions.AddItem("catfish", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        end
    elseif prob > 10 and prob < 20 then
        if Player.Functions.AddItem("fish", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end

    elseif prob > 20 and prob < 30 then
        if Player.Functions.AddItem("fish2", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 30 and prob < 40 then
        if Player.Functions.AddItem("goldfish", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 40 and prob < 50 then
        if Player.Functions.AddItem("largemouthbass", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 50 and prob < 60 then
        if Player.Functions.AddItem("redfish", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 60 and prob < 70 then
        if Player.Functions.AddItem("salmon", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 70 and prob < 80 then
        if Player.Functions.AddItem("stingray", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 80 and prob < 90 then
        if Player.Functions.AddItem("stripedbass", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 90 and prob < 95 then
        if Player.Functions.AddItem("whale", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    elseif prob > 95 and prob < 101 then
        if Player.Functions.AddItem("whale2", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    else
        if Player.Functions.AddItem("fish", quantity) then
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "CAUGHT SOMETHING", 2000, 'success')
        else
            TriggerClientEvent('okokNotify:Alert', src, "FISHING", "POCKETS FULL", 2000, 'error')
        end
    end
end)

RegisterNetEvent('mt-fishing:server:ComprarCana', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local quantity = 1
    local cash = 'bank'
    local price = 100
    local Item = 'fishingrod'

    if Player.Functions.AddItem(Item, quantity) then
        Player.Functions.RemoveMoney(cash, price)
	TriggerClientEvent('QBCore:Notify', src, 'You buy a Fishing Rod.', 'primary')
    end
end)

RegisterNetEvent('mt-fishing:server:ComprarIsco', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local quantity = 1
    local cash = 'bank'
    local price = 10
    local Item = 'fishingbait'

    if Player.Functions.AddItem(Item, quantity) then
        Player.Functions.RemoveMoney(cash, price)
	TriggerClientEvent('QBCore:Notify', src, 'You buy a Fishing Bait.', 'primary')		
    end
end)

local ItemList = {
    ["peixe_pesca"] =  10,
    ["peixe_exotico_pesca"] =  100,
}

RegisterNetEvent('mt-fishing:server:VenderPeixe', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(ItemList)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-fish")
            TriggerClientEvent('QBCore:Notify', src, "You sell some fish for $"..price)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont/'t have anything to sell..")
    end
end)

RegisterNetEvent('mt-fishing:server:RemoverDinheiroAluger', function()
	local src = source
	local cash = 'bank'
	local price = 1000
	local Player = QBCore.Functions.GetPlayer(src)
		
	Player.Functions.RemoveMoney(cash, price)
end)
