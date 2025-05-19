RegisterCommand("postal", function(source, args, raw)
	if args[1] ~= nil then
		local postalCode = args[1]
		setWaypoint(postalCode)
	else
		notify(Config.Prefix.. "You don't have a posting!")
	end
end, false)
function notify(msg)
	exports.ox_lib:notify({
		title = Config.Prefix,
		description = msg,
		type = "info"
	})
end
function setWaypoint(postalCode)
	local postalCode_coords = vector2(0,0)
	for i = 1, #Config.postalcodes, 1 do
		if Config.postalcodes[i].code == postalCode then
			postalCode_coords = vector2(Config.postalcodes[i].x, Config.postalcodes[i].y)
		end
	end
	
	if postalCode_coords.x ~= 0.0 and postalCode_coords.y ~= 0.0 then
		SetNewWaypoint(postalCode_coords.x, postalCode_coords.y)
		notify(Config.Prefix.. "You have successfully set postal" .. postalCode)
	else
		notify(Config.Prefix.. "This Postal does not exist")
	end
end
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/postcode', 'Set your postal code', {
        { name="postal code", help="postal code (e.g. 001)" }
    })
end)
