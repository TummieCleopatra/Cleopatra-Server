-----------------------------------------
-- Spell: Rughadjeen
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
    local rughadjeenType = caster:getVar("RUGHADJEEN_TYPE")
    if (rughadjeenType == 1) then
        caster:spawnTrust(119)
    elseif (rughadjeenType == 2) then
        caster:spawnTrust(120)
    else
        caster:spawnTrust(118)
    end
    return 0
end