-----------------------------------------
-- ID: 6100
-- Teaches the spell Indi-Paralysis
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(795)
end

function onItemUse(target)
    target:addSpell(795)
end