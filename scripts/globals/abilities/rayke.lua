-----------------------------------
-- Ability: Rayke
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
    addRayke(player, target, action, ability, dsp.effect.RAYKE);
end;