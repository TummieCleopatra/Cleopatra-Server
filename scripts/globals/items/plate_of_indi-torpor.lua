-----------------------------------------
-- ID: 6096
-- Teaches the spell Indi-Torpor
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(792)
end

function onItemUse(target)
    target:addSpell(792)
end