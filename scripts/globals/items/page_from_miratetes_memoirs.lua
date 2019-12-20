-----------------------------------------
-- ID: 4247
-- Item: Page From Miratete's Memo
-- Grants 750 - 1,500 EXP
-- Does not grant Limit Points.
--
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local check = 56
    if (target:getMainLvl() >= 20) then
        check = 0
    end
    return check
end

function onItemUse(target)
	local currencyrand = math.random(4,8);
	
	target:addItem(1449,currencyrand);
	target:PrintToPlayer("You obtain "..currencyrand.." Tukuku Whiteshells.", 0x15);
end;
