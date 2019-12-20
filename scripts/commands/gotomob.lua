---------------------------------------------------------------------------------------------------
-- func: gotomob
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------
--[[
cmdprops =
{
    permission = 1,
    parameters = "sssss"
};

function onTrigger(player, id)

    local mob = GetMobByID(id)
	local pos = mob:getPos()

	local x = pos.x
	local y = pos.y
	local z = pos.z

	player:setPos(x, y, z);
end
]]--