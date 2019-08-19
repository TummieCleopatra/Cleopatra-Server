-----------------------------------------
-- Spell: Zazarg
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local zazargType = caster:getVar("ZAZARG_TYPE")
    if (zazargType == 0) then
        caster:spawnTrust(122)
    elseif (zazargType == 1) then
        caster:spawnTrust(123)
    elseif (zazargType == 1) then
        caster:spawnTrust(124)
    end
    return 0
end
