-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Sealed Entrance (Sealed_Entrance_3)
-- !pos -340.000 1.825 -364.825 95
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    if trade:hasItemQty(5266,1) and player:getVar("OneManNotEnough") == 3 then --  Blackened Siredon,
        player:startEvent(103) -- This defaults to chocobo bedding
        player:tradeComplete()
    elseif trade:hasItemQty(4289,1) and player:getVar("OneManNotEnough") == 3 then -- Forest Carp
        player:startEvent(103,0,1)
        player:tradeComplete()
    elseif trade:hasItemQty(4500,1) and player:getVar("OneManNotEnough") == 3 then-- Greedie
        player:startEvent(103,0,2)
        player:tradeComplete()
    elseif trade:hasItemQty(4464,1) and player:getVar("OneManNotEnough") == 3 then -- Pipira.
        player:startEvent(103,0,3)
        player:tradeComplete()
    end
end


function onTrigger(player,npc)

    local snakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
    local oneManIsNotEnough = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.WHEN_ONE_MAN_IS_NOT_ENOUGH)
    local maskBit1 = player:getMaskBit(player:getVar("SEALED_DOORS"), 0)
    local maskBit2 = player:getMaskBit(player:getVar("SEALED_DOORS"), 1)
    local maskBit3 = player:getMaskBit(player:getVar("SEALED_DOORS"), 2)

    if snakeOnThePlains == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY) then
        if not maskBit3 then
            if not maskBit2 or not maskBit1 then
                player:setMaskBit(player:getVar("SEALED_DOORS"), "SEALED_DOORS", 2, true)
                player:messageSpecial(ID.text.DOOR_OFFSET + 1, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
            else
                player:setMaskBit(player:getVar("SEALED_DOORS"), "SEALED_DOORS", 2, true)
                player:messageSpecial(ID.text.DOOR_OFFSET + 4, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
                player:delKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
            end
        else
            player:messageSpecial(ID.text.DOOR_OFFSET + 2, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
        end
    elseif oneManIsNotEnough == QUEST_ACCEPTED and player:getVar("OneManNotEnough") == 1 then
        player:startEvent(102)
    elseif oneManIsNotEnough == QUEST_ACCEPTED and player:getVar("OneManNotEnough") == 2 then
        player:startEvent(104)
    elseif snakeOnThePlains == QUEST_COMPLETED then
        player:messageSpecial(ID.text.DOOR_OFFSET + 2, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
    else
        player:messageSpecial(ID.text.DOOR_OFFSET + 3)
    end
end

function onEventUpdate(player,csid,option)
    print(csid)
    print(option)
end

function onEventFinish(player,csid,option)
    print(option)
    if (csid == 102) then
        player:setVar("OneManNotEnough",2)
    elseif (csid == 104) then
        player:setVar("OneManNotEnough",3)
    elseif (csid == 103 and option ~= 0) then
        player:setVar("OneManNotEnough",0)
        player:addItem(941,12)
        player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.WHEN_ONE_MAN_IS_NOT_ENOUGH)
    end
end