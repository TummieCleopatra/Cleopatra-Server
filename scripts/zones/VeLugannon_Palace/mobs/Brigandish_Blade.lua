-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Brigandish Blade
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/mobscaler");
require("scripts/globals/mobs")
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
 
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("PartySize",4);
end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.TERROR, {chance = 30})
end

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer, player) 
	player:setVar("Brig_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);	
end;



-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17502582):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
