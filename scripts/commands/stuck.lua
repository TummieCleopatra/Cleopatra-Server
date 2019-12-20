---------------------------------------------------------------------------------------------------
-- func: return <player>
-- desc: Warps GM or target player to their previous zone
---------------------------------------------------------------------------------------------------
require("scripts/globals/zone")
require("scripts/globals/status")
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!return {player}");
end;

function onTrigger(player, target)
	local lastUsed = player:getVar("LastStuck")
	if (os.time() > lastUsed + 14400) then
		-- validate target
		local targ;
		if (target == nil) then
			targ = player;
		end

		-- get previous zone
		local pNation = player:getNation()
		if pNation == dsp.nation.BASTOK then
			player:setPos(89, 0 , -66, 0, 234)
		elseif pNation == dsp.nation.SANDORIA then
			player:setPos(49, -1 , 29, 164, 231)
		else
			player:setPos(193, -12 , 220, 64, 240)
		end
		player:setVar("LastStuck",os.time())
	else
      player:PrintToPlayer("You must wait to use this command again")
	end
end