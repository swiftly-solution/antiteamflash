AddEventHandler("OnPlayerBlind", function(event)
	local playerid = event:GetInt("userid")
	local attackerid = event:GetInt("attacker")
	local player = GetPlayer(playerid)
	if not player then return EventResult.Continue end
	local attacker = GetPlayer(attackerid)
	if not attacker then return EventResult.Continue end

	if not player:CBaseEntity():IsValid() then return end
	if player:CBaseEntity().TeamNum == attacker:CBaseEntity().TeamNum and (not config:Fetch("antiteamflash.blind_thrower") or playerid ~= attackerid) then
		if not player:CCSPlayerPawnBase():IsValid() then return end
		player:CCSPlayerPawnBase().BlindUntilTime = server:GetCurrentTime()
	end
        
    return EventResult.Continue
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "Anti Team Flash"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/antiteamflash"
end
