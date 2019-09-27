-----------------------------------------
-- ID: 6084
-- Teaches the spell Indi-Barrier
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(779)
end

function onItemUse(target)
    target:addSpell(779)
end