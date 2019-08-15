-----------------------------------
-- Area: VeLugannon Palace
-- MOB:  Detector
-----------------------------------

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)


end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, player)
	player:setVar("Steam_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);	

end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )


end;