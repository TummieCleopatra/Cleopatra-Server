-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Abandoned Mineshaft
--
-- !pos 358 16 -190 98
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local FeastForGnats = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_FEAST_FOR_GNATS)
    if (FeastForGnats == QUEST_ACCEPTED and player:getVar("FeastForGnats") == 2) then
        player:startEvent(109);
    elseif (FeastForGnats == QUEST_ACCEPTED and player:getVar("FeastForGnats") == 3 and player:hasKeyItem(dsp.ki.SIGNAL_FIRECRACKER)) then
    -- local ManifestProblem = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
    -- if (ManifestProblem == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.FORT_KEY)) then
        player:startEvent(202, 0, 0, 40);
    -- else
       -- player:messageSpecial(ID.text.YOU_NO_REQS);
    end
end;

function onEventUpdate(player,csid,option,target)
    if(csid == 202) then
        local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasKeyItem(dsp.ki.SIGNAL_FIRECRACKER))) then
                   -- player:messageText(target,ID.text.MEMBER_NO_REQS, false);
                    player:instanceEntry(target,1);
                    return;
                -- elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    -- player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                   -- player:instanceEntry(target,1);
                   -- return;
                end
            end
        end

        player:createInstance(83,129);
    end
end;


function onEventFinish(player,csid,option)
    if (csid == 202 and option == 4) then
        player:setPos(0,0,0,0,129);
    elseif (csid == 109) then
        player:setVar("FeastForGnats",3)
    end
end;

function onInstanceCreated(player,target,instance)
    if (instance) then
        player:setInstance(instance);
        player:instanceEntry(target,4);
        player:setVar("Instance",83)
        player:setVar("FeastForGnats",4)
        local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setVar("Instance",83)
                    player:setVar("FeastForGnats",4)
                    v:setInstance(instance);
                    v:startEvent(90);
                end
            end
        end
    else
       -- player:messageText(target,ID.text.CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;