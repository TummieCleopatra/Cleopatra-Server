-----------------------------------------
-- ID: 6101
-- Teaches the spell Indi-Gravity
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(797)
end

function onItemUse(target)
    target:addSpell(797)
end