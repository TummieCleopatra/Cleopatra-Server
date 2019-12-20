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
    target:PrintToPlayer("You are now receiving a resting bonus of "..bonus.."%", 0x1C);
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
end;
