-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Touneaux
-- Standard Info NPC
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    local war = 11988;
    local rdm = 11992;
    local sam = 11999;
    local nin = 12000;
    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local sjQuestProgress = player:getVar("TRUST_SJ_QUEST_PROGRESS")
    local counter = player:getVar("TRUST_SJ_QUEST_COUNTER")

    if (trade:hasItemQty(war,1) and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0x15);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Warrior using the Fighters Torque!", 0x1F);
    elseif (trade:hasItemQty(rdm,1) and sjQuest == 1 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",2)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0x15);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Red Mage using the Warlocks Torque!", 0x1F);
    elseif (trade:hasItemQty(sam,1) and sjQuest == 2 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",3)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0x15);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Samurai using the Myochin Shusa!", 0x1F);
    elseif (trade:hasItemQty(nin,1) and sjQuest == 3 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",4)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0x15);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Ninja using the Ninja Shusa!", 0x1F);
    end
end;

function onTrigger(player,npc)
    local lvl = player:getMainLvl()
    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local sjQuestProgress = player:getVar("TRUST_SJ_QUEST_PROGRESS")
    if (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuestProgress == 0 and sjQuest == 0) then
        player:PrintToPlayer("Touneaux : So you want to expand your Trusts eh?  I'll tell you what, take this item and defeat", 0x15);
        player:PrintToPlayer("Touneaux : 100 experience yeielding monsters while wearing it and then trade it back to me", 0x15);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
        player:addItem(11988,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,11988);
    elseif (sjQuestProgress == 1 and sjQuest == 0) then
        local stock_1 =
        {
            11988,   20000
        };
        dsp.shop.general(player, stock_1);
        player:PrintToPlayer("Touneaux : Remember, defeat 100 monsters while wearing that torque and then bring it back to me", 0x15);
        player:PrintToPlayer("Touneaux : Also if you lost your torque, I can sell you a new one", 0x15);
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 1 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Warlock's Torque and defeat 100 experience yeilding", 0x15);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0x15);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
        player:addItem(11992,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,11992);
    elseif (sjQuestProgress == 1 and sjQuest == 1) then
        local stock_2 =
        {
            11988,   20000,
            11992,   20000
        };
        dsp.shop.general(player, stock_2);
        player:PrintToPlayer("Touneaux : Remember, defeat 100 monsters while wearing that torque and then bring it back to me", 0x15);
        player:PrintToPlayer("Touneaux : Also if you lost your torque, I can sell you a new one", 0x15);
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 2 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Myochin Shusa and defeat 100 experience yeilding", 0x15);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0x15);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
        player:addItem(11999,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,11999);
    elseif (sjQuestProgress == 1 and sjQuest == 2) then
        local stock_3 =
        {
            11988,   20000,
            11992,   20000,
            11999,   20000
        };
        dsp.shop.general(player, stock_3);
        player:PrintToPlayer("Touneaux : Remember, defeat 100 monsters while wearing that torque and then bring it back to me", 0x15);
        player:PrintToPlayer("Touneaux : Also if you lost your torque, I can sell you a new one", 0x15);
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 3 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Ninja Shusa and defeat 100 experience yeilding", 0x15);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0x15);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
        player:addItem(12000,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,12000);
    elseif (sjQuestProgress == 1 and sjQuest == 3) then
        local stock_4 =
        {
            11988,   20000,
            11992,   20000,
            11999,   20000,
            12000,   20000,
        };
        dsp.shop.general(player, stock_4);
        player:PrintToPlayer("Touneaux : Remember, defeat 100 monsters while wearing that torque and then bring it back to me", 0x15);
        player:PrintToPlayer("Touneaux : Also if you lost your torque, I can sell you a new one", 0x15);
    else
        player:PrintToPlayer("Touneaux : Come see me when you have been cleared to fight with Trusts.", 0x15);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
