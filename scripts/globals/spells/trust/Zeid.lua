-----------------------------------------
-- Spell: Zeid
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local zeidType = caster:getVar("ZEID_TYPE")
    if (zeidType == 0) then
        caster:spawnTrust(107)
    elseif (zeidType == 1) then
        caster:spawnTrust(108)
    elseif (zeidType == 1) then
        caster:spawnTrust(109)
    end
    return 0
end
