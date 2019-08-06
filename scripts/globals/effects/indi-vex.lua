-----------------------------------
--
--  dsp.effect.INDI_VEX
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
	local nearbyTargets = target:getTargetsWithinArea(7, 8);
    for i,member in ipairs(nearbyTargets) do


	    if (member:getObjType() == dsp.objType.MOB) then
		    local mob = member:getID();
			GetMobByID(mob):updateEnmity(target);
		    member:addStatusEffect(dsp.effect.MAGIC_ACC_DOWN_II, effect:getPower() * boost, 0, 6);

        end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;