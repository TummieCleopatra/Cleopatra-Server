-----------------------------------------
-- ID: 4249
-- Item: Copy of Schultz Stratage
-- Grants 150 - 500 EXP
-- Does not grant Limit Points.
--
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
	local check = 56;
	if (target:getMainLvl() >= 65) then
		check = 0;
	end
	return check;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local currencyrand = math.random(4,8);
	target:addItem(1455,currencyrand);

end;
