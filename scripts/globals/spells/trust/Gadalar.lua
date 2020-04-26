-----------------------------------------
-- Spell: Gadalar
-----------------------------------------
require("scripts/globals/trust_utils");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local check = trustSpawnCheck(caster, target, spell)
    return check
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    local gadalarType = caster:getVar("GADALAR_TYPE")
    if (gadalarType == 1) then
        caster:spawnTrust(113)
    elseif (gadalarType == 2) then
        caster:spawnTrust(114)
    else
        caster:spawnTrust(112)
    end
    return 0
end