-----------------------------------------
-- Spell: Kupipi
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
    local kupipiType = caster:getVar("KUPIPI_TYPE")

    if (kupipiType == 1) then
        caster:spawnTrust(83)
    elseif (kupipiType == 2) then
        caster:spawnTrust(84)
    else
        caster:spawnTrust(82)
    end
    return 0
end