-----------------------------------------
-- ID: 6095
-- Teaches the spell Indi-Slip
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(790)
end

function onItemUse(target)
    target:addSpell(790)
end