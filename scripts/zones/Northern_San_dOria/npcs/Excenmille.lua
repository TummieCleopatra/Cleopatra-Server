-----------------------------------
-- Area: Northern San d'Oria
--   NPC: Excenmille
-- Type: Ballista Pursuivant
-- !pos -229.344 6.999 22.976 231
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
require("scripts/globals/keyitems");

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

    local currentTokens = player:getVar("CurrentTokens_Excenmille");
    local trib = player:getVar("[TRUST]EXCENMILLE_TRIB");
    local rank = player:getVar("[TRUST]ExcenmilleRank")
    local subRank = player:getVar("[TRUST]ExcenmilleSubRank")
    local total = player:getVar("[TRUST]ExcenmilleTokensTotal")
    local quest = trustjob.DRG.finish[subRank]
    local finish = dialog.finish
    local meritCount = player:getMeritCount()

    if (trib == 1 and trade:hasItemQty(1439,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Excenmille : "..finish,0x0D);
        player:setVar("[TRUST]EXCENMILLE_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Excenmille : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]ExcenmilleTokensTotal",total)
        local perc = ""
        local tokamt = 0
        if (subRank == 7) then
           tokamt = (rank + 1) * 2
           perc = ""
        else
           tokamt = rank + 1
           perc = ""
        end

        player:PrintToPlayer("Excenmille's "..quest.." "..tokamt..""..perc.." (Total Tokens: "..total.."/550)",0x15);
	    currentTokens = currentTokens - (rank + 1);
	    player:setVar("CurrentTokens_Excenmille",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]ExcenmilleSubRank",0)
            player:setVar("[TRUST]ExcenmilleRank",rank + 1)
            rank = player:getVar("[TRUST]ExcenmilleRank")
            player:PrintToPlayer("Excenmille's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]ExcenmilleSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]ExcenmilleTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",26)
            player:PrintToPlayer("Excenmille will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",23)
            player:PrintToPlayer("Excenmille will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",20)
            player:PrintToPlayer("Excenmille will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",17)
            player:PrintToPlayer("Excenmille will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",14)
            player:PrintToPlayer("Excenmille will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",11)
            player:PrintToPlayer("Excenmille will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",8)
            player:PrintToPlayer("Excenmille will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]EXCENMILLE_POINTS_PLUS",5)
            player:PrintToPlayer("Excenmille will now receive a 5% Trust Point Bonus!", 0x15);
        end
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
    local pNation = player:getNation();
    local subRank = player:getVar("[TRUST]ExcenmeilleSubRank")
    local mainRank = player:getVar("[TRUST]ExcenmilleRank")
    local trib = player:getVar("[TRUST]EXCENMILLE_TRIB");

	-- ------------------------ --
    --   Excenmille Tribute Unlock  --
    -- ------------------------ --
	if (mainlvl >= 75 and player:hasSpell(899) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Excenmille : "..start, 0xD);
        player:setVar("[TRUST]EXCENMILLE_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Excenmille : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = trustjob.DRG.start[subRank]
        local token = mainRank + 1
        player:PrintToPlayer("Excenmille : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
    end
	-- else
    -- player:startEvent(29);
    -- end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
