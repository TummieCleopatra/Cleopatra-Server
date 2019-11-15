-----------------------------------
-- Ability: Cascade
-- Grants a damage bonus to next elemental spell cast.
-- Obtained: Black Mage Level 1
-- Recast Time: 0:01:00
-- Duration: 0:01:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)
    player:addStatusEffect(dsp.effect.CASCADE,1,0,60);
end;