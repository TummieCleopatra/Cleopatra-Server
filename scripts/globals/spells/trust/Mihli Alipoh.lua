-----------------------------------------
-- Spell: Mihli Alipoh
-----------------------------------------
require("scripts/globals/trust_utils");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    trustSpawnCheck(caster, target, spell)
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    local mihliType = caster:getVar("MIHLI_TYPE")
    if (mihliType == 1) then
        caster:spawnTrust(110)
    elseif (mihliType == 2) then
        caster:spawnTrust(111)
    else
        caster:spawnTrust(109)
    end
    return 0
end