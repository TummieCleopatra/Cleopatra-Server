-----------------------------------------
-- ID: 4737
-- Scroll of Blind II
-- Teaches the white magic Blind II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(276)
end

function onItemUse(target)
    target:addSpell(276)
end