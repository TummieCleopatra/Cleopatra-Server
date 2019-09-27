-----------------------------------------
-- ID: 6091
-- Teaches the spell Indi-Wilt
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(786)
end

function onItemUse(target)
    target:addSpell(786)
end