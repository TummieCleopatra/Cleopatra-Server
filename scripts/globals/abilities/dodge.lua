-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
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

 	player:setVar("MNKBoostNumberDodge",0);
	if (boost ~= nil) then
        local activeboost = player:getActiveBoosts();
	    player:setVar("MNKBoostNumberDodge",activeboost);
        player:removeAllBoosts();
    end

    local dodgeBoost = player:getVar("MNKBoostNumberDodge")
    local power = (((lvl / 3.5) * dodgeBoost) + 11) + player:getMod(dsp.mod.DODGE_EFFECT)

    player:addStatusEffect(dsp.effect.DODGE,power,0,30)
end