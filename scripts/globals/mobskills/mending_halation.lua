---------------------------------------------------
-- Mending Halation
--
-- Description: Causes your luopan to vanish and
-- restores HP of party members within area of effect.
-- Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)

	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local master = mob:getMaster();
	local party = master:getParty();
	local dmg = mob:getHP();
	local relicpants = master:getEquipID(dsp.slot.LEGS);
	local bonus = 1;
	local geo = master:getSkillLevel(dsp.skill.GEOMANCY);
	local bell = master:getSkillLevel(dsp.skill.BELL);

	local base = (geo + bell) * 0.40;

	if (relicpants == 12245) then
	    bonus = 1.10;
	end

	-- Calculate HP Healed
	local lvl = mob:getMainLvl();
	local hp = (4.2 * lvl + base) * bonus;


	skill:setMsg(dsp.msg.basic.SELF_HEAL_SECONDARY);

    mob:addStatusEffect(dsp.effect.POISON, 3500,3,6);

	target:addHP(hp);
    return hp;
end;
