-----------------------------------
-- Area: Al Zahbi
--  NPC: Najelith
-- Type: Galeserpent General
-- !pos -64.526 -8 39.372 48
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,10000) and player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:hasItem(10125) == false) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 10125);
		else
		    player:addItem(10125);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,10125);
		    player:tradeComplete();
		    player:setVar("Najelith_Fight", 1);
    	end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Najelith_Fight") == 1) then
	    player:PrintToPlayer("Najelith : Remember, head to the Jade Sepulcher and trade my Cipher to the door...if you dare..." ,0x0D);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Najelith_Fight") == 2) then
	    player:PrintToPlayer("Najelith : That was quite a fight.  I will now fight by your side..." ,0x0D);
		player:setVar("Najelith_Fight",3);
		player:addSpell(929);
		player:PrintToPlayer("You are now able to summon Najelith as a Trust!", 0x15);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Najelith_Fight") == 2 and player:hasSpell(929) and player:getVar("MythicQuest1") == 1) then
	    if (player:getFreeSlotsCount() == 0 or player:hasItem(2462)) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2462);
		else
		    player:PrintToPlayer("Najelith : Here you go." ,0x0D);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,2462);
		    player:addItem(2462);
			player:setVar("Najelith_Fight",3);
        end
    elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN)) then
	    player:PrintToPlayer("Najelith : So you want to challenge me?  Fork over 10,000 gil..." ,0x0D);
    else
	    player:startEvent(0x010d);
	end
	-- player:startEvent(0x010d);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;