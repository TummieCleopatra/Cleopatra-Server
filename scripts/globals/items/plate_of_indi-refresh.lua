-----------------------------------------
-- ID: 6075
-- Teaches the spell Indi-Refresh
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(770)
end

function onItemUse(target)
    target:addSpell(770)
end