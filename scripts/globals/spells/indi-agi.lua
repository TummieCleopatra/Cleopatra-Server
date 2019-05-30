-- Spell: Indi-AGI
-- Enhances Agility for party members near the caster.
-- Bolster increases potency x2
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/magic");
require("scripts/globals/job_util");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)

	bellCheck(caster, bell)

    if (bell == 2) then
	    caster:PrintToPlayer("You cannot use Geomancy without a bell",0xD);
	else
	    return 0;
	end
end;

function onSpellCast(caster,target,spell)
    local potency = doGeoPotency(caster, target, spell)
	local duration = 180 + caster:getMod(dsp.mod.INDI_DURATION);
    caster:addStatusEffectEx(dsp.effect.INDI_AGI,dsp.effect.COLURE_ACTIVE,potency,3,duration)
	return 0;
end;