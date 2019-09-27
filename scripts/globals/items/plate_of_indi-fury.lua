-----------------------------------------
-- ID: 6083
-- Teaches the spell Indi-Fury
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(778)
end

function onItemUse(target)
    target:addSpell(778)
end