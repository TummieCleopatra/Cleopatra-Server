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
	mobScaler(mob,target);
end

function onMobWeaponSkill(target, mob, skill)
    if (skill:getID() == 536) then
        local panzerfaustCounter = mob:getLocalVar("panzerfaustCounter");
        local panzerfaustMax = mob:getLocalVar("panzerfaustMax");

        if (panzerfaustCounter == 0 and panzerfaustMax == 0) then
            panzerfaustMax = math.random(2,5);
            mob:setLocalVar("panzerfaustMax", panzerfaustMax);
        end

        panzerfaustCounter = panzerfaustCounter +1;
        mob:setLocalVar("panzerfaustCounter", panzerfaustCounter);

        if (panzerfaustCounter > panzerfaustMax) then
            mob:setLocalVar("panzerfaustCounter", 0);
            mob:setLocalVar("panzerfaustMax", 0);
        else
            mob:useMobAbility(536);
        end
    end;
end;

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
