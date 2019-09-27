-----------------------------------------
-- ID: 6097
-- Teaches the spell Indi-Vex
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(792)
end

function onItemUse(target)
    target:addSpell(792)
end