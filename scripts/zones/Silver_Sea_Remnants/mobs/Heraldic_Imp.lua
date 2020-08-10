-----------------------------------
-- Area:
-- NPC:  Heraldic Imp
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobFight(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	salvageAmbient(mob,player);
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local nm = 17088595; -- Dekka
    local chance = SSRFLOOR2;
	salvageChestS(mob, isKiller)
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 50 and level <= 55 and GetMobAction(nm) == 0) then
            if (math.random(0,99) < chance) then
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(player);
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
                GetMobByID(nm):updateClaim(player);
	        end
		else
		    -- printf("Not of the correct level yet");
        end
    end

end;