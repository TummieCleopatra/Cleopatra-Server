-----------------------------------------
-- ID: 4737
-- Scroll of Dia III
-- Teaches the white magic Dia III
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(25)
end

function onItemUse(target)
    target:addSpell(25)
end