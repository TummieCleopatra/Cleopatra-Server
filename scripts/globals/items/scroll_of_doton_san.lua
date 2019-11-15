-----------------------------------------
-- ID: 4737
-- Scroll of Katon San
-- Teaches Ninjitsu San
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(331)
end

function onItemUse(target)
    target:addSpell(331)
end