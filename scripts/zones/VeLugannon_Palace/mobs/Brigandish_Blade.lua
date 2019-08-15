-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Brigandish Blade
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/mobscaler");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT,mob:getShortID());
 
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

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer, player) 
	player:setVar("Brig_Win",1);
	player:addCurrency('jetton',50);
	player:PrintToPlayer("Your obtain 50 Jettons.", 0x15);	
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)

    local rand = math.random(1,10);

    if ((rand >= 4) or (target:hasStatusEffect(dsp.effect.TERROR) == true)) then -- 30% chance to terror
        return 0,0,0;
    else
        local duration = math.random(3,5);
        target:addStatusEffect(dsp.effect.TERROR,1,0,duration);
        dsp.subEffect.NONE,0,dsp.effect.TERROR;
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17502582):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
