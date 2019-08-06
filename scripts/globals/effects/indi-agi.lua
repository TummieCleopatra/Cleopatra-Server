-----------------------------------
--
--  dsp.effect.INDI_AGI
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getObjType() ~= dsp.objType.PET) then
	    target:addMod(dsp.mod.AGI, effect:getPower());
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (target:getObjType() == dsp.objType.PC) then
        target:forMembersInRange(10, function(member)
           -- if not member:hasStatusEffect(dsp.effect.AGI_BOOST_III) then
                member:addStatusEffect(dsp.effect.AGI_BOOST_III, effect:getPower(), 0, 6)
           -- end
        end)
    else

        local nearbyChars = target:getTargetsWithinArea(7, 1)
        for i,members in pairs(nearbyChars) do
            if (members:getObjType() == dsp.objType.PC and members:getAllegiance() == target:getAllegiance()) then
                members:addStatusEffect(dsp.effect.AGI_BOOST_III, effect:getPower(), 0, 6)
            end
        end
    end

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (target:getObjType() ~= dsp.objType.PET) then
	    target:delMod(dsp.mod.AGI, effect:getPower());
    end
end;