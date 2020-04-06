-----------------------------------
--  Area: Al Zahbi
--   NPC: Zazarg
--  Type: Stoneserpent General
-- @zone: 48
--  @pos -41.675 -8 104.452
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,10000) and player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Zazarg_Fight") == nil) then
        player:PrintToPlayer("Zazarg : Meet me in the Hazhalm Testing Grounds, just examine the door no item need..." ,0x0D);
		player:tradeComplete();
		player:setVar("Zazarg_Fight", 1);
		player:setVar("ZAZARG_CIPHER",1);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Zazarg_Fight") == 1) then
	    player:PrintToPlayer("Zazarg : Remember, meet me in the Hazhalm Testing Grounds, just examine the door no item need..." ,0x0D);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Zazarg_Fight") == 2) then
	    player:PrintToPlayer("Zazarg : That was quite a fight.  I will now fight by your side..." ,0x0D);
		player:setVar("Zazarg_Fight",3);
		player:addSpell(924);
		player:PrintToPlayer("You are now able to summon Zazarg as a Trust!", 0x15);
	elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN) and player:getVar("Zazarg_Fight") == 2 and player:hasSpell(924) and player:getVar("MythicQuest1") == 1) then
	    if (player:getFreeSlotsCount() == 0 or player:hasItem(2461)) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2461);
		else
		    player:PrintToPlayer("Zazarg : Here you go." ,0x0D);
		    player:messageSpecial(ID.text.ITEM_OBTAINED,2461);
		    player:addItem(2461);
			player:setVar("Zazarg_Fight",3);
        end
    elseif (player:hasCompletedMission(TOAU, dsp.mission.id.toau.THE_BLACK_COFFIN)) then
	    player:PrintToPlayer("Zazarg : So you want to challenge me?  Fork over 10,000 gil..." ,0x0D);
    else
	    player:startEvent(0x010d);
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
