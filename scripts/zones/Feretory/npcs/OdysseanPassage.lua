-----------------------------------
--	Area: Feretory
--	NPC:  Odyssean Passage
--	Working 100%
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- 1: Windurst
    -- 2: Bastok
    -- 3: San d'Oria
    local warp = player:getVar("FeretoryWarp");
	if (warp == 1) then -- Windurst Warp
	    player:setPos(218,-12,223,123,240);
	elseif (warp == 2) then -- Bastok Warp
	    player:setPos(81,8,-231,100,236);
	elseif (warp == 3) then -- San d'Oria
	    player:setPos(83,0,41,100,231);
	end

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



