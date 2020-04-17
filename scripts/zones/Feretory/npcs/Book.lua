-----------------------------------
-- Area: Ferretory
-- NPC: Suibhne
-- Checks Feretory Aura
-----------------------------------

-----------------------------------

local ID = require("scripts/zones/Feretory/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local aura = player:getVar("FerretoryAura");
    local boonpower = player:getVar("FerretoryMageBoonPower");
    local meleeboonpower = player:getVar("FerretoryMeleeBoonPower");
    if (aura == 0) then
        player:PrintToPlayer("Feretory Compendium : You don't have any Feretory Aura.", 0xD);
    end
    if (aura > 0) and (aura < 4) then
        player:PrintToPlayer("Feretory Compendium : Your Aura is currently at level " ..aura..". You should work harder to increase it.", 0xD);
    end
    if (aura > 3) and (aura < 9) then
        player:PrintToPlayer("Feretory Compendium : Your Aura is currently at level " ..aura..". Keep up the work.", 0xD);
    end
    if (aura == 10) then
        player:PrintToPlayer("Feretory Compendium : Your Aura is at level " ..aura..". You cannot improve further", 0xD);
    end


	local mabboon = (math.floor(boonpower * 1.43));
	local fcboon = (math.floor((boonpower * 0.5) -1));
	local maccboon = boonpower;
	local curepotboon = (boonpower - 4);
	if (curepotboon < 0) then
		curepotboon = 0;
	end

	local attboon = (meleeboonpower * 2) + 1;
	local rattboon = (meleeboonpower * 2) + 1;
	local accboon = (math.floor(meleeboonpower * 1.5));
    local storetpboon = (math.floor((meleeboonpower * 0.5) - 1));
	if (storetpboon < 0) then
	    storetpboon = 0;
	end


player:PrintToPlayer("Feretory Compendium : The following Perks are active:",0xD);
player:PrintToPlayer("Feretory Compendium : Magic Atk+"..mabboon.." Magic Acc.+"..maccboon.." Cure Potency+"..curepotboon.."% ", 0xD);
player:PrintToPlayer("Feretory Compendium : Atk/R.Atk+"..attboon.." Acc/R.Acc+"..accboon.." Store TP+"..storetpboon..".", 0xD);

end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



