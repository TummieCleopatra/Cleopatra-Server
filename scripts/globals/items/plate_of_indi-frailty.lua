-----------------------------------------
-- ID: 6092
-- Teaches the spell Indi-Frailty
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(788)
end

function onItemUse(target)
    target:addSpell(788)
end