-----------------------------------------
-- ID: 6101
-- Teaches the spell Indi-Gravity
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(796)
end

function onItemUse(target)
    target:addSpell(796)
end