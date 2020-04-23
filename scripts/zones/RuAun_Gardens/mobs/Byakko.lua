-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Byakko
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/mobscaler");
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

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local size = mob:getLocalVar("PartySize");

	local dmg = math.random(size*5,size*9);

		-- local dmg = math.random(35,50);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, dsp.magic.ele.LIGHT, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,dsp.magic.ele.LIGHT,0);
    dmg = adjustForTarget(target,dmg,dsp.magic.ele.LIGHT);
    dmg = finalMagicNonSpellAdjustments(mob,target,dsp.magic.ele.LIGHT,dmg);

    return dsp.subEffect.LIGHT_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
end;


function onMobFight(mob,target)
    local size = target:getPartySize(0);
    -- printf("Total Size: %s",size);
    mobScaler(mob,target)

	local att = mob:getStat(dsp.mod.ATT);
	local def = mob:getStat(dsp.mod.DEF);
	local eva = mob:getStat(dsp.mod.EVA);
	local acc = mob:getStat(dsp.mod.ACC);
	local patt = target:getStat(dsp.mod.ATT);
	local pdef = target:getStat(dsp.mod.DEF);
	local pdif = patt / def;
	local mobpdif = att / pdef;

end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:showText(mob,ID.text.SKY_GOD_OFFSET + 12);
    player:setVar("Byakko_Win",1);
	player:addCurrency('jetton',225);
	player:PrintToPlayer("You obtain 225 Jettons.", 0x15);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------


