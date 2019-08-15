-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Faust
-----------------------------------

-- TODO: Faust should WS ~3 times in a row each time.

require("scripts/globals/mobscaler");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",8); 
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, player)
    player:setVar("Faust_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);		
	mob:setRespawnTime(math.random((1800),(2700))); -- respawn 3-6 hrs
end;