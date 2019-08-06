---------------------------------------------------
-- Mending Halation
--
-- Description: Causes your luopan to vanish and
-- restores HP of party members within area of effect.
-- Type: Magical (Light)
--
--
--------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    printf("SKill check")
    return 0,0
end

function onPetAbility(target, pet, skill)
    printf("SKill check")
    local master = pet:getMaster();
	local party = master:getParty();
	local dmg = pet:getHP();
	local relicpants = master:getEquipID(dsp.slot.LEGS);
	local bonus = 1;
	local geo = master:getSkillLevel(dsp.skill.GEOMANCY);
	local bell = master:getSkillLevel(dsp.skill.BELL);

	local base = (geo + bell) * 0.40;

	if (relicpants == 12245) then
	    bonus = 1.10;
	end

	-- Calculate HP Healed
	local lvl = pet:getMainLvl();
	local hp = (4.2 * lvl + base) * bonus;


	skill:setMsg(dsp.msg.basic.SELF_HEAL_SECONDARY);



	target:addHP(hp);
    pet:setHP(0)
    return hp;
end;
