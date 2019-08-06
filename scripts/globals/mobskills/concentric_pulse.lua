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
    printf("OK LETS DO IT")
	local dmg = mob:getHP() / 2;
	-- local relicpants = master:getEquipID(dsp.slot.LEGS);

		    target:delHP(dmg);
    mob:delHP(5000)
    return dmg;
end;
