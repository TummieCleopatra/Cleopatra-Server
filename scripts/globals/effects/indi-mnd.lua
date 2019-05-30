-----------------------------------
--
--  dsp.effect.INDI_MND
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(dsp.mod.MND, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    target:forMembersInRange(10, function(member)
        if not member:hasStatusEffect(dsp.effect.MND_BOOST_III) then
            member:addStatusEffect(dsp.effect.MND_BOOST_III, effect:getPower(), 0, 3)
        end
    end)

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(dsp.mod.MND, effect:getPower());
end;