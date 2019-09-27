-----------------------------------------
-- ID: 6089
-- Teaches the spell Indi-Focus
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(784)
end

function onItemUse(target)
    target:addSpell(784)
end