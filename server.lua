ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('pawnshop:sell1')
AddEventHandler('pawnshop:sell1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item1)
    local ic = xPlayer.getInventoryItem(Config.Item1).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item1, 1)
        if Config.ItemDirty1 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice1)
        else
          xPlayer.addMoney(Config.ItemSellPrice1)
        end
    end
end)
RegisterNetEvent('pawnshop:sell2')
AddEventHandler('pawnshop:sell2', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item2)
    local ic = xPlayer.getInventoryItem(Config.Item2).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item2, 1)
        if Config.ItemDirty2 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice2)
        else
          xPlayer.addMoney(Config.ItemSellPrice2)
        end
    end
end)
RegisterNetEvent('pawnshop:sell3')
AddEventHandler('pawnshop:sell3', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item3)
    local ic = xPlayer.getInventoryItem(Config.Item3).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item3, 1)
        if Config.ItemDirty3 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice3)
        else
          xPlayer.addMoney(Config.ItemSellPrice3)
        end
    end
end)
RegisterNetEvent('pawnshop:sell4')
AddEventHandler('pawnshop:sell4', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item4)
    local ic = xPlayer.getInventoryItem(Config.Item4).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item4, 1)
        if Config.ItemDirty4 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice4)
        else
          xPlayer.addMoney(Config.ItemSellPrice4)
        end
    end
end)

RegisterNetEvent('pawnshop:buy1')
AddEventHandler('pawnshop:buy1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy1)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy1).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice1 then
        if Config.ItemBuyDirty1 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice1)
		  xPlayer.addInventoryItem(Config.ItemBuy1, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice1)
			xPlayer.addInventoryItem(Config.ItemBuy1, 1)
        end
    end
end)
RegisterNetEvent('pawnshop:buy2')
AddEventHandler('pawnshop:buy2', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy2)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy2).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice2 then
        if Config.ItemBuyDirty2 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice2)
		  xPlayer.addInventoryItem(Config.ItemBuy2, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice2)
			xPlayer.addInventoryItem(Config.ItemBuy2, 1)
        end
    end
end)
RegisterNetEvent('pawnshop:buy3')
AddEventHandler('pawnshop:buy3', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy3)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy3).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice3 then
        if Config.ItemBuyDirty3 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice3)
		  xPlayer.addInventoryItem(Config.ItemBuy3, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice3)
			xPlayer.addInventoryItem(Config.ItemBuy3, 1)
        end
    end
end)
RegisterNetEvent('pawnshop:buy4')
AddEventHandler('pawnshop:buy4', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy4)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy4).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice4 then
        if Config.ItemBuyDirty4 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice4)
		  xPlayer.addInventoryItem(Config.ItemBuy4, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice4)
			xPlayer.addInventoryItem(Config.ItemBuy4, 1)
        end
    end
end)
RegisterNetEvent('pawnshop:buy5')
AddEventHandler('pawnshop:buy5', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy5)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy5).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice5 then
        if Config.ItemBuyDirty5 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice5)
		  xPlayer.addInventoryItem(Config.ItemBuy5, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice5)
			xPlayer.addInventoryItem(Config.ItemBuy5, 1)
        end
    end
end)