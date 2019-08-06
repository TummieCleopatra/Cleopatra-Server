-----------------------------------------
-- Spell: Geo-Regen
-- Gradually restores target party member's HP
-- Bolster increases potency x2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/job_util");
require("scripts/globals/msg");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	--[[local result = 0;
	if(caster:hasPet()) then
      result = 1;
   elseif (not caster:canUsePet()) then
		result = dsp.msg.basic.CANT_BE_USED_IN_AREA;
    end]]

return 0;
end;

function onSpellCast(caster,target,spell)
	local potency = doGeoPotency(caster, target, spell)

    caster:spawnPet(75)
    local pet = caster:getPet()
    local hploss = math.floor((pet:getMaxHP())/70);  -- Sets DoT
    finalizeLuopan(pet, target, hploss)
    pet:setModelId(2856)
    pet:addStatusEffectEx(dsp.effect.INDI_REGEN,dsp.effect.COLURE_ACTIVE,potency,3,600)
    caster:setVar("FullCircle",74);
	return 0;
end;