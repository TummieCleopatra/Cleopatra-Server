-----------------------------------------
-- ID: 6080
-- Teaches the spell Indi-INT
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(776)
end

function onItemUse(target)
    target:addSpell(776)
end