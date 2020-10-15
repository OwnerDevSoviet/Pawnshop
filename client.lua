ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function Draw3DText(x, y, z, scl_factor, text)
    local closeBy, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local dist = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local size = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local size = size * fov * scl_factor
    if closeBy then
        SetTextScale(0.0, size)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local pawn = Config.PawnShop
Citizen.CreateThread(function()
    for k, v in ipairs(pawn) do
        local blip = AddBlipForCoord(v.x, v.y)
        SetBlipSprite(blip, 606)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, 0.9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Pineapple PawnShop")
        EndTextCommandSetBlipName(blip)
    end
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        for k, v in ipairs(pawn) do
            if #(coords - v.xyz) < Config.Distance then
                DrawMarker(Config.MarkerStyle, v.xyz, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size1, Config.Size2, Config.Size3 ,Config.Color.r, Config.Color.g, Config.Color.b, 200, false, true, 2, true, false, false, false)
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to sell yo shizz')
                if #(coords - v.xyz) < 2.0 and IsControlJustPressed(1, 38) then
                  OpenMenu()
                end
            end
        end
    end
end)
---------------------
local isMenuOpen = false

local options = {
	{label = ' [1] ' .. Config.Item1label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice1 .. ' </span>', value = 'sell_item1'},
	{label = ' [2] ' .. Config.Item2label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice2 .. ' </span>', value = 'sell_item2'},
	{label = ' [3] ' .. Config.Item3label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice3 .. ' </span>', value = 'sell_item3'},
    {label = ' [4] ' .. Config.Item4label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice4 .. ' </span>', value = 'sell_item4'},
    {label = ' [5] ' .. Config.Item5label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice5 .. ' </span>', value = 'sell_item5'},
	--{label = ' [6] ' .. Config.Item6label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice6 .. ' </span>', value = 'sell_item6'},
	--{label = ' [7] ' .. Config.Item7label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice7 .. ' </span>', value = 'sell_item7'},
    --{label = ' [8] ' .. Config.Item8label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice8 .. ' </span>', value = 'sell_item8'},
   -- {label = ' [9] ' .. Config.Item9label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice9 .. ' </span>', value = 'sell_item'},
	--{label = ' [10] ' .. Config.Item10label.. ' - <span style="color:green;">$' .. Config.ItemSellPrice10 .. ' </span>', value = 'sell_item10'},
	{label = "Trying to Buy?", value = 'open_secondary'},
}

function OpenMenu()
    isMenuOpen = true

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title    = "Sell Menu",
        align    = "center",
        elements = options
    }, function(data, menu)
       -- menu.close() --Uncomment if you want menu to close after each item selection
        isMenuOpen = false

         if data.current.value == 'sell_item1' then
            SellItem1()
         end
         if data.current.value == 'sell_item2' then
            SellItem2()
         end
         if data.current.value == 'sell_item3' then
            SellItem3()
         end
		 if data.current.value == 'sell_item4' then
            SellItem4()
		 end
		 if data.current.value == 'open_secondary' then
            OpenSecondMenu()
		 end
		 if data.current.value == 'sell_item6' then
            SellItem6()
		 end
		 if data.current.value == 'sell_item7' then
            SellItem7()
         end
         if data.current.value == 'sell_item8' then
            SellItem8()
         end
         if data.current.value == 'sell_item9' then
            SellItem9()
         end
		 if data.current.value == 'sell_item10' then
            SellItem10()
         end
    end,
    function(data, menu) -- Closes Menu
        menu.close()
        isMenuOpen = false
    end)

end

local isMenu2Open = false

