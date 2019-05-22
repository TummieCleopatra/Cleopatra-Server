-----------------------------------
-- Ability: Swordplay
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
    if (player:getMainJob() == dsp.job.RUN) then
        player:addStatusEffect(dsp.effect.SWORDPLAY,6,3,120)
    else
        player:addStatusEffect(dsp.effect.SWORDPLAY,3,3,120)
    end
end;