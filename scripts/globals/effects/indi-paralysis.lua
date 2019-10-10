-----------------------------------
--
--  dsp.effect.INDI_PARALYSIS
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local boost = 1
    local hp = target:getHP()
	local nearbyTargets = target:getTargetsWithinArea(12, 8);
    for i,member in ipairs(nearbyTargets) do
	    if (member:getObjType() == dsp.objType.MOB) then
             local enmitylist = member:getEnmityList()
            for _,enmity in ipairs(enmitylist) do
                if (target:getObjType() == dsp.objType.PC) then   -- effect is on Player, get player hate
                    if (enmity.active and enmity.entity:getID() == target:getID()) then
		                local mob = member:getID();
			            GetMobByID(mob):updateEnmity(target);
		                member:addStatusEffect(dsp.effect.PARALYSIS_II, effect:getPower() * boost, 0, 6);
                    end
                elseif (target:getObjType() == dsp.objType.PET) then   -- effect is on Pet, get player hate
                    local master = pet:getMaster()
                    if (enmity.active and enmity.entity:getID() == master:getID()) then
		                local mob = member:getID();
			            GetMobByID(mob):updateEnmity(target);
		                member:addStatusEffect(dsp.effect.PARALYSIS_II, effect:getPower() * boost, 0, 6);
                    end
                end
            end
        end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;