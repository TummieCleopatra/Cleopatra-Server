-----------------------------------------
-- Spell: Ayame
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
    local ayameType = caster:getVar("AYAME_TYPE")
    if (ayameType == 1) then
        caster:spawnTrust(86)
    else
        caster:spawnTrust(85)
    end
    return 0
end