---------------------------------------------------------------------------------------------------
-- func: @additem <itemId> <quantity> <points towards rank> <path> <rank 1-15> <0> <aug>
-- desc: Adds an item to the GMs inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiiiiiiiii"
};

function onTrigger(player, itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]


    -- Ensure item id was given..
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        player:PrintToPlayer( "You must enter a valid item id." );
        return;
    end

    -- Ensure the GM has room to obtain the item...
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId );
        return;
    end

    -- Give the GM the item...
    player:addWeaponMezzotint( itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId );
    player:messageSpecial( ID.text.ITEM_OBTAINED, itemId );
end