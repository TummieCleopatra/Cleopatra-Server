-----------------------------------
-- Area: Lower Jeuno
--  NPC: AF Weapon Reset
-- Type: Sells AF Weapons
-----------------------------------

require("scripts/globals/chocobo");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)



    player:PrintToPlayer("Artifact Dealer : Let's see what we have here...",0xD);
    stock = {
	    0x034E,    200

    }

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_DOORMAN) == QUEST_COMPLETED) then  -- WAR
        table.insert(stock,0x4726);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.GHOSTS_OF_THE_PAST) == QUEST_COMPLETED) then  -- MNK
        table.insert(stock,0x4446);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.MESSENGER_FROM_BEYOND) == QUEST_COMPLETED) then  -- WHM
        table.insert(stock,0x440E);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_THREE_MAGI) == QUEST_COMPLETED) then  -- BLM
        table.insert(stock,0x44A4);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL) == QUEST_COMPLETED) then  -- RDM
        table.insert(stock,0x41BD);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_TENSHODO_SHOWDOWN) == QUEST_COMPLETED) then  --THF
        table.insert(stock,0x417C);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.SHARPENING_THE_SWORD) == QUEST_COMPLETED) then  -- PLD
        table.insert(stock,0x44EB);
        table.insert(stock,30000);
        table.insert(stock,0x3013);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.BLADE_OF_DARKNESS) == QUEST_COMPLETED) then  -- DRK
        table.insert(stock,0x419E);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.WINGS_OF_GOLD) == QUEST_COMPLETED) then  -- BST
        table.insert(stock,0x4128);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.PAINFUL_MEMORY) == QUEST_COMPLETED) then  -- BRD
        table.insert(stock,0x417E);
        table.insert(stock,30000);
        table.insert(stock,0x43C8);
        table.insert(stock,30000);
        table.insert(stock,0x43CC);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.SIN_HUNTING) == QUEST_COMPLETED) then  -- RNG
        table.insert(stock,0x4324);
        table.insert(stock,30000);
        table.insert(stock,0x4368);
        table.insert(stock,30000);
        table.insert(stock,0x4342);
        table.insert(stock,30000);

    end

    if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.THE_SACRED_KATANA) == QUEST_COMPLETED) then  -- SAM
        table.insert(stock,0x4594);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TWENTY_IN_PIRATE_YEARS) == QUEST_COMPLETED) then  -- NIN
        table.insert(stock,0x456B);
        table.insert(stock,30000);
        table.insert(stock,0x456C);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.A_CRAFTSMAN_S_WORK) == QUEST_COMPLETED) then  -- DRG
        table.insert(stock,0x41F7);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_PUPPET_MASTER) == QUEST_COMPLETED) then  -- SMN
        table.insert(stock,0x44BD);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.BEGINNINGS) == QUEST_COMPLETED) then -- BLU
        table.insert(stock,0x4535);
        table.insert(stock,30000);
    end


    if (player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS) == QUEST_COMPLETED) then  -- COR
        table.insert(stock,0x490E);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION) == QUEST_COMPLETED) then  -- PUP
        table.insert(stock,0x47B1);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.THE_UNFINISHED_WALTZ) == QUEST_COMPLETED) then  -- DNC
        table.insert(stock,0x4053);
        table.insert(stock,30000);
    end

    if (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.ON_SABBATICAL) == QUEST_COMPLETED) then  -- SCH
        table.insert(stock,0x42CA);
        table.insert(stock,30000);
    end

    dsp.shop.general(player, stock)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);


end;
