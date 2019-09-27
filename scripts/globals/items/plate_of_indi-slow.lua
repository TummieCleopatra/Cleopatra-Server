-----------------------------------------
-- ID: 6099
-- Teaches the spell Indi-Slow
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(794)
end

function onItemUse(target)
    target:addSpell(794)
end