-----------------------------------------
-- Spell: Zazarg
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
    local zazargType = caster:getVar("ZAZARG_TYPE")
    if (zazargType == 1) then
        caster:spawnTrust(122)
    elseif (zazargType == 2) then
        caster:spawnTrust(123)
    else
        caster:spawnTrust(121)
    end
    return 0
end