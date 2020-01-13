-----------------------------------
-- Area:
-- NPC:  Bifrons
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Bhaflau_Remnants/IDs");
local ID = require("scripts/zones/Bhaflau_Remnants/IDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    salvageScaler(mob)
end;


function onMobFight(mob,target)




end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	salvageAmbient(mob,player);
    -- Porogo Gent Spawn Chance
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local nm = 17084481; -- Mad Bomber
    local chance = 100;

	salvageChestB(mob,player)
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 40 and level <= 45 and GetMobAction(nm) == 0) then
            if (math.random(0,99) < chance) then
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);
            end
		else
            -- printf("Not of the correct level yet");
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		-- printf("Salvage Level %u",plvl);
		if (plvl >= 40 and plvl <= 45) then
            if (math.random(0,99) < chance) then
	            if (player:getObjType() == dsp.objType.PC) then
                    player:PrintToPlayer("You feel an unknown presense...",0x15);
	            end
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);
	        end
		else
		    -- printf("Not of the correct level yet");
        end
    end
end;