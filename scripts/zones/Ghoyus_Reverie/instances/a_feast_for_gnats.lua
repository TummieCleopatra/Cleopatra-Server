-----------------------------------
--
-- WoTG
--
-----------------------------------
require("scripts/globals/instance")
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Ghoyus_Reverie/IDs")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    -- player:messageSpecial(ID.text.FADES_INTO_NOTHINGNESS, dsp.ki.EPHRAMADIAN_GOLD_COIN);
    -- player:delKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN);
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

function onInstanceCreated(instance)
    for i,v in pairs(ID.mob[3]) do
        SpawnMob(v, instance);
    end

    for i,v in pairs(ID.mob[4]) do
        SpawnMob(v, instance);
    end

   -- GetNPCByID(17305921):openDoor(3600);
end;

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end;

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED,10,10);
        v:startEvent(10000);

    end
end;

function onInstanceProgressUpdate(instance, progress)
    --[[
    if (progress == 3) then
    	for i,v in pairs(ID.mob[5]) do
            SpawnMob(v, instance);
            v:setPos(-333,0,37);
        end
    elseif (progress == 4) then
     	for i,v in pairs(ID.mob[6]) do
            SpawnMob(v, instance);
            v:setPos(-333,0,37);
        end
    end]]--
end;

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        local FeastForGnats = v:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_FEAST_FOR_GNATS)
        if (ManifestProblem == QUEST_ACCEPTED and v:getVar("FeastForGnats") == 4) then
           v:setVar("FeastForGnats",5)
           v:startEvent(10000)
        else
           v:startEvent(10000)
        end
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    print(option)
end