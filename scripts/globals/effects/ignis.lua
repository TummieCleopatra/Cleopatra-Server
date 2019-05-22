-----------------------------------
--
-- dsp.effect.IGNIS
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util");



-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- TODO: Add in calculation for which rune is dominiant via highest effect count and apply correct enspell
    target:addMod(dsp.mod.ICERES, effect:getPower());
    dominanceCheck(target,effect)
    if (target:hasStatusEffect(dsp.effect.VALLATION)) then
        target:addMod(dsp.mod.ICEDEF, 15)
    end
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
    target:delMod(dsp.mod.ICERES, effect:getPower());
    target:delMod(dsp.mod.ENSPELL_DMG, (effect:getPower()/2))
    if (target:getActiveRunes() < 2) then
        target:setMod(dsp.mod.ENSPELL,0);
    end
    if (target:hasStatusEffect(dsp.effect.VALLATION)) then
        target:delMod(dsp.mod.ICEDEF, 15)
    end
	-- target:setMod(MOD_ENSPELL,0);

end;