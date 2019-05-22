-----------------------------------
-- Ability: Gelus
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

function onUseAbility(player,target,ability)
    addRune(player, dsp.effect.GELUS);
end;