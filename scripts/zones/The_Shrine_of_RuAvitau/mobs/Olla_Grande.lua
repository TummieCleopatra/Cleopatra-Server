-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Olla Grande
-----------------------------------
require("scripts/globals/mobscaler");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",4);
end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	player:setVar("Olla_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17506692):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;