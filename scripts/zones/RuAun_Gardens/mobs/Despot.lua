-----------------------------------
-- Area: RuAun Gardens
-- MOB:  Despot
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs");

require("scripts/globals/mobscaler");

function onMobSpawn(mob)
	mob:setLocalVar("PartySize",4);  -- Small Party of 75's can defeat despot
end

function onMobFight(mob,target)
    local size = target:getPartySize();
    printf("Total Size: %s",size);
	mobScaler(mob,target);

	local att = mob:getStat(dsp.mod.ATT);
	local def = mob:getStat(dsp.mod.DEF);

	printf("Attack is: %s",att);
	printf("Defense is: %s",def);
end

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,player,killer)

    -- Set Despot ToD
    SetServerVariable("[POP]Despot", os.time(t) + 3600); -- 1 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Despot");
    SetServerVariable("[PH]Despot", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

	player:setVar("Despot_Win",1);
    player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);

end;
