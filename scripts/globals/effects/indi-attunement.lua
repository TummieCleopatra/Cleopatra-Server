-----------------------------------
--
--  dsp.effect.INDI_ATTUNEMENT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(dsp.mod.MEVA, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    target:forMembersInRange(10, function(member)
        if not member:hasStatusEffect(dsp.effect.MAGIC_EVASION_BOOST) then
            member:addStatusEffect(dsp.effect.MAGIC_EVASION_BOOST, effect:getPower(), 0, 3)
        end
    end)

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(dsp.mod.MEVA, effect:getPower());
end;