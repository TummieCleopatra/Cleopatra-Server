-----------------------------------
-- Area: Fort Karugno Narugo
--  NPC: Colorful Door
--
-- !pos -136 -68 101 96
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ManifestProblem = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
    if (ManifestProblem == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.FORT_KEY)) then
        player:startEvent(235, 0, 0, 28);
    -- else
       -- player:messageSpecial(ID.text.YOU_NO_REQS);
    end
end;

function onEventUpdate(player,csid,option,target)
    if(csid == 235) then
        local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasKeyItem(dsp.ki.FORT_KEY))) then
                    player:messageText(target,ID.text.MEMBER_NO_REQS, false);
                    player:instanceEntry(target,1);
                    return;
                -- elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    -- player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                   -- player:instanceEntry(target,1);
                   -- return;
                end
            end
        end

        player:createInstance(82,129);
    end
end;


function onEventFinish(player,csid,option)
    if (csid == 235 and option == 4) then
        player:setPos(0,0,0,0,129);
    end
end;

function onInstanceCreated(player,target,instance)
    if (instance) then
        player:setInstance(instance);
        player:instanceEntry(target,4);

        local party = player:getParty();
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setInstance(instance);
                    v:startEvent(90);
                end
            end
        end
    else
        player:messageText(target,ID.text.CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;