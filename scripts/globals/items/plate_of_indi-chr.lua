-----------------------------------------
-- ID: 6082
-- Teaches the spell Indi-CHR
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(777)
end

function onItemUse(target)
    target:addSpell(777)
end