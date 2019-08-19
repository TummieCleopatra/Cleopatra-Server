-----------------------------------------
-- Spell: Excenmille
-----------------------------------------
-- require("scripts/globals/trust");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    -- if (caster:hasHate()) then
	   -- caster:messageBasic(700,0,0)
    -- else
        return 0
    -- end
end

function onSpellCast(caster,target,spell)
    -- Todo: put Trusts's spawn in dialog here or in entity script?
    -- Todo: automate entity spawn in core for trust spells?
    local najiType = caster:getVar("EXCENMILLE_TYPE")
    if (excenmilleType == 0) then
        caster:spawnTrust(94)
    elseif (excenmilleType == 1) then
        caster:spawnTrust(95)
    elseif (excenmilleType == 2) then
        caster:spawnTrust(96)
    end
    return 0
end