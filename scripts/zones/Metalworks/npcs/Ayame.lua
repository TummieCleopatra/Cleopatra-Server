-----------------------------------
-- Area: Metalworks
--  NPC: Ayame
-- Involved in Missions
-- Starts and Finishes Quest: True Strength
-- !pos 133 -19 34 237
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1100,1) and trade:getItemCount() == 1) then -- Trade Xalmo Feather
            player:startEvent(749); -- Finish Quest "True Strength"
        end
    end

    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local war = 11988;
    local rdm = 11992;
    local sam = 11999;
    local nin = 12000;
    if (trade:hasItemQty(war, 1) and sjQuest >= 1) then
        player:setVar("AYAME_TYPE", 1)
        player:PrintToPlayer("Ayame's Subjob is now Warrior!", 0x15);
    end

end;

function onTrigger(player,npc)

    local trueStrength = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
    local WildcatBastok = player:getVar("WildcatBastok");

	local pNation = player:getNation();
	local currentMission = player:getCurrentMission(pNation);
	local srank = getNationRank(dsp.nation.SANDORIA);
	local tribfight = player:getVar("AYAME_TRIB_FIGHT");
	local mainlvl = player:getMainLvl();

    if (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(900) == false) then  -- Bastok Nation and mission 2-3
	player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Red Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
    elseif ((pNation == 2 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(900) == false)) then -- Windy Nation can obtain when rank is higher than 1
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Green Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
	elseif ((pNation == 0 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(900) == false)) then  -- Sandy Nation can obtain when rank is higher than 2
	player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Red Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
	elseif (((mainlvl >= 75 and tribfight == 0 and (player:hasSpell(900))) and (player:getVar("FerretoryAura") >= 7)) and (player:getVar("TRIB_FIGHT") ~= 1)) then
	player:PrintToPlayer("Ayame : There is someone running around claming to be me at Palborough Mines.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("Ayame : When you are ready, examine the Burning Circle in Palborough Mines and call me to your side.", 0xD);
	player:setVar("AYAME_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(900))) then
	player:PrintToPlayer("Ayame : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Ayame!", 0x15);
	player:setVar("AYAME_TRIB_FIGHT",3);
	player:setVar("TRIB_FIGHT",0);
	-- Handle Token Quest
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 0)) then
      player:PrintToPlayer("Ayame : Bring me 1 of my Trust Tokens and 1,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 1)) then
      player:PrintToPlayer("Ayame : Bring me 2 of my Trust Tokens and 2,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 2)) then
      player:PrintToPlayer("Ayame : Bring me 3 of my Trust Tokens and 3,000 gil to raise my Store TP by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 3)) then
      player:PrintToPlayer("Ayame : Bring me 4 of my Trust Tokens and 4,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 4)) then
      player:PrintToPlayer("Ayame : Bring me 5 of my Trust Tokens and 5,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 5)) then
      player:PrintToPlayer("Ayame : Bring me 10 of my Trust Tokens and 10,000 gil to raise my Store TP by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 6)) then
      player:PrintToPlayer("Ayame : Bring me 15 of my Trust Tokens and 15,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 7)) then
      player:PrintToPlayer("Ayame : Bring me 20 of my Trust Tokens and 30,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 8)) then
      player:PrintToPlayer("Ayame : Bring me 30 of my Trust Tokens and 75,000 gil to increase by Zanshin by 5",0x0D);
    elseif ((player:getVar("AYAME_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Ayame") == 9)) then
      player:PrintToPlayer("Ayame : Bring me 35 of my Trust Tokens and 150,000 gil so I can Meditate by 20 TP",0x0D);
    end

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,9) == false) then
        player:startEvent(935);
    elseif (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_CRYSTAL_LINE and player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
        player:startEvent(712);
    elseif (trueStrength == QUEST_AVAILABLE and player:getMainJob() == dsp.job.MNK and player:getMainLvl() >= 50) then
        player:startEvent(748); -- Start Quest "True Strength"
    else
        player:startEvent(701); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 712) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 748) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
    elseif (csid == 749) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14215); -- Temple Hose
        else
            player:tradeComplete();
            player:addTitle(dsp.title.PARAGON_OF_MONK_EXCELLENCE);
            player:addItem(14215);
            player:messageSpecial(ID.text.ITEM_OBTAINED,14215); -- Temple Hose
            player:addFame(BASTOK,AF3_FAME);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
        end
    elseif (csid == 935) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",9,true);
    end

end;