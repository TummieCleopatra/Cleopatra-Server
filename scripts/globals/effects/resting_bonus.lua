-----------------------------------
--
-- 	EFFECT_DEDICATION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local bonus = target:getVar("RestExp")
    printf("Dedication applied")

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (effect:getTickCount() == 3) then
        local bonus = target:getVar("RestExp")
        target:PrintToPlayer("You are now receiving a resting bonus of "..bonus.."%", 0x1C);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
