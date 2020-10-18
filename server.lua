ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
CreateThread(function()
  print("^3Registering server cb: "..'pawnshop:GetOwnership')
  ESX.RegisterServerCallback('pawnshop:GetOwnership', function(cb, playerId, item)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local xItem   = xPlayer.getInventoryItem(item)
    if xItem.count > 0 then
    cb(true)
    else
    cb(false)
    end
  end)
end)

RegisterNetEvent("pawnshop:sell")
AddEventHandler("pawnshop:sell", function(data)
  local xPlayer = ESX.GetPlayerFromId(source)
  local xItem   = xPlayer.getInventoryItem(data.name)
  if xItem.count <= xItem.limit and xItem.count > 0 then
    xPlayer.removeInventoryItem(data.name, 1)
    if data.dirty then
      xPlayer.addAccountMoney('black_money', data.sellP)
    else
      xPlayer.addMoney(data.sellP)

    end
  end
end)
RegisterNetEvent("pawnshop:buy")
AddEventHandler("pawnshop:buy", function(data)
  local xPlayer = ESX.GetPlayerFromId(source)
  local xItem   = xPlayer.getInventoryItem(Config.ItemBuy1)
  local money = xPlayer.getBank()
  local dirty = xPlayer.getAccount('black_money').money
if xItem.count < xItem.limit and (money > data.buyP or dirty > data.buyP) then
if data.dirty then
  xPlayer.removeAccountMoney('black_money', data.buyP)
  xPlayer.addInventoryItem(data.name, 1)
else
  xPlayer.removeMoney(data.buyP)
  xPlayer.addInventoryItem(data.name, 1)
end
end
end)