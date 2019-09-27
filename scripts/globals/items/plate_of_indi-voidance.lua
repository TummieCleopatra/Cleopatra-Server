-----------------------------------------
-- ID: 6088
-- Teaches the spell Indi-Voidance
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(783)
end

function onItemUse(target)
    target:addSpell(783)
end