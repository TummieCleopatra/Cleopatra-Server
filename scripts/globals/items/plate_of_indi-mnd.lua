-----------------------------------------
-- ID: 6081
-- Teaches the spell Indi-MND
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(777)
end

function onItemUse(target)
    target:addSpell(777)
end