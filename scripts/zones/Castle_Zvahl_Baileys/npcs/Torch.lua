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
    local trib = player:getVar("[TRUST]ZEID_TRIB");
    local rank = player:getVar("[TRUST]ZeidRank")
    local subRank = player:getVar("[TRUST]ZeidSubRank")
    local total = player:getVar("[TRUST]ZeidTokensTotal")
    local quest = job.DRK.finish[subRank]
    local finish = dialog.finish
    local meritCount = getMeritCount()



    if (trib == 1 and trade:hasItemQty(1433,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Torch : "..finish,0x0D);
        player:setVar("[TRUST]ZEID_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Torch : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]ZeidTokensTotal",total)
        player:PrintToPlayer("Zeid's "..quest.."  (Total Tokens: "..total.."/550)",0x0D);
	    currentTokens = currentTokens - rank + 1;
	    player:setVar("CurrentTokens_Zeid",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]ZeidSubRank",0)
            player:setVar("[TRUST]ZeidRank",rank + 1)
            rank = player:getVar("[TRUST]ZeidRank")
            player:PrintToPlayer("Zeid's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]ZeidSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]ZeidTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",26)
            player:PrintToPlayer("Zeid will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",23)
            player:PrintToPlayer("Zeid will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",20)
            player:PrintToPlayer("Zeid will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",17)
            player:PrintToPlayer("Zeid will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",14)
            player:PrintToPlayer("Zeid will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",11)
            player:PrintToPlayer("Zeid will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",8)
            player:PrintToPlayer("Zeid will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]ZEID_POINTS_PLUS",5)
            player:PrintToPlayer("Zeid will now receive a 5% Trust Point Bonus!", 0x15);
        end
    else
        player:PrintToPlayer("Torch : Please trade the correct amount of Tokens and Gil.",0x0D);
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

	-- ------------------------ --
    --   Zeid Tribute Unlock  --
    -- ------------------------ --
	if (mLvL >= 75 and player:hasSpell(906) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Gilgamesh : "..start, 0xD);
        player:setVar("[TRUST]ZEID_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Gilgamesh : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = job.DRK.start[subRank]
        local token = subRank + 1
        player:PrintToPlayer("Torch : Bring me "..token.." of Zeid's Trust Tokens and 5,000 gil to "..quest,0x0D);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
