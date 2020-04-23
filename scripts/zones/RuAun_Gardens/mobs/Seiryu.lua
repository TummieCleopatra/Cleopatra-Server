-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Seiryu
-----------------------------------

local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
 	mob:setLocalVar("PartySize",6);  -- Large Party of 75's can defeat Byakko
end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------



function onMonsterMagicPrepare(mob, target)
    if not mob:hasStatusEffect(dsp.effect.HUNDRED_FISTS, 0) then
        local rnd = math.random()
        if rnd < 0.5 then
            return 186 -- aeroga 3
        elseif rnd < 0.7 then
            return 157 -- aero 4
        elseif rnd < 0.9 then
            return 208 -- tornado
        else
            return 237 -- choke
        end
    end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENAERO)
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	player:setVar("Seiryu_Win",1);
	player:addCurrency('jetton',250);
	player:PrintToPlayer("Your obtain 250 Jettons.", 0x15);
    player:showText(mob,ID.text.SKY_GOD_OFFSET + 10);
end;

