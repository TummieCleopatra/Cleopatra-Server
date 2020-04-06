-----------------------------------
-- Area: Al Zahbi
--  NPC: Mihli Aliapoh
-- Type: Waterserpent General
-- !pos -22.615 -7 78.907 48
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,10000) and player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:hasItem(10115) == false) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 10115);
		else
		    player:addItem(10115);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,10115);
		    player:tradeComplete();
		    player:setVar("Mihli_Fight", 1);
    	end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Mihli_Fight") == 1) then
	    player:PrintToPlayer("Mihli Aliapoh : Remember, head to the Talacca Cove and trade my Cipher to the door...if you dare..." ,0x0D);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Mihli_Fight") == 2 and player:hasSpell(909) == false) then
	    player:PrintToPlayer("Mihli Aliapoh : That was quite a fight.  I will now fight by your side..." ,0x0D);
		player:setVar("Mihli_Fight",3);
		player:addSpell(909);
		player:PrintToPlayer("You are now able to summon Mihli Aliapoh as a Trust!", 0x15);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Mihli_Fight") == 2 and player:hasSpell(909) and player:getVar("MythicQuest1") == 1) then
	    if (player:getFreeSlotsCount() == 0 or player:hasItem(2463)) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2463);
		else
		    player:PrintToPlayer("Mihli Aliapoh : Here you go." ,0x0D);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,2463);
		    player:addItem(2463);
			player:setVar("Mihli_Fight",3);
        end
    elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN)) then
	    player:PrintToPlayer("Mihli Aliapoh : So you want to challenge me?  Fork over 10,000 gil..." ,0x0D);
    else
	    player:startEvent(0x010b);
    end
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
