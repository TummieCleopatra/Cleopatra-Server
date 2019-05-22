-----------------------------------
-- Ability: Pflug
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util")

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    local merits = player:getMerit(dsp.merit.MERIT_PFLUG_EFFECT)
    local resistance, power = pflugResist(player)
    local animation = getVallationAnimation(player)
    player:injectActionPacket(15,2,animation,0)
    player:addStatusEffect(dsp.effect.PFLUG,power + merits,3,120)
end;