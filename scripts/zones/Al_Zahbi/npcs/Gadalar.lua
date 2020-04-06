-----------------------------------
-- Area: Al Zahbi
--  NPC: Gadalar
-- Type: Fireserpent General
-- !pos -105.979 -7 39.692 48
-----------------------------------

local ID = require("scripts/zones/Al_Zahbi/IDs")
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,10000) and player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Gadalar_Fight") == nil) then
        player:PrintToPlayer("Gadalar : Meet me in the Navukgo Execution Chamber, just examine the door no item need..." ,0x0D);
		player:tradeComplete();
		player:setVar("Gadalar_Fight", 1);
		player:setVar("GADALAR_CIPHER",1);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Gadalar_Fight") == 1) then
	    player:PrintToPlayer("Gadalar : Remember, meet me in the Navukgo Execution Chamber, just examine the door no item need..." ,0x0D);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Gadalar_Fight") == 2) then
	    player:PrintToPlayer("Gadalar : That was quite a fight.  I will now fight by your side..." ,0x0D);
		player:setVar("Gadalar_Fight",3);
		player:addSpell(919);
		player:PrintToPlayer("You are now able to summon Gadalar as a Trust!", 0x15);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Gadalar_Fight") == 2 and player:hasSpell(919) and player:getVar("MythicQuest1") == 1) then
	    if (player:getFreeSlotsCount() == 0 or player:hasItem(2729)) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2729);
		else
		    player:PrintToPlayer("Gadalar : Here you go." ,0x0D);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,2729);
		    player:addItem(2729);
			player:setVar("Gadalar_Fight",3);
        end
    elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN)) then
	    player:PrintToPlayer("Gadalar : So you want to challenge me?  Fork over 10,000 gil..." ,0x0D);
    else
	    player:startEvent(0x010a);
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
