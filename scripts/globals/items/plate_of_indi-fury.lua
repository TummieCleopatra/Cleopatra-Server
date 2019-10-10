-----------------------------------------
-- ID: 6083
-- Teaches the spell Indi-Fury
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(779)
end

function onItemUse(target)
    target:addSpell(779)
end