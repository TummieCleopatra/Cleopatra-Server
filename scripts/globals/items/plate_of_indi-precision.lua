-----------------------------------------
-- ID: 6087
-- Teaches the spell Indi-Precision
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(782)
end

function onItemUse(target)
    target:addSpell(782)
end