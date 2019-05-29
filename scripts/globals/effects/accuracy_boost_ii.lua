-----------------------------------
--
--  dsp.effect.ACCURACY_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if (effect:getPower()>100) then
		effect:setPower(50);
	end
	target:addMod(dsp.mod.ACCP,effect:getPower());
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
	local boostACC_effect_size = effect:getPower();
	if (boostACC_effect_size > 0) then
		target:delMod(dsp.mod.ACCP,effect:getPower());
	end
end;