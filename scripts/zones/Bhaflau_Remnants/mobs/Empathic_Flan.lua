-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Empathic Flan
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  -- mob:setModelId(282);  -- Big Bomb with the correct animation subs change later in mob group/pool
   mob:setLocalVar("Spikes",1);
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100); 
end;


function onMobFight(mob,target)
 
    local battletime = mob:getBattleTime();
    local spikes = mob:getLocalVar("Spikes");
	local randomtime = math.random(7,19);

    if (battletime > randomtime and spikes == 1) then
		mob:AnimationSub(2);
		-- printf("Spikey Mode Enabled");
	    mob:setLocalVar("Spikes",2);
	end


end;


function onMagicHit(caster, target, spell)
    local spikes = target:getLocalVar("Spikes"); 
    if (spikes == 2) then
       target:AnimationSub(1);
 	   target:setLocalVar("Spikes",3);
    end  
    return 1;	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local size = mob:getLocalVar("Spikes");
	local timestamp = os.time()
    salvageChestB(mob,player)
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local gate = 17084689; -- Dormant Rampart
	local nm1 = 17084692; -- Reactionary Rampart1
	local nm2 = 17084699; -- Reactionary Rampart2
	local nm3 = 17084706; -- Reactionary Rampart3
	local nm4 = 17084713; -- Reactionary Rampart4	
    local chance = 90;	
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 50 and level <= 55 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and size == 2) then
            if (math.random(0,99) < chance) then 
                master:PrintToPlayer("A gateway has spawned...",0x15);
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				master:setLocalVar(gate,timestamp); -- Timestamp the Player				
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084699):setPos(30,0,9);
            end
		else
            -- printf("Not of the correct level yet");		
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		-- printf("Salvage Level %u",plvl);
		if (plvl >= 50 and plvl <= 55 and GetMobAction(nm1) == 0 and GetMobAction(nm2) == 0 and GetMobAction(nm3) == 0 and GetMobAction(nm4) == 0 and size == 2) then
            if (math.random(0,99) < chance) then 
	            if (player:getObjType() == dsp.objType.PC) then
                    player:PrintToPlayer("A gateway has spawned...",0x15);
	            end
				GetNPCByID(gate):setLocalVar(gate, timestamp); -- Timestamp NPC
				player:setLocalVar(gate,timestamp); -- Timestamp the Player
	            GetNPCByID(gate):setPos(killx+1,killy,killz);
                GetNPCByID(gate):showNPC(60);
				SpawnMob(17084699):setPos(30,0,9);
	        end
		else
		    -- printf("Not of the correct level yet");	
        end	
    end		



end;


function onMobDespawn(mob)
end;
