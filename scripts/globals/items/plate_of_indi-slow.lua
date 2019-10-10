-----------------------------------------
-- ID: 6099
-- Teaches the spell Indi-Slow
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(795)
end

function onItemUse(target)
    target:addSpell(795)
end