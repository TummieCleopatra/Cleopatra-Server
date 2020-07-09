-----------------------------------
--	Area: Mhaura
--	NPC:  Augment for Sea Items
-----------------------------------

-----------------------------------

-----------------------------------

require("scripts/zones/Mhaura/IDs");
require("scripts/globals/settings");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(6011,1)) then
        local party = player:getParty();
        player:setVar("SojournV1",1)
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasItem(6011))) then
                    player:PrintToPlayer("Not all members have met the requirements",0xD)
                    player:instanceEntry(target,1);
                    return;
                -- elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    -- player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                   -- player:instanceEntry(target,1);
                   -- return;
                else
                    v:PrintToPlayer("Sojourn Volume 1: Very Easy", 0x15);
                end
            end
        end


        player:createInstance(115,182);

    elseif (trade:hasItemQty(6013,1)) then
        local party = player:getParty();
        player:setVar("SojournV1",3)
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasItem(6013))) then
                    player:PrintToPlayer("Not all members have met the requirements",0xD)
                    player:instanceEntry(target,1);
                    return;
                -- elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    -- player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                   -- player:instanceEntry(target,1);
                   -- return;
                else
                    v:PrintToPlayer("Sojourn Volume 1: Normal", 0x15);
                end
            end
        end


        player:createInstance(115,182);

    elseif (trade:hasItemQty(6014,1)) then
        local party = player:getParty();
        player:setVar("SojournV1",4)
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if (not (v:hasItem(6014))) then
                    player:PrintToPlayer("Not all members have met the requirements",0xD)
                    player:instanceEntry(target,1);
                    return;
                -- elseif (v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50) then
                    -- player:messageText(target,ID.text.MEMBER_TOO_FAR, false);
                   -- player:instanceEntry(target,1);
                   -- return;
                else
                    v:PrintToPlayer("Sojourn Volume 1: Difficult", 0x15);
                end
            end
        end


        player:createInstance(115,182);


    end


end


function onTrigger(player,npc)


end;


function onInstanceCreated(player,target,instance)
    if (instance) then
        -- Set difficulty based on player VAR
        local difficulty = player:getVar("SojournV1")
        instance:setProgress(difficulty)
        player:setInstance(instance);
        player:instanceEntry(target,4);
        player:setVar("Instance",115)

        local party = player:getParty();
        if (party ~= nil) then
            player:setPos(0,0,0,0,182);
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setVar("Instance",115)
                    v:setInstance(instance);
                    printf("Set the player in the instance")
                    v:setPos(0,0,0,0,182);

                end
            end
        else
            printf("Set the player in the instance solo")
            player:setPos(0,0,0,0,182);
        end
    else
       -- player:messageText(target,ID.text.CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;