-----------------------------------
-- Ability: Battuta
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
    player:addStatusEffect(dsp.effect.BATTUTA,0,3,120)
end;