-----------------------------------
-- Area:
-- NPC:  Black Pudding
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
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
    local nm = 17084721; -- Demented Jalaawa
    local chance = 35;


	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 60 and level <= 65) then
            if (chance < math.random(0,99)) then 
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(killer);
            end
		else
            -- printf("Not of the correct level yet");		
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		if (plvl >= 60 and plvl <= 65) then
            if (chance < math.random(0,99)) then
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