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
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0xD);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Warrior!", 0x15);
    elseif (trade:hasItemQty(rdm,1) and sjQuest == 1 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",2)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0xD);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Red Mage!", 0x15);
    elseif (trade:hasItemQty(sam,1) and sjQuest == 2 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",3)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0xD);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Samurai!", 0x15);
    elseif (trade:hasItemQty(nin,1) and sjQuest == 3 and sjQuestProgress == 1 and counter >= 101) then
        player:setVar("TRUST_SJ_QUEST",4)
        player:setVar("TRUST_SJ_QUEST_COUNTER",0)
        player:setVar("TRUST_SJ_QUEST_PROGRESS",0)
        player:PrintToPlayer("Touneaux : Well Done!  Trade this to any of your Trusts in the cities to change their subjob", 0xD);
        player:PrintToPlayer("You are now able to change your Trusts subjob to Ninja!", 0x15);
    end
end;

function onTrigger(player,npc)
    local lvl = player:getMainLvl()
    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local sjQuestProgress = player:getVar("TRUST_SJ_QUEST_PROGRESS")
    if (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : So you want to expand your Trusts eh?  I'll tell you what, take this item and defeat", 0xD);
        player:PrintToPlayer("Touneaux : 100 experience yeielding monsters while wearing it and then trade it back to me", 0xD);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
    elseif (sjQuestProgress == 1) then
        player:PrintToPlayer("Touneaux : Remember, defeat 100 monsters while wearing that torque and then bring it back to me", 0xD);
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 1 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Warlock's Torque and defeat 100 experience yeilding", 0xD);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0xD);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 2 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Myochin Shusa and defeat 100 experience yeilding", 0xD);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0xD);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
    elseif (((player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) or (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD))) and lvl >= 30 and sjQuest == 3 and sjQuestProgress == 0) then
        player:PrintToPlayer("Touneaux : Ah you're back.  Here take this Ninja Shusa and defeat 100 experience yeilding", 0xD);
        player:PrintToPlayer("Touneaux : monsters while wearing it and then trade it back to me", 0xD);
        player:setVar("TRUST_SJ_QUEST_PROGRESS",1)
        player:setVar("TRUST_SJ_QUEST_COUNTER",1)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
