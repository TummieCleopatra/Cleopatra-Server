-----------------------------------------
-- Spell: Excenmille
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
    local excenmilleType = caster:getVar("EXCENMILLE_TYPE")
    if (excenmilleType == 1) then
        caster:spawnTrust(94)
    elseif (excenmilleType == 2) then
        caster:spawnTrust(95)
    else
        caster:spawnTrust(93)
    end
    return 0
end