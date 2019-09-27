-----------------------------------------
-- ID: 6081
-- Teaches the spell Indi-MND
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(776)
end

function onItemUse(target)
    target:addSpell(776)
end