-----------------------------------------
-- ID: 6076
-- Teaches the spell Indi-STR
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(771)
end

function onItemUse(target)
    target:addSpell(771)
end