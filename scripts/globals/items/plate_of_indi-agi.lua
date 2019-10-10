-----------------------------------------
-- ID: 6079
-- Teaches the spell Indi-AGI
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(775)
end

function onItemUse(target)
    target:addSpell(775)
end