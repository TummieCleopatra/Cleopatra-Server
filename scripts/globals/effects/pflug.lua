-----------------------------------
--
-- dsp.effect.PFLUG
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util");



-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- local merits = player:getMerit(dsp.merit.PFLUG_EFFECT)
    local resistance, power = pflugResist(target)
    target:addMod(resistance, effect:getPower())
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(resistance, effect:getPower())
end;