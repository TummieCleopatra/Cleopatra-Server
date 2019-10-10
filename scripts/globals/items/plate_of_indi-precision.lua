-----------------------------------------
-- ID: 6087
-- Teaches the spell Indi-Precision
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(783)
end

function onItemUse(target)
    target:addSpell(783)
end