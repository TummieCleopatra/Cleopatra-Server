-----------------------------------
-- Area: Norg
--  NPC: Gilgamesh
-- !pos 122.452 -9.009 -12.052 252
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

    local currentTokens = player:getVar("CurrentTokens_Lion");

    if (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
        if (trade:hasItemQty(1160,1) and trade:getItemCount() == 1) then -- Frag Rock
            player:startEvent(99); -- Bastok Mission 6-2
        end
    end

	if ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Attack is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAtt_Lion",5);
	  player:setVar("TributeRank_Lion",1);
	  currentTokens = currentTokens - 1;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	  player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAcc_Lion",5);
	  player:setVar("TributeRank_Lion",2);
	  currentTokens = currentTokens - 2;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's AGI is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAGI_Lion",5);
	  player:setVar("TributeRank_Lion",3);
	  currentTokens = currentTokens - 3;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Attack is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAtt_Lion",10);
	  player:setVar("TributeRank_Lion",4);
	  currentTokens = currentTokens - 4;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAcc_Lion",10);
	  player:setVar("TributeRank_Lion",5);
	  currentTokens = currentTokens - 5;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's AGI is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAGI_Lion",10);
	  player:setVar("TributeRank_Lion",6);
	  currentTokens = currentTokens - 10;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Attack is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAtt_Lion",15);
	  player:setVar("TributeRank_Lion",7);
	  currentTokens = currentTokens - 15;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Accuracy is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAcc_Lion",15);
	  player:setVar("TributeRank_Lion",8);
	  currentTokens = currentTokens - 20;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion's Triple Attack is raised by 3%! (Total: 3%)", 0x15);
	  player:setVar("TrustTA_Lion",3);
	  player:setVar("TributeRank_Lion",9);
	  currentTokens = currentTokens - 30;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
      player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Lion learns 'Treasure Hunter II'!", 0x15);
	  player:setVar("TrustTH_Lion",1);
	  player:setVar("TributeRank_Lion",10);
	  currentTokens = currentTokens - 35;
	  player:setVar("CurrentTokens_Lion",currentTokens);
    else
      player:PrintToPlayer("Gilgamesh : Please trade the correct amount of Tokens and Gil.",0x0D);
	end

end;

function onTrigger(player,npc)

    local ZilartMission = player:getCurrentMission(ZILART);

    local tribfight = player:getVar("LION_TRIB_FIGHT");

	if ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.ROMAEVE)) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(907) == false)) then
		player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Gilgamesh : My daughter is very connected to you.  She told me if you ever need help, just call for her.", 0xD);
        player:addSpell(907);
		player:PrintToPlayer("You are now able to summon Lion!", 0x1C);
    elseif ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.ROMAEVE)) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(907) == false)) then
		player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Gilgamesh : My daughter is very connected to you.  She told me if you ever need help, just call for her.", 0xD);
        player:addSpell(907);
		player:PrintToPlayer("You are now able to summon Lion!", 0x1C);
    elseif ((player:hasCompletedMission(ZILART,dsp.mission.id.zilart.ROMAEVE)) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(907) == false)) then
		player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Gilgamesh : My daughter is very connected to you.  She told me if you ever need help, just call for her.", 0xD);
        player:addSpell(907);
		player:PrintToPlayer("You are now able to summon Lion!", 0x1C);
    end

    if (ZilartMission == dsp.mission.id.zilart.KAZAMS_CHIEFTAINESS) then
        player:startEvent(7);
    elseif (ZilartMission == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(8);
    elseif (ZilartMission == dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE) then
        player:startEvent(9);
    elseif (ZilartMission == dsp.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER) then
        player:startEvent(13);
    elseif (ZilartMission == dsp.mission.id.zilart.ROMAEVE) then
        player:startEvent(11);
    elseif (ZilartMission == dsp.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL) then
        player:startEvent(170);
    elseif (ZilartMission == dsp.mission.id.zilart.ARK_ANGELS) then
        player:startEvent(171);
    elseif (ZilartMission == dsp.mission.id.zilart.THE_CELESTIAL_NEXUS) then
        player:startEvent(173);
    elseif (ZilartMission == dsp.mission.id.zilart.AWAKENING) then
        player:startEvent(177);
    end

		    ------- Trust Fight --------
	if ((mainlvl >= 71 and tribfight == 0 and (player:hasSpell(907)) and (player:getVar("FerretoryAura") >= 7) and (player:getVar("TRIB_FIGHT") ~= 1))) then
	player:PrintToPlayer("Gilgamesh : There is someone running around claming to be Lion at QuBai Arena.  Please head there and she'll join you.", 0xD);
    player:PrintToPlayer("Gilgamesh : When you are ready, examine the Burning Circle in QuBai Arena and call Lion to your side.", 0xD);
	player:setVar("LION_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(907))) then
	player:PrintToPlayer("Gilgamesh : You have done well to help with the imposter investigation.  Lion is in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Lion!", 0x15);
	player:setVar("LION_TRIB_FIGHT",3);
    player:setVar("TRIB_FIGHT",0);
	end


	-- Handle Token Quest
  if ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 0)) then
    player:PrintToPlayer("Gilgamesh : Bring me 1 of Lion's Trust Tokens and 1,000 gil to raise Lion's Attack by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 1)) then
    player:PrintToPlayer("Gilgamesh : Bring me 2 of Lion's Trust Tokens and 2,000 gil to raise Lion's Accuracy by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 2)) then
    player:PrintToPlayer("Gilgamesh : Bring me 3 of Lion's Trust Tokens and 3,000 gil to raise Lion's Double Attack by 2%",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 3)) then
    player:PrintToPlayer("Gilgamesh : Bring me 4 of Lion's Trust Tokens and 4,000 gil to raise Lion's Attack by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 4)) then
    player:PrintToPlayer("Gilgamesh : Bring me 5 of Lion's Trust Tokens and 5,000 gil to raise Lion's Accuracy by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 5)) then
    player:PrintToPlayer("Gilgamesh : Bring me 10 of Lion's Trust Tokens and 10,000 gil to raise Lion's Double Attack by 3%",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 6)) then
    player:PrintToPlayer("Gilgamesh : Bring me 15 of Lion's Trust Tokens and 15,000 gil to raise Lion's Attack by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 7)) then
    player:PrintToPlayer("Gilgamesh : Bring me 20 of Lion's Trust Tokens and 30,000 gil to raise Lion's Accuracy by 5",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 8)) then
    player:PrintToPlayer("Gilgamesh : Bring me 30 of Lion's Trust Tokens and 75,000 gil so I can raise Lion's Critical Hitrate by 3%'",0x0D);
  elseif ((player:getVar("LION_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Lion") == 9)) then
    player:PrintToPlayer("Gilgamesh : Bring me 35 of Lion's Trust Tokens and 150,000 gil to raise Lion's Berserk by 1%",0x0D);
  end

end;

--175  0  2  3  4  7  8  9  10  98  99  29  12
--13  146  158  164  169  170  171  172  173  176  177  232  233
--234
-- 98  99 mission bastok
-- 12 parle de kuzotz ? parle de bijoux aussi
-- 10 parle de zitah
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 99) then
        player:tradeComplete();
        player:setVar("MissionStatus",3);
    end

end;