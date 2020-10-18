ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
end)


local pawn = Config.PawnShop
CreateThread(function()
    print("^2Main thrd running")
    for k, v in ipairs(pawn) do
        local blip = AddBlipForCoord(v.x, v.y)
        SetBlipSprite(blip, 606)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, 0.9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("PawnShop")
        EndTextCommandSetBlipName(blip)
    end
    print('^2Made blips')

    while true do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k, v in ipairs(pawn) do
            if #(coords - v.xyz) < Config.Distance then
                print('^2 [MAIN THRD]: Inside IF: #(coords - v.xyz) < Config.Distance')
                DrawMarker(Config.MarkerStyle, v.xyz, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size1, Config.Size2, Config.Size3 ,Config.Color.r, Config.Color.g, Config.Color.b, 200, false, true, 2, true, false, false, false)
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to sell yo shizz')
                if #(coords - v.xyz) < 2.0 and IsControlJustPressed(1, 38) then
                    print('^2 [MAIN THRD]: Inside IF: #(coords - v.xyz) < 2.0 and IsControlJustPressed(1, 38)')
                  OpenMenu()
                end
            end
        end
    end
end)
---------------------
local isMenuOpen = false --sell
local isMenu2Open = false --buy


function OpenMenu()
    print('^2Opening seller menu')
   buildOptions("sell") --just to get fresh results

    isMenuOpen = true

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title    = "Sell Menu",
        align    = "center",
        elements = options["sell"]
    }, function(data, menu)
       -- menu.close() --Uncomment these 2 if you want menu to close after each item selection
        --isMenuOpen = false
            sellItem(data.current.value)
    end,
    function(data, menu) -- Closes Menu
        menu.close()
        isMenuOpen = false
    end)

end

function OpenSecondMenu()
    print('^2Opening buyer menu')
   buildOptions("buy") --just to get fresh results
   isMenu2Open = true
   ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'second_menu', {
       title    = "Buy menu",
       align    = "center",
       elements = options["buy"]
   }, function(data, menu)
      -- menu.close() --Uncomment these 2 if you want menu to close after each item selection
       --isMenu2Open = false
       buyItem(data.current.value)
   end,
   function(data, menu) -- Closes Menu
       menu.close()
       isMenu2Open = false
   end)
end


function sellItem(value)
local chosen = tracers["sell"][value]
TriggerServerEvent('pawnshop:sell', chosen)
end
function buyItem(value)
   local chosen = tracers["buy"][value]
	TriggerServerEvent('pawnshop:buy', chosen)
end
