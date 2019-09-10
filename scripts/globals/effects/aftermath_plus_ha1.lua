-----------------------------------
--
-- dsp.effect.AFTERMATH_PLUS
--
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    dsp.aftermath.onEffectGain(target, effect)
end

function onEffectLose(target, effect)
    dsp.aftermath.onEffectLose(target, effect)
end