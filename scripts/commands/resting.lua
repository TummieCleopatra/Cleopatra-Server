---------------------------------------------------------------------------------------------------
-- func: checks time
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player)
local resting = player:getStatusEffect(dsp.effect.RESTING_BONUS);
local power = resting:getPower();
player:PrintToPlayer("You have been granted a Resting Bonus of +"..power.."% Experience Points gained through battles.", 0x1C);
end