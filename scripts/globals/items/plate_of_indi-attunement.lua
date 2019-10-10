-----------------------------------------
-- ID: 6090
-- Teaches the spell Indi-Attunement
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(786)
end

function onItemUse(target)
    target:addSpell(786)
end