-----------------------------------------
-- Spell: Zeid
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
    local zeidType = caster:getVar("ZEID_TYPE")
    if (zeidType == 1) then
        caster:spawnTrust(107)
    elseif (zeidType == 2) then
        caster:spawnTrust(108)
    else
        caster:spawnTrust(106)
    end
    return 0
end