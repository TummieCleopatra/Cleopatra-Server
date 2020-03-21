-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: RuneNPC
-- !pos -78 -8 -22 80
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    local mJob = player:getMainJob()
    local af = player:getVar("RUN_AF")
    local accepted = player:getVar("RUN_AF_ACCEPTED")
    local FreeSlots = player:getFreeSlotsCount();

    if (player:getMainJob() == dsp.job.RUN and player:getMainLvl() >= 71) then
        if (FreeSlots == 0) then
            player:PrintToPlayer("Fivinne : I can't help you right now until you make room in your inventory.", 0x15);
        -- Handle AF rewards
        elseif (FreeSlots > 0 and player:getVar("RUN_AF_FEET") == 1) then
            player:PrintToPlayer("Fivinne : You've done well.  Here are some boots for you.  You can only wear them as a Rune Fencer though.", 0x15);
            player:addItem(12273,1,512,4,134,1,49,2,54,2)  -- STR + 5 Magic Def Bonus + 2, Haste + 3, pdt-3
            player:messageSpecial(ID.text.ITEM_OBTAINED,12273)
            player:setVar("RUN_AF_FEET",0)
            player:setVar("RUN_AF",1)
        elseif (FreeSlots > 0 and player:getVar("RUN_AF_HANDS") == 1) then
            player:PrintToPlayer("Fivinne : You've done well.  Here are some gloves for you.  You can only wear them as a Rune Fencer though.", 0x15);
            player:addItem(12201,1,290,9,140,2,49,2,54,1)  -- enhanceing Skill +10, Fast cast +3, Haste+3% PDT-2
            player:messageSpecial(ID.text.ITEM_OBTAINED,12201)
            player:setVar("RUN_AF_HANDS",0)
            player:setVar("RUN_AF",2)
        elseif (FreeSlots > 0 and player:getVar("RUN_AF_LEGS") == 1) then
            player:PrintToPlayer("Fivinne : You've done well.  Here are some pants for you.  You can only wear them as a Rune Fencer though.", 0x15);
            player:addItem(12237,1,288,9,796,9,49,4,54,1)  -- Divine Skill +10, Enhance res all status ailments, Haste+5% PDT-2
            player:messageSpecial(ID.text.ITEM_OBTAINED,12237)
            player:setVar("RUN_AF_LEGS",0)
            player:setVar("RUN_AF",3)
        elseif (FreeSlots > 0 and player:getVar("RUN_AF_BODY") == 1) then
            player:PrintToPlayer("Fivinne : You've done well.  Here's a body armor piece for you.  You can only wear them as a Rune Fencer though.", 0x15);
            player:addItem(12165,1,1472,4,133,9,49,1,138,1)  -- Parry + 5,MAB+10, Haste+2%, Refresh + 1
            player:messageSpecial(ID.text.ITEM_OBTAINED,12165)
            player:setVar("RUN_AF_BODY",0)
            player:setVar("RUN_AF",4)
        elseif (FreeSlots > 0 and player:getVar("RUN_AF_HEAD") == 1) then
            player:PrintToPlayer("Fivinne : You've done well.  Take this head armor, just remember you can only wear them as a Rune Fencer", 0x15);
            player:addItem(12129,1,512,2,49,4,140,6,137,1)  -- MDB+3, Haste +5, Fast Cast +7, Regen+2
            -- player:addItem(12273,1,512,4,134,1,49,2)  -- STR + 5 Magic Def Bonus + 2, Haste + 3
            player:messageSpecial(ID.text.ITEM_OBTAINED,12129)
            player:setVar("RUN_AF_HEAD",0)
            player:setVar("RUN_AF",5)

        -- Handle Quests for QF
        elseif (af == 0 and accepted == 0) then
            player:PrintToPlayer("Fivinne : Ah you are becoming quite the Rune Fencer.  I have some new gear that you might be intrested in.", 0x15);
            player:PrintToPlayer("Fivinne : But first you need to show me your tenacity.  There is a monster wandering around the tower", 0x15);
            player:PrintToPlayer("Fivinne : in Vunkerl Inlet [S].  Draw it out with this pigment and defeat it then come talk to me.", 0x15);
            player:setVar("RUN_AF_ACCEPTED",1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,2808)
            player:addItem(2808)
        elseif (af == 0 and accepted == 1) then
            player:PrintToPlayer("Fivinne : Remember, trade the pigment to the Tower surrounded by water", 0x15);
        elseif (af == 1 and accepted == 0) then
            player:PrintToPlayer("Fivinne : Ah back I see...I have some gloves for you but you must prove yourself.", 0x15);
            player:PrintToPlayer("Fivinne : There is a monster wandering around the tower in Fort Karungo-Narungo [S]", 0x15);
            player:PrintToPlayer("Fivinne : Draw it out with this pigment and defeat it then come talk to me.", 0x15);
            player:setVar("RUN_AF_ACCEPTED",1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,2808)
            player:addItem(2808)
        elseif (af == 1 and accepted == 1) then
            player:PrintToPlayer("Fivinne : Remember, trade the pigment to ??? near the tower", 0x15);
        elseif (af == 2 and accepted == 0) then
            player:PrintToPlayer("Fivinne : Want more armor?  There is a monster somewhere around Batallia Downs [S] near a tower.", 0x15);
            player:PrintToPlayer("Fivinne : Draw it out with this pigment and defeat it then come talk to me.", 0x15);
            player:setVar("RUN_AF_ACCEPTED",1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,2808)
            player:addItem(2808)
        elseif (af == 2 and accepted == 1) then
            player:PrintToPlayer("Fivinne : Remember, trade the pigment to the Tower.", 0x15);
        elseif (af == 3 and accepted == 0) then
            player:PrintToPlayer("Fivinne : Looking for some Rune Fencer Body Armor?  Head on over to Grauberg and look for a ???", 0x15);
            player:PrintToPlayer("Fivinne : near a tower.  A hidden enemy guards this spot, so take this and trade it to the ??? ", 0x15);
            player:PrintToPlayer("Fivinne : to bring out the enemy.  When done come talk to me", 0x15);
            player:setVar("RUN_AF_ACCEPTED",1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,2808)
            player:addItem(2808)
        elseif (af == 3 and accepted == 1) then
            player:PrintToPlayer("Fivinne : Remember, trade the pigment to ??? near the tower", 0x15);
        elseif (af == 4 and accepted == 0) then
            player:PrintToPlayer("Fivinne : I have one last test for you.  If you want the Rune Fencer head armor", 0x15);
            player:PrintToPlayer("Fivinne : head over to La Vaule [S].  Near a house there is a wooden spiked cart.", 0x15);
            player:PrintToPlayer("Fivinne : Take this and trade it to the cart next to the house to bring out the enemy and see me when done.", 0x15);
            player:setVar("RUN_AF_ACCEPTED",1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,2808)
            player:addItem(2808)
        elseif (af == 4 and accepted == 1) then
            player:PrintToPlayer("Fivinne : Remember, trade the pigment to the cart near the house", 0x15);
        end
    elseif (player:getVar("RuneQuest") == 2 and player:hasKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL)) then
        player:PrintToPlayer("Fivinne : !!!What?! You found it!! Perfect.  Now I shall teach you the mystic arts of Rune Fencing!", 0x15);
        player:addItem(20781)
        player:messageSpecial(ID.text.ITEM_OBTAINED,20781)
        player:unlockJob(dsp.job.RUN);
        player:setVar("RuneQuest",3)
        player:delKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL)
        player:PrintToPlayer("You are now able to become a Rune Fencer!", 0x1F);
        player:completeQuest(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE)
    elseif (player:getMainLvl() >= 30 and player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE) == QUEST_AVAILABLE) then
        player:PrintToPlayer("Fivinne : I am perfecting a new type of magic that requires a special ink from a flower far away from here.", 0x15);
        player:PrintToPlayer("Fivinne : The only problem is I dropped it somewhere in Pashhow Marshlands.  Find it for me and I'll teach", 0x15);
        player:PrintToPlayer("Fivinne : you the secret arts from this far away land.", 0x15);
        player:setVar("RuneQuest",1)
        player:addQuest(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE);
    elseif (player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE) == QUEST_ACCEPTED) then
        local clue = GetServerVariable("Rune_Petal_Clue")
        if (clue == 1) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Aughtmarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 2) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Luremarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 3) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Hexmarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 4) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Rotmarsh in Pashhow Marshlands.", 0x15);
        else
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Aughtmarsh in Pashhow Marshlands.", 0x15);
        end
    else
        player:PrintToPlayer("Fivinne : I have no business with you.  Off you go!", 0x15);
    end

    -- 1) Feet: Vunkerl Inlet [S]
    -- 2) Hands: Fort Karungo Narungo [S]
    -- 3) Legs: Batallia Downs [S]
    -- 4) Body: Grauberg
    -- 5) Head: La Vaule [S]





end;


function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
