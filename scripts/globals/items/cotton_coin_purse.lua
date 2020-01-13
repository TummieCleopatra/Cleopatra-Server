-----------------------------------------
-- ID: 5735
-- Item: Cotton Coin Purse
-- Grants 50-75 Alexandrite
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
    local amount = math.random(59,82);
    amount = amount * ALEX_MULT;
	target:addItem(2488,amount);
	target:messageBasic(557,0,amount);
end;
