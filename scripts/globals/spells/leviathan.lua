-----------------------------------------
-- Spell: Leviathan
-- Summons Leviathan to fight by your side
-----------------------------------------
require("scripts/globals/summon")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUseMisc(dsp.zoneMisc.PET)) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    elseif (caster:hasPet()) then
        return dsp.msg.basic.ALREADY_HAS_A_PET
    elseif (caster:getObjType() == dsp.objType.PC) then
        return avatarMiniFightCheck(caster)
    end
    return 0
end

function onSpellCast(caster,target,spell)
    caster:spawnPet(dsp.pet.id.LEVIATHAN)
    local skill = caster:getSkillLevel(dsp.skill.SUMMONING_MAGIC);
    local pet = caster:getPet();
    local avatarBuff = 1 + (skill / 33)
    local enspellPower = (skill / 35) + 1

    if (pet ~= nill) then
        pet:addStatusEffect(dsp.effect.LEVIATHAN_S_FAVOR, avatarBuff, 3, 3000);
        pet:addStatusEffect(dsp.effect.ENWATER,enspellPower,0,3000);
    end

    return 0
end
