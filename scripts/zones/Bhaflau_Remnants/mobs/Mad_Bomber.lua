-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Mad Bomber
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
   mob:setModelId(282);  -- Big Bomb with the correct animation subs change later in mob group/pool
   mob:setLocalVar("Size",1);
       mob:setMobMod(MOBMOD_EXP_BONUS, -100); 
end;


function onMobFight(mob,target)
 
    local battletime = mob:getBattleTime();
    local size = mob:getLocalVar("Size");

    if (battletime > 20 and size == 1) then
	    mob:AnimationSub(1);
		-- printf("Size is now 1");
		mob:setLocalVar("Size",2);
	elseif (battletime > 40 and size == 2) then
		mob:AnimationSub(2);
		-- printf("Size is now 2");
	    mob:setLocalVar("Size",3);
	elseif (battletime > 60 and size == 3) then
		mob:AnimationSub(3);
		-- printf("Size is now 3");
	    mob:setLocalVar("Size",4);
    elseif (battletime > 80 and size == 4) then
	    mob:setLocalVar("Size",5);   -- Self Destruct is Size 5 will not spawn Rempart      
		mob:useMobAbility(255);	
	end


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local size = mob:getLocalVar("Size",0);
	local timestamp = os.time()

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local gate = 17084688; -- Dormant Rampart
	local nm1 = 17084692; -- Reactionary Rampart1
	local nm2 = 17084699; -- Reactionary Rampart2
	local nm3 = 17084706; -- Reactionary Rampart3
	local nm4 = 17084713; -- Reactionary Rampart4	
    local chance = 90;	
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 40 and level <= 45 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and size ~= 5) then
            if (math.random(0,99) < chance) then 
                master:PrintToPlayer("A gateway has spawned...",0x15);
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				master:setLocalVar(gate,timestamp); -- Timestamp the Player				
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084692):setPos(30,0,9);
            end
		else
            -- printf("Not of the correct level yet");		
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		-- printf("Salvage Level %u",plvl);
		if (plvl >= 40 and plvl <= 45 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and size ~= 5) then
            if (math.random(0,99) < chance) then 
	            if (player:getObjType() == dsp.objType.PC) then
                    player:PrintToPlayer("A gateway has spawned...",0x15);
	            end
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				player:setLocalVar(gate,timestamp); -- Timestamp the Player
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084692):setPos(30,0,9);
	        end
		else
		    -- printf("Not of the correct level yet");	
        end	
    end		



end;


function onMobDespawn(mob)
end;
