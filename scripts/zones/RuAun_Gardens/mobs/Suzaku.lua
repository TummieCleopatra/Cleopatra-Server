-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Suzaku
-----------------------------------

local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
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
mob:setLocalVar("PartySize",6);
end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;


-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    elseif rnd < 0.9 then
        return 204 -- flare
    else
        return 235 -- burn
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENFIRE)
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 8)
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	player:setVar("Suzaku_Win",1);
	player:addCurrency('jetton',175);
	player:PrintToPlayer("Your obtain 175 Jettons.", 0x15);
    player:showText(mob,ID.text.SKY_GOD_OFFSET + 8);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

