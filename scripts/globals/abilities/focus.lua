-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local boost = player:getStatusEffect(dsp.effect.BOOST)
    local lvl = player:getMainLvl()
    local activeboost = 0
    player:setVar("MNKFocusLevel",lvl)

 	player:setVar("MNKBoostNumberFocus",0);
	if (boost ~= nil) then
        printf("Boost Active")
        activeboost = player:getActiveBoosts();
	    player:setVar("MNKBoostNumberFocus",activeboost);
        player:removeAllBoosts();
    end

    local focusBoost = player:getVar("MNKBoostNumberFocus")
    local power = (((lvl / 3.5) * focusBoost) + 11) + player:getMod(dsp.mod.FOCUS_EFFECT)

    player:addStatusEffect(dsp.effect.FOCUS,power,0,30)
end