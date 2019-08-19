-----------------------------------------
-- Spell: Rughadjeen
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local rughadjeenType = caster:getVar("RUGHADJEEN_TYPE")
    if (rughadjeenType == 0) then
        caster:spawnTrust(119)
    elseif (rughadjeenType == 1) then
        caster:spawnTrust(120)
    elseif (rughadjeenType == 1) then
        caster:spawnTrust(121)
    end
    return 0
end
