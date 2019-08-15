-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Ullikummi
-----------------------------------
require("scripts/globals/mobscaler");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",5); 

end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, player)
	player:setVar("Ulli_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);	
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17506694):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;