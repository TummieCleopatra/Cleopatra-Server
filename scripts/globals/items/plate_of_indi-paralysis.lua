-----------------------------------------
-- ID: 6100
-- Teaches the spell Indi-Paralysis
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(796)
end

function onItemUse(target)
    target:addSpell(796)
end