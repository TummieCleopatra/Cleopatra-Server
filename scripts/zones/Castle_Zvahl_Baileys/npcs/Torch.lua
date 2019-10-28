-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Torch (x4)
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
     local currentTokens = player:getVar("CurrentTokens_Zeid");

	if ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Attack is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAtt_Zeid",5);
	  player:setVar("TributeRank_Zeid",1);
	  currentTokens = currentTokens - 1;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	  player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAcc_Zeid",5);
	  player:setVar("TributeRank_Zeid",2);
	  currentTokens = currentTokens - 2;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Occult Acumen is raised by 2 Points! (Total: 2)", 0x15);
	  player:setVar("TrustOA_Zeid",2);
	  player:setVar("TributeRank_Zeid",3);
	  currentTokens = currentTokens - 3;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Attack is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAtt_Zeid",10);
	  player:setVar("TributeRank_Zeid",4);
	  currentTokens = currentTokens - 4;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAcc_Zeid",10);
	  player:setVar("TributeRank_Zeid",5);
	  currentTokens = currentTokens - 5;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Occult Acumen is raised by 3 Points! (Total: 5)", 0x15);
	  player:setVar("TrustOA_Zeid",5);
	  player:setVar("TributeRank_Zeid",6);
	  currentTokens = currentTokens - 10;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Attack is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAtt_Zeid",15);
	  player:setVar("TributeRank_Zeid",7);
	  currentTokens = currentTokens - 15;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Accuracy is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAcc_Zeid",15);
	  player:setVar("TributeRank_Zeid",8);
	  currentTokens = currentTokens - 20;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's Occult Acumen is raised by 5 Points! (Total: 10)", 0x15);
	  player:setVar("TrustOA_Zeid",10);
	  player:setVar("TributeRank_Zeid",9);
	  currentTokens = currentTokens - 30;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
      player:PrintToPlayer("??? : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Zeid's 'Desperate Blows' Effect has increased by 5!", 0x15);
	  player:setVar("TrustDB_Zeid",1);
	  player:setVar("TributeRank_Zeid",5);
	  currentTokens = currentTokens - 35;
	  player:setVar("CurrentTokens_Zeid",currentTokens);
    else
      player:PrintToPlayer("??? : Please trade the correct amount of Tokens and Gil.",0x0D);
	end

end

function onTrigger(player,npc)
    local offset = npc:getID() - ID.npc.TORCH_OFFSET
	local mainlvl = player:getMainLvl();
    local tribfight = player:getVar("ZEID_TRIB_FIGHT");

    -- killed Dark Spark and clicked same torch used to spawn
    if player:getVar("BorghertzSparkKilled") == 1 and GetMobByID(ID.mob.DARK_SPARK):getLocalVar("fromTorch") == offset then
        npcUtil.giveKeyItem(player, dsp.ki.SHADOW_FLAMES)
        player:setVar("BorghertzSparkKilled", 0)
        player:setVar("BorghertzCS", 0)

    -- attempt to spawn Dark Spark from torch
    elseif
        player:getVar("BorghertzSparkKilled") == 0 and
        player:hasKeyItem(dsp.ki.OLD_GAUNTLETS) and
        not player:hasKeyItem(dsp.ki.SHADOW_FLAMES) and
        player:getVar("BorghertzCS") >= 2 and
        npcUtil.popFromQM(player, npc, ID.mob.DARK_SPARK, {claim=true, hide=0})
    then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        GetMobByID(ID.mob.DARK_SPARK):setLocalVar("fromTorch", offset)
        player:setVar("BorghertzSparkKilled", 0)
	elseif ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.THE_GATE_OF_THE_GODS)) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(906) == false)) then
		player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("??? : I will help you rid Vanadiel from all of the evil that persists...", 0xD);
        player:addSpell(906);
		player:PrintToPlayer("You are now able to summon Zeid!", 0x1C);
    elseif ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.THE_GATE_OF_THE_GODS)) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(906) == false)) then
		player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("??? : I will help you rid Vanadiel from all of the evil that persists...", 0xD);
        player:addSpell(906);
		player:PrintToPlayer("You are now able to summon Zeid!", 0x1C);
    elseif ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.THE_GATE_OF_THE_GODS)) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(906) == false)) then
		player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("??? : I will help you rid Vanadiel from all of the evil that persists...", 0xD);
        player:addSpell(906);
		player:PrintToPlayer("You are now able to summon Zeid!", 0x1C);
    -- default dialog
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end

	if ((mainlvl >= 71 and tribfight == 0 and (player:hasSpell(906)) and (player:getVar("FerretoryAura") >= 7) and (player:getVar("TRIB_FIGHT") ~= 1))) then
	player:PrintToPlayer("??? : There is someone running around claming to be me at QuBai Arena.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("??? : When you are ready, examine the Burning Circle in QuBai Arena and call me to your side.", 0xD);
	player:setVar("ZEID_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(906))) then
	player:PrintToPlayer("??? : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Zeid!", 0x15);
	player:setVar("ZEID_TRIB_FIGHT",3);
    player:setVar("TRIB_FIGHT",0);
	end

    -- Handle Token Quest
    if ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 0)) then
        player:PrintToPlayer("??? : Bring me 1 of Zeid's Trust Tokens and 1,000 gil to raise Zeid's Attack by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 1)) then
        player:PrintToPlayer("??? : Bring me 2 of Zeid's Trust Tokens and 2,000 gil to raise Zeid's Accuracy by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 2)) then
        player:PrintToPlayer("??? : Bring me 3 of Zeid's Trust Tokens and 3,000 gil to raise Zeid's Occult Acumen by 2",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 3)) then
        player:PrintToPlayer("??? : Bring me 4 of Zeid's Trust Tokens and 4,000 gil to raise Zeid's Attack by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 4)) then
        player:PrintToPlayer("??? : Bring me 5 of Zeid's Trust Tokens and 5,000 gil to raise Zeid's Accuracy by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 5)) then
        player:PrintToPlayer("??? : Bring me 10 of Zeid's Trust Tokens and 10,000 gil to raise Zeid's Occult Acumen by 3",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 6)) then
        player:PrintToPlayer("??? : Bring me 15 of Zeid's Trust Tokens and 15,000 gil to raise Zeid's Attack by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 7)) then
        player:PrintToPlayer("??? : Bring me 20 of Zeid's Trust Tokens and 30,000 gil to raise Zeid's Accuracy by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 8)) then
        player:PrintToPlayer("??? : Bring me 30 of Zeid's Trust Tokens and 75,000 gil to raise Zeid's Occult Acumen by 5",0x0D);
    elseif ((player:getVar("ZEID_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Zeid") == 9)) then
        player:PrintToPlayer("??? : Bring me 35 of Zeid's Trust Tokens and 150,000 gil to increase Zeid's Desperate Blows by 5",0x0D);
  end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
