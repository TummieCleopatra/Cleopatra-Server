-----------------------------------------
-- Spell: Nanaa Mihgo
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
    local nanaaType = caster:getVar("NANAA_TYPE")
    if (nanaaType == 1) then
        caster:spawnTrust(89)
    elseif (nanaaType == 2) then
        caster:spawnTrust(90)
    else
        caster:spawnTrust(88)
    end
    return 0
end