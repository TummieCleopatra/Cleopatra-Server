-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Archaic Gear
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  -- mob:setModelId(282);  -- Big Bomb with the correct animation subs change later in mob group/pool
    if (mob:getID() >= 17084638 and mob:getID() <= 17084654) then
        mob:setLocalVar("Gear",1);
	end
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100); 	
-- setModelId
end;


function onMobFight(mob,target)
 



end;



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local gear = mob:getLocalVar("Gear");
	local timestamp = os.time()
    salvageChestB(mob,player)
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local gate = 17084690; -- Dormant Rampart
	local nm1 = 17084692; -- Reactionary Rampart1
	local nm2 = 17084699; -- Reactionary Rampart2
	local nm3 = 17084706; -- Reactionary Rampart3
	local nm4 = 17084713; -- Reactionary Rampart4	
    local chance = 90;	
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 60 and level <= 65 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and gear == 1) then
            if (math.random(0,99) < chance) then 
                master:PrintToPlayer("A gateway has spawned...",0x15);
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				master:setLocalVar(gate,timestamp); -- Timestamp the Player				
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084706):setPos(30,0,9);
            end
		else
            -- printf("Not of the correct level yet");		
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		-- printf("Salvage Level %u",plvl);
		if (plvl >= 60 and plvl <= 65 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and gear == 1) then
            if (math.random(0,99) < chance) then 
	            if (player:getObjType() == dsp.objType.PC) then
                    player:PrintToPlayer("A gateway has spawned...",0x15);
	            end
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				player:setLocalVar(gate,timestamp); -- Timestamp the Player
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084706):setPos(30,0,9);
	        end
		else
		    -- -- printf("Not of the correct level yet");	
        end	
    end		



end;


function onMobDespawn(mob)
end;
