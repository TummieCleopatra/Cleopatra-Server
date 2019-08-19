-----------------------------------------
-- Spell: Najelith
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local najelithType = caster:getVar("NAJELITH_TYPE")
    if (najelithType == 0) then
        caster:spawnTrust(116)
    elseif (najelithType == 1) then
        caster:spawnTrust(117)
    elseif (najelithType == 1) then
        caster:spawnTrust(118)
    end
    return 0
end
