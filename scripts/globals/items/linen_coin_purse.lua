-----------------------------------------
-- ID: 5736
-- Item: Linen Coin Purse
-- Grants 150-225 Alexandrite
--
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local amount = math.random(1,100);
	if (amount < 35) then
	    target:addItem(5735,1);
		target:addItem(5735,1);
		-- target:addItem(5735,1);
	    target:PrintToPlayer("You obtain 2 Cotton Coin Purses", 0x15);
    else
	    target:addItem(5735,1);
		-- target:addItem(5735,1);
		target:PrintToPlayer("You obtain 1 Cotton Coin Purses", 0x15);
	end


end;
