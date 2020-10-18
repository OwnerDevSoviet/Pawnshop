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
options = {}
--target: either sell or buy
function HasItem(item)
    local result = nil
    ESX.TriggerServerCallback('esx:getSharedObject', function(bool)
        result = bool
    end, GetPlayerServerId(PlayerId()), item)
    while result == nil do
        Wait(50)
    end
    return result

end
function buildOptions(target)
    local help = {
        ['sell'] = 'sellP',
        ['buy'] = 'buyP'
    }
 local fname = help[target]
for k,v in ipairs(Config.items) do --pure shit solution here
    if v[fname] ~= 0 then
            if target == 'sell' then
        if HasItem(v.name) then
    options[target][k].label = " ["..k.."] "..v.label..' - <span style="color:green;">$'..v[fname]..' </span>'
    options[target][k].value = target..'_item'..k
        end
    else
        options[target][k].label = " ["..k.."] "..v.label..' - <span style="color:green;">$'..v[fname]..' </span>'
    options[target][k].value = target..'_item'..k
    end
    end
end
buildTracer(target, "value")
end
local tracers = {}
function buildTracer(target, field)
for k,v in ipairs(options[target]) do
tracers[v[field]] = v
end
end