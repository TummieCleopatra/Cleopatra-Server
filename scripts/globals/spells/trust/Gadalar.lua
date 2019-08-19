-----------------------------------------
-- Spell: Gadalar
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local gadalarType = caster:getVar("GADALAR_TYPE")
    if (gadalarType == 0) then
        caster:spawnTrust(113)
    elseif (gadalarType == 1) then
        caster:spawnTrust(114)
    elseif (gadalarType == 1) then
        caster:spawnTrust(115)
    end
    return 0
end
