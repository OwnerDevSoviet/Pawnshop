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

RegisterNetEvent('pawnshop:sell5')
AddEventHandler('pawnshop:sell5', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item5)
    local ic = xPlayer.getInventoryItem(Config.Item5).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item5, 1)
        if Config.ItemDirty5 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice5)
        else
          xPlayer.addMoney(Config.ItemSellPrice5)
        end
    end
end)

RegisterNetEvent('pawnshop:sell6')
AddEventHandler('pawnshop:sell6', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item6)
    local ic = xPlayer.getInventoryItem(Config.Item6).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item6, 1)
        if Config.ItemDirty6 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice6)
        else
          xPlayer.addMoney(Config.ItemSellPrice6)
        end
    end
end)

RegisterNetEvent('pawnshop:sell7')
AddEventHandler('pawnshop:sell7', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item7)
    local ic = xPlayer.getInventoryItem(Config.Item7).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item7, 1)
        if Config.ItemDirty7 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice7)
        else
          xPlayer.addMoney(Config.ItemSellPrice7)
        end
    end
end)

RegisterNetEvent('pawnshop:sell8')
AddEventHandler('pawnshop:sell8', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item8)
    local ic = xPlayer.getInventoryItem(Config.Item8).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item8, 1)
        if Config.ItemDirty8 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice8)
        else
          xPlayer.addMoney(Config.ItemSellPrice8)
        end
    end
end)

RegisterNetEvent('pawnshop:sell9')
AddEventHandler('pawnshop:sell9', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item9)
    local ic = xPlayer.getInventoryItem(Config.Item9).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item9, 1)
        if Config.ItemDirty9 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice9)
        else
          xPlayer.addMoney(Config.ItemSellPrice9)
        end
    end
end)

RegisterNetEvent('pawnshop:sell10')
AddEventHandler('pawnshop:sell10', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.Item10)
    local ic = xPlayer.getInventoryItem(Config.Item10).count
    if xItem.count <= xItem.limit  and ic > 0 then
        xPlayer.removeInventoryItem(Config.Item10, 1)
        if Config.ItemDirty10 then
          xPlayer.addAccountMoney('black_money', Config.ItemSellPrice10)
        else
          xPlayer.addMoney(Config.ItemSellPrice10)
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

RegisterNetEvent('pawnshop:buy6')
AddEventHandler('pawnshop:buy6', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy6)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy6).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice6 then
        if Config.ItemBuyDirty6 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice6)
		  xPlayer.addInventoryItem(Config.ItemBuy6, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice6)
			xPlayer.addInventoryItem(Config.ItemBuy6, 1)
        end
    end
end)

RegisterNetEvent('pawnshop:buy7')
AddEventHandler('pawnshop:buy7', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy7)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy7).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice7 then
        if Config.ItemBuyDirty7 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice7)
		  xPlayer.addInventoryItem(Config.ItemBuy7, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice7)
			xPlayer.addInventoryItem(Config.ItemBuy7, 1)
        end
    end
end)

RegisterNetEvent('pawnshop:buy8')
AddEventHandler('pawnshop:buy8', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy8)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy8).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice8 then
        if Config.ItemBuyDirty8 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice8)
		  xPlayer.addInventoryItem(Config.ItemBuy8, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice8)
			xPlayer.addInventoryItem(Config.ItemBuy8, 1)
        end
    end
end)

RegisterNetEvent('pawnshop:buy9')
AddEventHandler('pawnshop:buy9', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy9)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy9).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice9 then
        if Config.ItemBuyDirty9 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice9)
		  xPlayer.addInventoryItem(Config.ItemBuy9, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice9)
			xPlayer.addInventoryItem(Config.ItemBuy9, 1)
        end
    end
end)

RegisterNetEvent('pawnshop:buy10')
AddEventHandler('pawnshop:buy10', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem   = xPlayer.getInventoryItem(Config.ItemBuy10)
	local ic = xPlayer.getInventoryItem(Config.ItemBuy10).count
	local money = xPlayer.getBank()
	local dirty = xPlayer.getAccount('black_money').money
    if xItem.count < xItem.limit and money >= Config.ItemBuyPrice10 then
        if Config.ItemBuyDirty10 then
		  xPlayer.removeAccountMoney('black_money', Config.ItemBuyPrice10)
		  xPlayer.addInventoryItem(Config.ItemBuy10, 1)
		else
			xPlayer.removeMoney(Config.ItemBuyPrice10)
			xPlayer.addInventoryItem(Config.ItemBuy10, 1)
        end
    end
end)
