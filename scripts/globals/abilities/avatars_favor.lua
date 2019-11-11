-----------------------------------
-- Ability: Avatar's Favor
-- Enhances Avatar's Attack Power at the cost of avatar perpetuation

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

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effect.AVATAR_S_FAVOR,1,0,300)
end;