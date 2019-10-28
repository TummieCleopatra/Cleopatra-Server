-----------------------------------------
-- ID: 4737
-- Scroll of Bio III
-- Teaches the white magic Bio III
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(232)
end

function onItemUse(target)
    target:addSpell(232)
end