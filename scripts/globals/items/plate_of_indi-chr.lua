-----------------------------------------
-- ID: 6082
-- Teaches the spell Indi-CHR
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(778)
end

function onItemUse(target)
    target:addSpell(778)
end