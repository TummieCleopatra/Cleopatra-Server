-----------------------------------
-- Ability: Majesty
-- Increases Cure potency and reduces Cure recast time. Additionally,
--     causes Cure spells to heal party members in area of effect.
-- Obtained: Paladin Level 70
-- Recast Time: 1:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effect.MAJESTY,25,3,180)
end