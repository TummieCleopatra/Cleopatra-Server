-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Adelheid
-- Tactics NPC
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)
  
end;

function onMobSpawn(mob)
  
   
	mob:AnimationSub(3);
end;

function onMobRoam(mob)
   -- mob:setModelId(1005);
	-- mob:AnimationSub(1);
end;

function onMobEngaged(mob,target)
    target:PrintToPlayer("??? : You may have defeated my clone...no matter...This is where you perish!!", 0xD);
end;


function onMobFight(mob,target)
    
	

   



  
end;



function onCriticalHit(mob) 

end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,player,isKiller)
	player:setVar("ADEL_TRIB_FIGHT",2);
end;