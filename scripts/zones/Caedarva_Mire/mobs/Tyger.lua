-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Tyger
-- @pos -766 -12 632
-- Spawn with Singed Buffalo: @additem 2593
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.SLEEPRES,30);
    mob:addMod(dsp.mod.BINDRES,30);
    mob:addMod(dsp.mod.GRAVITYRES,30);
    mob:addMod(dsp.mod.ATT, 200);
	znmT4Size(mob)
end;


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    znmScalerT4(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 30;
    znmTherionT4(mob, player, nm)	
end;