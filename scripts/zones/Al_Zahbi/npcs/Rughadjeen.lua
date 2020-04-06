-----------------------------------
-- Area: Al Zahbi
--  NPC: Rughadjeen
-- Type: Skyserpent General
-- !pos -74.150 -7 70.656 48
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,10000) and player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:hasItem(10145) == false) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 10145);
		else
		    player:addItem(10145);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,10145);
		    player:tradeComplete();
		    player:setVar("Rughadjeen_Fight", 1);
    	end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Rughadjeen_Fight") == 1) then
	    player:PrintToPlayer("Rughadjeen : Remember, head to the Talacca Cove and trade my Cipher to the door...if you dare..." ,0x0D);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Rughadjeen_Fight") == 2) then
	    player:PrintToPlayer("Rughadjeen : That was quite a fight.  I will now fight by your side..." ,0x0D);
		player:setVar("Rughadjeen_Fight",3);
		player:addSpell(960);
		player:PrintToPlayer("You are now able to summon Rughadjeen as a Trust!", 0x15);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Rughadjeen_Fight") == 2 and player:hasSpell(960) and player:getVar("MythicQuest1") == 1) then
	    if (player:hasKeyItem(dsp.ki.LILAC_RIBBON)) then
		    player:PrintToPlayer("Key Item cannot be obtained because you already have this item." ,0x0D);
		else
		    player:PrintToPlayer("Rughadjeen : Here you go." ,0x0D);
		    player:addKeyItem(dsp.ki.LILAC_RIBBON);
			player:setVar("Rughadjeen_Fight",3);
		    player:messageSpecial(ID.text.KEYITEM_OBTAINED,LILAC_RIBBON);
        end
    elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN)) then
	    player:PrintToPlayer("Rughadjeen : So you want to challenge me?  Fork over 10,000 gil..." ,0x0D);
    else
	    player:startEvent(0x0109);
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
