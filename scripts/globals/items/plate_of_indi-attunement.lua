-----------------------------------------
-- ID: 6090
-- Teaches the spell Indi-Attunement
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(785)
end

function onItemUse(target)
    target:addSpell(785)
end