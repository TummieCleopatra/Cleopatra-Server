-----------------------------------------
-- Spell: Zazarg
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
    local zazargType = caster:getVar("ZAZARG_TYPE")
    if (zazargType == 1) then
        caster:spawnTrust(123)
    elseif (zazargType == 2) then
        caster:spawnTrust(124)
    else
        caster:spawnTrust(122)
    end
    return 0
end