local opt = {
	{label = ' [1] ' ..  Config.Itemlabel1.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice1 .. ' </span>', value = 'buy_item1'},
	{label = ' [2] ' ..   Config.Itemlabel2.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice2 .. ' </span>', value = 'buy_item2'},
	{label = ' [3] ' ..   Config.Itemlabel3.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice3 .. ' </span>', value = 'buy_item3'},
	{label = ' [4] ' ..   Config.Itemlabel4.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice4 .. ' </span>', value = 'buy_item4'},
    {label = ' [5] ' ..   Config.Itemlabel5.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice5 .. ' </span>', value = 'buy_item5'},
    --{label = ' [6] ' ..   Config.Itemlabel6.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice6 .. ' </span>', value = 'buy_item6'},
    --{label = ' [7] ' ..   Config.Itemlabel7.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice7 .. ' </span>', value = 'buy_item7'},
    --{label = ' [8] ' ..   Config.Itemlabel8.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice8 .. ' </span>', value = 'buy_item8'},
    --{label = ' [9] ' ..   Config.Itemlabel9.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice9 .. ' </span>', value = 'buy_item9'},
    --{label = ' [10] ' ..   Config.Itemlabel10.. ' - <span style="color:green;">$' .. Config.ItemBuyPrice10 .. ' </span>', value = 'buy_item10'},

}

function OpenSecondMenu()
    isMenu2Open = true

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'second_menu', {
        title    = "Buy menu",
        align    = "center",
        elements = opt
    }, function(data, menu)
       -- menu.close() --Uncomment if you want menu to close after each item selection
        isMenu2Open = false

         if data.current.value == 'buy_item1' then
            BuyItem1()
         end
         if data.current.value == 'buy_item2' then
            BuyItem2()
         end
         if data.current.value == 'buy_item3' then
            BuyItem3()
         end
		 if data.current.value == 'buy_item4' then
            BuyItem4()
		 end
		 if data.current.value == 'buy_item5' then
            BuyItem5()
         end
         if data.current.value == 'buy_item6' then
            BuyItem6()
         end
         if data.current.value == 'buy_item6' then
            BuyItem7()
         end
         if data.current.value == 'buy_item7' then
            BuyItem8()
         end
         if data.current.value == 'buy_item8' then
            BuyItem5()
         end
         if data.current.value == 'buy_item9' then
            BuyItem9()
         end
         if data.current.value == 'buy_item10' then
            BuyItem10()
         end
    end,
    function(data, menu) -- Closes Menu
        menu.close()
        isMenu2Open = false
    end)

end

function SellItem1()
	TriggerServerEvent('pawnshop:sell1')
end

function SellItem2()
	TriggerServerEvent('pawnshop:sell2')
end

function SellItem3()
	TriggerServerEvent('pawnshop:sell3')
end

function SellItem4()
	TriggerServerEvent('pawnshop:sell4')
end

function SellItem5()
	TriggerServerEvent('pawnshop:sell5')
end

function SellItem6()
	TriggerServerEvent('pawnshop:sell6')
end

function SellItem7()
	TriggerServerEvent('pawnshop:sell7')
end

function SellItem8()
	TriggerServerEvent('pawnshop:sell8')
end

function SellItem9()
	TriggerServerEvent('pawnshop:sell9')
end

function SellItem10()
	TriggerServerEvent('pawnshop:sell10')
end
function BuyItem1()
	TriggerServerEvent('pawnshop:buy1')
end

function BuyItem2()
	TriggerServerEvent('pawnshop:buy2')
end

function BuyItem3()
	TriggerServerEvent('pawnshop:buy3')
end

function BuyItem4()
	TriggerServerEvent('pawnshop:buy4')
end

function BuyItem5()
	TriggerServerEvent('pawnshop:buy5')
end

function BuyItem6()
	TriggerServerEvent('pawnshop:buy6')
end

function BuyItem7()
	TriggerServerEvent('pawnshop:buy7')
end

function BuyItem8()
	TriggerServerEvent('pawnshop:buy8')
end

function BuyItem9()
	TriggerServerEvent('pawnshop:buy9')
end

function BuyItem10()
	TriggerServerEvent('pawnshop:buy10')
end
