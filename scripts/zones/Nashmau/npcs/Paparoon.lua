-----------------------------------
-- Area: Nashmau
--  NPC: Paparoon
-- Standard Info NPC
-----------------------------------

local ID = require("scripts/zones/Nashmau/IDs");

function onTrade(player,npc,trade)

    local alexcount = trade:getItemCount();
	local alextrade = trade:getItemQty(2488);
	local alexbank = player:getVar("Alexandrite_Bank");
	local remaining = 30000;
	if (alextrade == alexcount) then
	    alexbank = alexbank + alextrade;
		player:setVar("Alexandrite_Bank",alexbank);
		print(alexbank)
		remaining = remaining - alexbank;
		player:startEvent(29,remaining);
		player:tradeComplete()
	end


end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x001A);
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


	local alexbank = player:getVar("Alexandrite_Bank");
	if (alexbank >= 30000 and csid == 29) then
	    player:addItem(3443,1);
		player:messageSpecial(ID.text.ITEM_OBTAINED,3443)
		player:setVar("Alexandrite_Bank",0);
		player:setVar("MythicAquisition",1)
		printf("Someone got a cats eye!")
	end
end;