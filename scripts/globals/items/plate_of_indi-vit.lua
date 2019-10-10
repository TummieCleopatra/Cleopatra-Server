-----------------------------------------
-- ID: 6078
-- Teaches the spell Indi-VIT
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(774)
end

function onItemUse(target)
    target:addSpell(774)
end