-----------------------------------------
-- ID: 4737
-- Scroll of Katon San
-- Teaches Ninjitsu San
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(337)
end

function onItemUse(target)
    target:addSpell(337)
end