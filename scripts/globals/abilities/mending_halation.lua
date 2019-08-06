---------------------------------------------------
-- Ability: Mending Halation
-- Causes your luopan to vanish and restores HP
-- of party members within area of effect.
-- Obtained: Geomancer Level 70
-- Recast Time: 5:00
-- Duration: Instant
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	local party = player:getParty();
	if (party ~= nil) then
	    for i,members in pairs(party) do
			if (members:checkDistance(target) < 10) then
				return 0, 0;
			end
		end
    else
 	    for i,members in pairs(party) do
			if (members:checkDistance(target) < 10) then
				return 0, 0;
			end
		end
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet()
    printf("Trying")
	pet:useMobAbility(3051)
end;
