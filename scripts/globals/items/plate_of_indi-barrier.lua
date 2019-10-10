-----------------------------------------
-- ID: 6084
-- Teaches the spell Indi-Barrier
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(780)
end

function onItemUse(target)
    target:addSpell(780)
end