-----------------------------------------
-- ID: 4737
-- Scroll of Flre II
-- Teaches Black Magic Spell Flare II
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(211)
end

function onItemUse(target)
    target:addSpell(211)
end