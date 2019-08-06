-----------------------------------
--	Area: Windurst Walls
--	NPC:  Kupofreid
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
	if (player:getVar("Kupo_Paragon") ~= 1) then
		if (player:getMainLvl() >= 75) then
		    player:setVar("Kupo_Paragon",1);
			player:PrintToPlayer("KupoKupo : You now have clearance to participate in Paragon.", 0xD);	
		else
		player:PrintToPlayer("KupoKupo : Sorry, I can't help you at this time.", 0xD);
        end
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


