-----------------------------------
--
--  dsp.effect.INDI_INT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(dsp.mod.INT, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    target:forMembersInRange(10, function(member)
        if not member:hasStatusEffect(dsp.effect.INT_BOOST_III) then
            member:addStatusEffect(dsp.effect.INT_BOOST_III, effect:getPower(), 0, 3)
        end
    end)

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(dsp.mod.INT, effect:getPower());
end;