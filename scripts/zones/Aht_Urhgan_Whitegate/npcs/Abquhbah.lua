-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Abquhbah
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    --[[
    local promotion = player:getVar("AssaultPromotion")
    local rank = 0

    if promotion <= 7 then
        rank = 1
    elseif promotion >= 8 and promotion <= 11 then
        rank = 2
    elseif promotion >= 12 and promotion <= 18 then
        rank = 3
    elseif promotion >= 19 then
        rank = 4
    end


    player:startEvent(255, rank)
	]]--

	player:startEvent(255)
end

function onEventUpdate(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    local points = player:getVar("Mercenary_Points")
	if (player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah :  You currently have the highest Mercenary Rank and cannot advance any further.",0xD);
	elseif (points == 22500 and player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CAPTAIN_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",3750);
        player:setVar("Merc_Cap",25000);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 25000!",0x1C);
		player:stopEvent()
 	elseif (points < 22500 and player:hasKeyItem(dsp.ki.FL_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 22500 to rank up.",0xD);
        player:stopEvent()
	elseif (points == 20000 and player:hasKeyItem(dsp.ki.FL_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.FL_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.FL_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",3375);
        player:setVar("Merc_Cap",22500);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 22500!",0x1C);
		player:stopEvent()
 	elseif (points < 20000 and player:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 20000 to rank up.",0xD);
        player:stopEvent()
	elseif (points == 17500 and player:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.SL_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SL_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",3000);
        player:setVar("Merc_Cap",20000);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 20000!",0x1C);
		player:stopEvent()
 	elseif (points < 17500 and player:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 17500 to rank up.",0xD);
        player:stopEvent()
	elseif (points == 15000 and player:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.CS_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CS_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",2625);
        player:setVar("Merc_Cap",17500);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 17500!",0x1C);
		player:stopEvent()
 	elseif (points < 15000 and player:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 15000 to rank up.",0xD);
        player:stopEvent()
	elseif (points == 12500 and player:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.SM_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SM_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",2250);
        player:setVar("Merc_Cap",15000);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 15000!",0x1C);
		player:stopEvent()
 	elseif (points < 12500 and player:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 12500 to rank up.",0xD);
        player:stopEvent()
 	elseif (points == 10000 and player:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.S_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.S_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",1875);
        player:setVar("Merc_Cap",12500);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 12500!",0x1C);
		player:stopEvent()
 	elseif (points < 10000 and player:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 10000 to rank up.",0xD);
        player:stopEvent()
 	elseif (points == 7500 and player:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.C_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.C_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",1500);
        player:setVar("Merc_Cap",10000);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 10000!",0x1C);
		player:stopEvent()
 	elseif (points < 7500 and player:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 7500 to rank up.",0xD);
        player:stopEvent()
 	elseif (points == 5000 and player:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.LC_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.LC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",1125);
        player:setVar("Merc_Cap",7500);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 7500!",0x1C);
        player:stopEvent()
 	elseif (points < 5000 and player:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 5000 to rank up.",0xD);
        player:stopEvent()
 	elseif (points == 2500 and player:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.SP_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SP_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",750);
        player:setVar("Merc_Cap",5000);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 5000!",0x1C);
		player:stopEvent()
 	elseif (points < 2500 and player:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 2500 to rank up.",0xD);
        player:stopEvent()
 	elseif (points == 1000 and player:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : You have gain have gained a new Mercenary Rank!  Regrettably, I have to take your points away but keep up the good work!",0xD);
	    player:addKeyItem(dsp.ki.PFC_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PFC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",375);
        player:setVar("Merc_Cap",2500);
        player:setVar("Mercenary_Points",0)
        player:PrintToPlayer("Your new Mercenary Point cap has been raised to 2500!",0x1C);
		player:stopEvent()
 	elseif (points < 1000 and player:hasKeyItem(dsp.ki.PSC_WILDCAT_BADGE) == true) then
	    player:PrintToPlayer("Abquhbah : Hmmm...it seems you only have "..points.." Mercenary Points.  You need a total of 1000 to rank up.",0xD);
		player:setVar("Besieged_Cap",150);
		printf("Player has been assigned cap 150!!!!!!!!");
        player:stopEvent()
 	elseif (player:hasKeyItem(dsp.ki.PSC_WILDCAT_BADGE) == false) then
	    player:PrintToPlayer("Abquhbah : Looks like you haven't done any Besieged...help out the capital and gain some ranks.  Here is your first Wildcat Badge!",0xD);
	    player:addKeyItem(dsp.ki.PSC_WILDCAT_BADGE);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PSC_WILDCAT_BADGE);
		player:setVar("Besieged_Cap",150);
        player:setVar("Merc_Cap",1000);
		player:stopEvent()
    end
end;


function onEventFinish(player,csid,option)
end