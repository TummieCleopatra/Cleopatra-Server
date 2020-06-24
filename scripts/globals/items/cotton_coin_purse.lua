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
    if (amount > 99) then
        local overage = amount - 99
        target:addItem(2488,amount);
        target:addItem(2488,overage)
        target:messageBasic(557,0,99);
        target:messageBasic(557,0,overage);

    else
       target:messageBasic(557,0,amount);
	    target:messageBasic(557,0,amount);
    end
end;
