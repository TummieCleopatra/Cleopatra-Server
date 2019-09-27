-----------------------------------------
-- ID: 6077
-- Teaches the spell Indi-DEX
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(772)
end

function onItemUse(target)
    target:addSpell(772)
end