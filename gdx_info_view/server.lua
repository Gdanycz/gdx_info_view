ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
	
TriggerEvent('es:addCommand', 'job', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label

--TriggerClientEvent('esx:showNotification', _source, 'You are working as: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Práce: ' .. job .. ' - ' .. jobgrade})  
end, {help = "Zkontrolujte, jakou máte práci"})

TriggerEvent('es:addCommand', 'cash', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local wallet 	= getMoneyFromUser(_source)
    local cash = ESX.Math.Round(wallet, 2)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. wallet .. ' ~s~in your wallet~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. cash .. ' ve své peněžence'})
end, {help = "Zkontrolujte, kolik máte peněz ve své peněžence"})

TriggerEvent('es:addCommand', 'bank', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bank 			= getBankFromUser(_source)
    local banka = ESX.Math.Round(bank, 2)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. bank .. ' ~s~in your bank~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. banka .. ' na účtě'})
end, {help = "Zkontrolujte, kolik peněz máte na účtu"})

TriggerEvent('es:addCommand', 'dirty', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    local spinave = ESX.Math.Round(black_money, 2)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. black_money .. ' ~s~dirty money in your wallet~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. spinave .. ' špinavých peněz ve své peněžence'})
end, {help = "Zkontrolujte, kolik máte špinavých peněz"})

TriggerEvent('es:addCommand', 'info', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local cash = ESX.Math.Round(wallet, 2)
    local bank 			= getBankFromUser(_source)
    local banka = ESX.Math.Round(bank, 2)
    local black_money 	= getBlackMoneyFromUser(_source)
    local spinave = ESX.Math.Round(black_money, 2)
    if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

                --TriggerClientEvent('esx:showNotification', _source, 'Tvoje práce: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tvoje práce: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. wallet .. ' ~s~ ve své peněžence~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. cash .. ' ve své peněžence'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. bank .. ' ~s~ na bankovním účtu~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. banka .. ' na bankovním účtu'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. black_money .. ' ~s~ špinavých peněz ve své peněžence~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. spinave .. ' špinavých peněz ve své peněžence'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. money .. ' ~s~ ve své firmě~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. money .. ' ve své firmě'})
																	
	else

                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. wallet .. ' ~s~ ve své peněžence~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. cash .. ' ve své peněžence'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. bank .. ' ~s~ na bankovním účtu~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně máš $' .. banka .. ' na bankovním účtu'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Aktuálně máš ~g~$~g~' .. black_money .. ' ~s~ špinavých peněz ve své peněžence~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You currently have $' .. spinave .. ' špinavých peněz ve své peněžence'})
                Citizen.Wait(1500)
				--TriggerClientEvent('esx:showNotification', _source, '~r~Přístup odepřen!')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Přístup odepřen!'})
																	
	end
end, {help = "Zkontrolujte peníze ve firmě"})

TriggerEvent('es:addCommand', 'firma', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
      local firma = ESX.Math.Round(money, 2)
		end
		
                --TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. money .. ' ~s~in the society account~g~ ')
	        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Aktuálně $' .. firma .. ' na firémním účtu'})
																	
	else

	        --TriggerClientEvent('esx:showNotification', _source, '~r~Access not granted!')
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Přístup odepřen!'})
																			
	end
end, {help = "Zkontrolujte peníze ve firmě"})

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

TriggerEvent('es:addCommand', 'id', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerId = xPlayer.source
	
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'ID: ' .. playerId})

end, {help = "Zkontrolujte vaše ID"})

TriggerEvent('es:addCommand', 'name', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = GetCharacterName(source)
	
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Jméno: ' .. PlayerName})

end, {help = "Zkontrolujte vaše ID"})

TriggerEvent('es:addCommand', 'ping', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerId = xPlayer.source
	local playerPing = GetPlayerPing(playerId)
	
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Ping: ' .. playerPing .. ' ms'})

end, {help = "Zkontrolujte vaš Ping"})

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end

-- Get Character name
function GetCharacterName(source)
  local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
    ['@identifier'] = GetPlayerIdentifiers(source)[1]
  })

  if result[1] and result[1].firstname and result[1].lastname then
    if Config.OnlyFirstname then
      return result[1].firstname
    else
      return ('%s %s'):format(result[1].firstname, result[1].lastname)
    end
  else
    return GetPlayerName(source)
  end
end