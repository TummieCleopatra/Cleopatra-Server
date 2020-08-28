-----------------------------------
--
-- 	EFFECT_DEDICATION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.UDMGPHYS,700)

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
    target:delMod(dsp.mod.UDMGPHYS,700)
end;
