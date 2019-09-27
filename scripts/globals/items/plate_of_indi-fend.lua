-----------------------------------------
-- ID: 6086
-- Teaches the spell Indi-Fend
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(781)
end

function onItemUse(target)
    target:addSpell(781)
end