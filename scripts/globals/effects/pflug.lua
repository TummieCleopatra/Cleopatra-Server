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
    target:setVar("pflugresist",resistance)
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
    local resistance = target:getVar("pflugresist")
    target:delMod(resistance, effect:getPower())
    target:setVar("pflugresist",0)
end;