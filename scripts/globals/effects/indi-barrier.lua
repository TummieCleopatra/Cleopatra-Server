-----------------------------------
--
--  dsp.effect.INDI_BARRIER
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getObjType() ~= dsp.objType.PET) then
	    target:addMod(dsp.mod.DEFP, effect:getPower());
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (target:getObjType() == dsp.objType.PC) then
        target:forMembersInRange(10, function(member)
            -- if not member:hasStatusEffect(dsp.effect.DEFENSE_BOOST_II) then
                member:addStatusEffect(dsp.effect.DEFENSE_BOOST_II, effect:getPower(), 0, 6)
            -- end
        end)
    else

        local nearbyChars = target:getTargetsWithinArea(12, 1)
        for i,members in pairs(nearbyChars) do
            if (members:getObjType() == dsp.objType.PC and members:getAllegiance() == target:getAllegiance()) then
                members:addStatusEffect(dsp.effect.DEFENSE_BOOST_II, effect:getPower(), 0, 6)
            end

            local party = members:getParty()
            for i, trust in ipairs(party) do
                if (trust:getObjType() == dsp.objType.TRUST) then
                    trust:addStatusEffect(dsp.effect.DEFENSE_BOOST_II, effect:getPower(), 0, 6)
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
	    target:delMod(dsp.mod.DEFP, effect:getPower());
    end
end;