-----------------------------------------
-- ID: 6074
-- Scroll of Ice Carol
-- Teaches the spell Indi-Poison
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(769)
end

function onItemUse(target)
    target:addSpell(769)
end