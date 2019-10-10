-----------------------------------
--
--  dsp.effect.INDI_REGEN_II
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getObjType() ~= dsp.objType.PET) then
	    target:addMod(dsp.mod.REGEN, effect:getPower());
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    potencyBoost(target,effect)
    if (target:getObjType() == dsp.objType.PC) then
        target:forMembersInRange(10, function(member)
            if (member:hasStatusEffect(dsp.effect.INDI_REGEN) == false) then
                member:addStatusEffect(dsp.effect.REGEN_II, effect:getPower(), 0, 4)
            end
        end)
    else

        local nearbyChars = target:getTargetsWithinArea(12, 1)
        for i,members in pairs(nearbyChars) do
            if (members:getObjType() == dsp.objType.PC) then
                members:addStatusEffect(dsp.effect.REGEN_II, effect:getPower(), 0, 4)
            end

            local party = members:getParty()
            for i, trust in ipairs(party) do
                if (trust:getObjType() == dsp.objType.TRUST) then
                    trust:addStatusEffect(dsp.effect.REGEN_II, effect:getPower(), 0, 4)
                end
            end
        end
    end

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (target:getObjType() ~= dsp.objType.PET) then
	    target:delMod(dsp.mod.REGEN, effect:getPower());
    end
end;