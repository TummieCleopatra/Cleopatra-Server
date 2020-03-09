-----------------------------------
--
-- dsp.effect.MAJESTY
--
-----------------------------------

function onEffectGain(target,effect)

    target:addMod(dsp.mod.CURE_POTENCY, effect:getPower())
    target:addMod(dsp.mod.CURE_CAST_TIME, 10)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.CURE_POTENCY, effect:getPower())
    target:delMod(dsp.mod.CURE_CAST_TIME, 10)
end