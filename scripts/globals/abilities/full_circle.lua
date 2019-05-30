-----------------------------------
-- Ability: Full Circle
-- Causes your luopan to vanish.
-- Obtained: Geomancer Level 5
-- Recast Time: 10 seconds
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg")

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    -- TODO: Add pet check (75)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet()
	local pethp = (pet:getHPP()/100);


	local mpcost = player:getVar("FullCircle");
	local returnmp = ((0.50 * mpcost) * pethp) * (1 + ((player:getMerit(dsp.merit.MERIT_FULL_CIRCLE )) / 100));
	target:despawnPet();
	player:addMP(returnmp);
	player:messageBasic(dsp.msg.basic.RECOVERS_MP, 0, returnmp);
	-- add regen

end;