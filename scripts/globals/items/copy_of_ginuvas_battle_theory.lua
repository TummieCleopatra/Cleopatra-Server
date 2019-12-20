-----------------------------------------
-- ID: 4198
-- Item: Copy of "Ginuva's Battle Theory"
-- Grants 50 - 200 EXP
-- Does not grant Limit Points.
--
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local check = 56
    if (target:getMainLvl() >= 65) then
        check = 0
    end
    return check
end

function onItemUse(target)
	local currencyrand = math.random(4,8);
	target:addItem(1452,currencyrand);
    target:PrintToPlayer("You obtain "..currencyrand.." Ordelle Bronze Pieces.", 0x15);
end;
