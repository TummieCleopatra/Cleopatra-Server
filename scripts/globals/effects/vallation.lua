-----------------------------------
--
-- dsp.effect.VALLATION
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util");



-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

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
    local ignis = target:countEffect(dsp.effect.IGNIS) * 15
    local gelus = target:countEffect(dsp.effect.GELUS) * 15
    local flabra = target:countEffect(dsp.effect.FLABRA) * 15
    local tellus = target:countEffect(dsp.effect.TELLUS) * 15
    local sulpor = target:countEffect(dsp.effect.SULPOR) * 15
    local unda = target:countEffect(dsp.effect.UNDA) * 15
    local lux = target:countEffect(dsp.effect.LUX) * 15
    local tenebrae = target:countEffect(dsp.effect.TENEBRAE) * 15

    target:delMod(dsp.mod.ICEDEF, ignis)
    target:delMod(dsp.mod.WINDDEF, gelus)
    target:delMod(dsp.mod.EARTHDEF, flabra)
    target:delMod(dsp.mod.THUNDERDEF, tellus)
    target:delMod(dsp.mod.WATERDEF, sulpor)
    target:delMod(dsp.mod.FIREDEF, unda)
    target:delMod(dsp.mod.DARKDEF, lux)
    target:delMod(dsp.mod.LIGHTDEF, tenebrae)
end;