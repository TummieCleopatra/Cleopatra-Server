-----------------------------------
-- Area: Nashmau
--  NPC: Kilusha
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
function onTrade(player,npc,trade)
    local job = player:getMainJob();
    local level = player:getMainLvl();
    local merc = player:getVar("Mercenary_Points")
    if (((job == 1) and (player:getVar("WARMythicWeapon") == 4)) or
		((job == 2) and (player:getVar("MNKMythicWeapon") == 4)) or
		((job == 3) and (player:getVar("WHMMythicWeapon") == 4)) or
		((job == 4) and (player:getVar("BLMMythicWeapon") == 4)) or
		((job == 5) and (player:getVar("RDMMythicWeapon") == 4)) or
		((job == 6) and (player:getVar("THFMythicWeapon") == 4)) or
		((job == 7) and (player:getVar("PLDMythicWeapon") == 4)) or
		((job == 8) and (player:getVar("DRKMythicWeapon") == 4)) or
		((job == 9) and (player:getVar("BSTMythicWeapon") == 4)) or
		((job == 10) and (player:getVar("BRDMythicWeapon") == 4)) or
		((job == 11) and (player:getVar("RNGMythicWeaponbow") == 4)) or
		((job == 15) and (player:getVar("SMNMythicWeapon") == 4)) or
		((job == 13) and (player:getVar("NINMythicWeapon") == 4)) or
		((job == 14) and (player:getVar("DRGMythicWeapon") == 4)) or
		((job == 12) and (player:getVar("SAMMythicWeapon") == 4)) or
		((job == 16) and (player:getVar("BLUMythicWeapon") == 4)) or
		((job == 17) and (player:getVar("CORMythicWeapon") == 4)) or
		((job == 18) and (player:getVar("PUPMythicWeapon") == 4)) or
		((job == 19) and (player:getVar("DNCMythicWeapon") == 4)) or
		((job == 20) and (player:getVar("SCHMythicWeapon") == 4)) or
        ((job == 21) and (player:getVar("GEOMythicWeapon") == 4)) or
        ((job == 22) and (player:getVar("RUNMythicWeapon") == 4)) and player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) and merc == 25000 and trade:getGil() == 750000) then
        player:additem(2571)
        player:messageSpecial(ID.text.ITEM_OBTAINED,1127);
        player:setVar("Mercenary_Points",0)
    end
end;

function onTrigger(player,npc)
   -- player:startEvent(22);
    local job = player:getMainJob();
    local level = player:getMainLvl();
    if (((job == 1) and (player:getVar("WARMythicWeapon") == 4)) or
		((job == 2) and (player:getVar("MNKMythicWeapon") == 4)) or
		((job == 3) and (player:getVar("WHMMythicWeapon") == 4)) or
		((job == 4) and (player:getVar("BLMMythicWeapon") == 4)) or
		((job == 5) and (player:getVar("RDMMythicWeapon") == 4)) or
		((job == 6) and (player:getVar("THFMythicWeapon") == 4)) or
		((job == 7) and (player:getVar("PLDMythicWeapon") == 4)) or
		((job == 8) and (player:getVar("DRKMythicWeapon") == 4)) or
		((job == 9) and (player:getVar("BSTMythicWeapon") == 4)) or
		((job == 10) and (player:getVar("BRDMythicWeapon") == 4)) or
		((job == 11) and (player:getVar("RNGMythicWeaponbow") == 4)) or
		((job == 15) and (player:getVar("SMNMythicWeapon") == 4)) or
		((job == 13) and (player:getVar("NINMythicWeapon") == 4)) or
		((job == 14) and (player:getVar("DRGMythicWeapon") == 4)) or
		((job == 12) and (player:getVar("SAMMythicWeapon") == 4)) or
		((job == 16) and (player:getVar("BLUMythicWeapon") == 4)) or
		((job == 17) and (player:getVar("CORMythicWeapon") == 4)) or
		((job == 18) and (player:getVar("PUPMythicWeapon") == 4)) or
		((job == 19) and (player:getVar("DNCMythicWeapon") == 4)) or
		((job == 20) and (player:getVar("SCHMythicWeapon") == 4)) or
        ((job == 21) and (player:getVar("GEOMythicWeapon") == 4)) or
        ((job == 22) and (player:getVar("RUNMythicWeapon") == 4)) and player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE)) then
        player:PrintToPlayer("Kilushua : If you are looking for Balrahn's Eyepatch, trade me 750,000g while in posission of 25,000 Mercenary Points", 0xD);
    else
         player:PrintToPlayer("Kilushua : I believe we do not have any business to conduct as this time.", 0xD);

    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
