-----------------------------------------
-- Spell: Najelith
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
    local najelithType = caster:getVar("NAJELITH_TYPE")
    if (najelithType == 1) then
        caster:spawnTrust(116)
    elseif (najelithType == 2) then
        caster:spawnTrust(117)
    else
        caster:spawnTrust(115)
    end
    return 0
end