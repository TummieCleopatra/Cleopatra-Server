-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local power = 3.5 + (0.10 * player:getMod(dsp.mod.BOOST_EFFECT))
    local level = player:getMainLvl();
    local boosts = target:getActiveBoosts()

    if ((level < 40) and (target:getActiveBoosts() == 1) and (player:getMainJob() == 2)) then
	    target:removeOldestBoost();
	elseif ((level < 70) and (target:getActiveBoosts() == 2) and (player:getMainJob() == 2)) then
	    target:removeOldestBoost();
    elseif ((level <= 75) and (target:getActiveBoosts() == 3) and (player:getMainJob() == 2)) then
	    target:removeOldestBoost();
    elseif (player:getSubJob() == 2) then
        target:removeOldestBoost();
    end

    player:addStatusEffect(dsp.effect.BOOST,power,3,180)

end