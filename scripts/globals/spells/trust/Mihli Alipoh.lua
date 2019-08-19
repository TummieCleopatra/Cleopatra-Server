-----------------------------------------
-- Spell: Mihli Alipoh
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local mihliType = caster:getVar("MIHLI_TYPE")
    if (mihliType == 0) then
        caster:spawnTrust(110)
    elseif (mihliType == 1) then
        caster:spawnTrust(111)
    elseif (mihliType == 1) then
        caster:spawnTrust(112)
    end
    return 0
end
