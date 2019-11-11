-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
function onEffectGain(target,effect)
    local skill = target:getSkillLevel(dsp.skill.SUMMONING_MAGIC);

    target:addMod(dsp.mod.AVATAR_PERPETUATION, 8)

end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.AVATAR_PERPETUATION, 8)
end