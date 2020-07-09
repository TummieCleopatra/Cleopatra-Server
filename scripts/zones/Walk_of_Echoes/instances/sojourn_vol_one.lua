-----------------------------------
require("scripts/globals/instance")
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Walk_of_Echoes/IDs")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    -- player:messageSpecial(ID.text.FADES_INTO_NOTHINGNESS, dsp.ki.EPHRAMADIAN_GOLD_COIN);
    -- player:delKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN);
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit());
    printf("Player in instance")
end;

function onInstanceCreated(instance)
    -- Difficulty is based on progress at start:
    -- 1: Very Easy
    -- 2: Easy
    -- 3: Normal
    -- 4: Difficult
    -- 5: Very Difficult

    local family = 0
    local familytype = 0
    local groupone = 0
    local grouptwo = 0
    local groupthree = 0



    local familyspawn = math.random(1,100)

    if (familyspawn <= 100) then
        family = 1
    end

    if (family == 1) then
       -- familytype = math.random(1,10)
        familytype = 1
        groupone = familytype
        grouptwo = familytype * 100
        groupthree = familytype * 1000

    end




    -- Group 1
        for i,v in pairs(ID.mob[groupone]) do
            SpawnMob(v, instance)
        end

    -- Group 2
        for i,w in pairs(ID.mob[grouptwo]) do
            SpawnMob(w, instance)
        end

    -- Group 3
        for i,y in pairs(ID.mob[groupthree]) do
            SpawnMob(y, instance)
        end



        --[[
    if (instance:getProgress() == 1) then

        printf("VERY EASY CHOSEN")
        local family = math.random(1,2)
        printf("MOB TYPE IS: %u",family)
        for i,v in pairs(ID.mob[family]) do
            SpawnMob(v, isntance)
        end


    end
    ]]--
--[[
    for i,v in pairs(ID.mob[3]) do
        SpawnMob(v, instance);
    end

    for i,v in pairs(ID.mob[4]) do
        SpawnMob(v, instance);
    end

   -- GetNPCByID(17305921):openDoor(3600);
   ]]--
   -- Reset Progress
   instance:setProgress(0)
end;

function onInstanceTimeUpdate(instance, elapsed)
   -- updateInstanceTime(instance, elapsed, ID.text)
end;

function onInstanceFailure(instance)

    local chars = instance:getChars();
--[[
    for i,v in pairs(chars) do
         v:messageSpecial(ID.text.MISSION_FAILED,10,10);
        v:startEvent(10000);

    end]]--
    printf("Instance Failed")
end;

function onInstanceProgressUpdate(instance, progress)
    local chars = instance:getChars();
    local difficulty = 0

    if (progress == 2) then
    	for i,v in pairs(chars) do
            v:PrintToPlayer("You feel a slight chill in the air...", 0x15);
            difficulty = v:getVar("SojournV1")
        end

        for i,w in pairs(ID.miniBoss[1]) do
            SpawnMob(w, instance)
            local miniNM = instance:getEntity(bit.band(w, 0xFFF), dsp.objType.MOB)
            miniNM:setLocalVar("Difficulty",difficulty)
        end


    elseif (progress == 12) then
    	local mainNM = instance:getEntity(bit.band(ID.mainBoss[1], 0xFFF), dsp.objType.MOB)
        mainNM:hideHP(false)
    end

end;

function onInstanceComplete(instance)

    local chars = instance:getChars();
    for i,v in pairs(chars) do
        v:setPoS(0,-4,117,1,249)
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    print(option)
end