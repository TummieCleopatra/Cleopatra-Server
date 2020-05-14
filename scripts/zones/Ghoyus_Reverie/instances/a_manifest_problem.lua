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
    for i,v in pairs(ID.mob[1]) do
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

    printf("[CURRENT PROGRESS IS] %u",progress)

    if (progress == 13) then
        for i,v in pairs(ID.mob[2]) do
            SpawnMob(v, instance)
        end
    elseif (progress == 20) then
        for i,v in pairs(ID.mob[1]) do
            SpawnMob(v, instance)
        end
    elseif (progress == 25) then
        printf("Mega boss")
        SpawnMob(17305662, instance)
    end


end;

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        local ManifestProblem = v:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
        if (ManifestProblem == QUEST_ACCEPTED and v:getVar("ManifestProblem") == 3) then
           v:setVar("ManifestProblem",4)
           v:startEvent(10000)
        else
           v:startEvent(10000)
        end
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end