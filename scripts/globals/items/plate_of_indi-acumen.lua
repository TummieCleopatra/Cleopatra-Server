-----------------------------------------
-- ID: 6085
-- Teaches the spell Indi-Acumen
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(780)
end

function onItemUse(target)
    target:addSpell(780)
end