-----------------------------------
-- Area: Northern San d'Oria
--   NPC: Excenmille
-- Type: Ballista Pursuivant
-- !pos -229.344 6.999 22.976 231
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

function onTrade(player,npc,trade)
    local currentTokens = player:getVar("CurrentTokens_Excenmille");
    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local war = 11988;
    local rdm = 11992;
    local sam = 11999;
    local nin = 12000;
    if (trade:hasItemQty(sam, 1) and sjQuest >= 3) then
        player:setVar("EXCENMILLE_TYPE", 1)
        player:PrintToPlayer("Excenmille: Ok my subjob is now Samurai!", 0x15);
    end

    if ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Attack is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAtt_Excen",5);
	  player:setVar("TributeRank_Excenmille",1);
	  currentTokens = currentTokens - 1;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	  player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAcc_Excen",5);
	  player:setVar("TributeRank_Excenmille",2);
	  currentTokens = currentTokens - 2;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Jump Damage is raised by 2%! (Total: 2%)", 0x15);
	  player:setVar("TrustJump_Excen",2);
	  player:setVar("TributeRank_Excenmille",3);
	  currentTokens = currentTokens - 3;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Attack is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAtt_Excen",10);
	  player:setVar("TributeRank_Excenmille",4);
	  currentTokens = currentTokens - 4;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAcc_Excen",10);
	  player:setVar("TributeRank_Excenmille",5);
	  currentTokens = currentTokens - 5;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Jump Damage is raised by 3%! (Total: 5%)", 0x15);
	  player:setVar("TrustJump_Excen",5);
	  player:setVar("TributeRank_Excenmille",6);
	  currentTokens = currentTokens - 10;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Attack is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAtt_Excen",15);
	  player:setVar("TributeRank_Excenmille",7);
	  currentTokens = currentTokens - 15;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Accuracy is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAcc_Excen",15);
	  player:setVar("TributeRank_Excenmille",8);
	  currentTokens = currentTokens - 20;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille's Enmity is lowered by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustEnm_Excen",5);
	  player:setVar("TributeRank_Excenmille",9);
	  currentTokens = currentTokens - 30;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
      player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Excenmille learns the ability 'Angon'!", 0x15);
	  player:setVar("TrustJA_Excen",1);
	  player:setVar("TributeRank_Excenmille",10);
	  currentTokens = currentTokens - 35;
	  player:setVar("CurrentTokens_Excenmille",currentTokens);
    else
      player:PrintToPlayer("Excenmille : Please trade the correct amount of Tokens and Gil.",0x0D);
	end
end;

function onTrigger(player,npc)
    local srank = player:getRank();
	local wrank = player:getRank();
	local brank = player:getRank();
	local tribfight = player:getVar("EXCEN_TRIB_FIGHT");
	local mainlvl = player:getMainLvl();


	if (srank >= 4) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);
	elseif (wrank >= 4) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Green Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);
	elseif (brank >= 4) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(899) == false) then  -- Sandy Rnak 4 or higher
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Excenmille : Ah a Blue Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
    player:addSpell(899);
	elseif ((mainlvl >= 75 and tribfight == 0 and (player:hasSpell(899)) and (player:getVar("FerretoryAura") >= 7)) and (player:getVar("TRIB_FIGHT") ~= 1)) then
	player:PrintToPlayer("Excenmille : There is someone running around claming to be me at Horlais Peak.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("Excenmille : When you are ready, examine the Burning Circle in Horlais Peak and call me to your side.", 0xD);
	player:setVar("EXCEN_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(899))) then
	player:PrintToPlayer("Excenmille : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Excenmille!", 0x15);
	player:setVar("EXCEN_TRIB_FIGHT",3);
    player:setVar("TRIB_FIGHT",0);

	-- Handle Token Quest
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 0)) then
      player:PrintToPlayer("Excenmille : Bring me 1 of my Trust Tokens and 1,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 1)) then
      player:PrintToPlayer("Excenmille : Bring me 2 of my Trust Tokens and 2,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 2)) then
      player:PrintToPlayer("Excenmille : Bring me 3 of my Trust Tokens and 3,000 gil to raise my Jump Damage by 2",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 3)) then
      player:PrintToPlayer("Excenmille : Bring me 4 of my Trust Tokens and 4,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 4)) then
      player:PrintToPlayer("Excenmille : Bring me 5 of my Trust Tokens and 5,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 5)) then
      player:PrintToPlayer("Excenmille : Bring me 10 of my Trust Tokens and 10,000 gil to raise my Jump Damage by 3",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 6)) then
      player:PrintToPlayer("Excenmille : Bring me 15 of my Trust Tokens and 15,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 7)) then
      player:PrintToPlayer("Excenmille : Bring me 20 of my Trust Tokens and 30,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 8)) then
      player:PrintToPlayer("Excenmille : Bring me 30 of my Trust Tokens and 75,000 gil to decrease my Enmity by 5",0x0D);
    elseif ((player:getVar("EXCEN_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Excenmille") == 9)) then
      player:PrintToPlayer("Excenmille : Bring me 35 of my Trust Tokens and 150,000 gil so I can learn 'Angon'",0x0D);
	else
    player:startEvent(29);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
