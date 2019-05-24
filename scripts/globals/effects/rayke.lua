-----------------------------------
--
-- dsp.effect.RAYKE
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
    local ignis = target:getLocalVar("ignis")
    local gelus = target:getLocalVar("gelus")
    local flabra = target:getLocalVar("flabra")
    local tellus = target:getLocalVar("tellus")
    local sulpor = target:getLocalVar("sulpor")
    local unda = target:getLocalVar("unda")
    local lux = target:getLocalVar("lux")
    local tenebrae = target:getLocalVar("tenebrae")

    target:delMod(dsp.mod.ICERES, -ignis)
    target:delMod(dsp.mod.WINDRES, -gelus)
    target:delMod(dsp.mod.EARTHRES, -flabra)
    target:delMod(dsp.mod.THUNDERRES, -tellus)
    target:delMod(dsp.mod.WATERRES, -sulpor)
    target:delMod(dsp.mod.FIRERES, -unda)
    target:delMod(dsp.mod.DARKRES, -lux)
    target:delMod(dsp.mod.LIGHTRES, -tenebrae)
end;