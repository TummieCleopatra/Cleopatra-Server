-----------------------------------
-- Ability: Bolster
-- Enhances the effects of your geomancy spells.
-- Obtained: Geomancer Level 1
-- Recast Time: 60 minutes
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
    player:addStatusEffect(dsp.effect.BLAZE_OF_GLORY, 0, 3, 30)
end;