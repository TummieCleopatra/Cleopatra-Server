-----------------------------------------
-- ID: 4737
-- Scroll of Katon San
-- Teaches Ninjitsu San
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(334)
end

function onItemUse(target)
    target:addSpell(334)
end