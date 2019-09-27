-----------------------------------------
-- ID: 6092
-- Teaches the spell Indi-Frailty
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(787)
end

function onItemUse(target)
    target:addSpell(787)
end