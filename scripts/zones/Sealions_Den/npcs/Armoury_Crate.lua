-----------------------------------
-- Area: Sealion's Den
--  NPC: Sueleen
-- !pos 612 132 774 32
-----------------------------------
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm")
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local party = player:getParty();
    if (party ~= nil) then
	    for i,member in ipairs(party) do
		    if (member:getObjType() == dsp.objType.PC) then
	            member:setVar("PRISHE_WIN",1);
		    end
	    end	
	elseif (party == nil) then
	    player:setVar("PRISHE_WIN",1);
	end	

    player:getBCNMloot();
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;