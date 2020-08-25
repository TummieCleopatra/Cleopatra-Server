-----------------------------------
-- Area: Norg
--  NPC: Gilgamesh
-- !pos 122.452 -9.009 -12.052 252
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)

    local currentTokens = player:getVar("CurrentTokens_Lion");
    local trib = player:getVar("[TRUST]LION_TRIB");
    local rank = player:getVar("[TRUST]LionRank")
    local subRank = player:getVar("[TRUST]LionSubRank")
    local total = player:getVar("[TRUST]LionTokensTotal")
    local quest = trustjob.THF2.finish[subRank]
    local finish = dialog.finish
    local meritCount = player:getMeritCount()



    if (trib == 1 and trade:hasItemQty(1431,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Gilgamesh : "..finish,0x0D);
        player:setVar("[TRUST]LION_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Gilgamesh : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]LionTokensTotal",total)
        local perc = ""
        local tokamt = 0
        tokamt = rank + 1
        perc = ""
        player:PrintToPlayer("Lion's "..quest.." "..tokamt..""..perc.." (Total Tokens: "..total.."/550)",0x15);
	    currentTokens = currentTokens - (rank + 1);
	    player:setVar("CurrentTokens_Lion",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]LionSubRank",0)
            player:setVar("[TRUST]LionRank",rank + 1)
            rank = player:getVar("[TRUST]LionRank")
            player:PrintToPlayer("Lion's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]LionSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]LionTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]LION_POINTS_PLUS",26)
            player:PrintToPlayer("Lion will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]LION_POINTS_PLUS",23)
            player:PrintToPlayer("Lion will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]LION_POINTS_PLUS",20)
            player:PrintToPlayer("Lion will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]LION_POINTS_PLUS",17)
            player:PrintToPlayer("Lion will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]LION_POINTS_PLUS",14)
            player:PrintToPlayer("Lion will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]LION_POINTS_PLUS",11)
            player:PrintToPlayer("Lion will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]LION_POINTS_PLUS",8)
            player:PrintToPlayer("Lion will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]LION_POINTS_PLUS",5)
            player:PrintToPlayer("Lion will now receive a 5% Trust Point Bonus!", 0x15);
        end
    else
        player:PrintToPlayer("Gilgamesh : Please trade the correct amount of Tokens and Gil.",0x0D);
	end

    if (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
        if (trade:hasItemQty(1160,1) and trade:getItemCount() == 1) then -- Frag Rock
            player:startEvent(99); -- Bastok Mission 6-2
        end
    end


end;

function onTrigger(player,npc)

    local ZilartMission = player:getCurrentMission(ZILART);

    local tribfight = player:getVar("LION_TRIB_FIGHT");
    local mainlvl = player:getMainLvl()
    local subRank = player:getVar("[TRUST]LionSubRank")
    local mainRank = player:getVar("[TRUST]LionRank")
    local trib = player:getVar("[TRUST]LION_TRIB");


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

	-- ------------------------ --
    --   Lion Tribute Unlock  --
    -- ------------------------ --
	if (mainlvl >= 75 and player:hasSpell(907) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Gilgamesh : "..start, 0xD);
        player:setVar("[TRUST]LION_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Gilgamesh : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = trustjob.THF2.start[subRank]
        local token = mainRank + 1
        player:PrintToPlayer("Gilgamesh : Bring me "..token.." of Lion's Trust Tokens and 5,000 gil to "..quest,0x0D);
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