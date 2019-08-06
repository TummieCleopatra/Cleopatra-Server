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
	local dmg = pet:getHP();
	-- local relicpants = master:getEquipID(dsp.slot.LEGS);
	local nearbyTargets = pet:getTargetsWithinArea(7, 8);
    for i,member in ipairs(nearbyTargets) do
	    if (member:getObjType() == dsp.objType.MOB) then

		    local mob = member:getID();
			GetMobByID(mob):updateEnmity(target);
		    member:delHP(dmg);
        end

	end




   -- return hp;
end;
