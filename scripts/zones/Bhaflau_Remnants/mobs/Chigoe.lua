-----------------------------------
-- Area: Caedarva Mire
--  Mob: Chigoe
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
-----------------------------------

function onMobFight(mob, target)
    if (GetMobByID(17084692):getHP() == 0) then
        target:startEvent(4);
    end


end


function onMobDeath(mob, player, isKiller)
end

function onEventUpdate(player,csid,option)
	local posx = player:getVar("Bhaflau_X");
    local posy = player:getVar("Bhaflau_Y");
	local posz = player:getVar("Bhaflau_Z");
    if (csid == 4) then
        player:setPos(posx,posy,posz);
	    player:setVar("Bhaflau_X",0);
        player:setVar("Bhaflau_Y",0);
	    player:setVar("Bhaflau_Z",0);
    end
---- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
	local posx = player:getVar("Bhaflau_X");
    local posy = player:getVar("Bhaflau_Y");
	local posz = player:getVar("Bhaflau_Z");
    if (csid == 4) then
        player:setPos(posx,posy,posz);
	    player:setVar("Bhaflau_X",0);
        player:setVar("Bhaflau_Y",0);
	    player:setVar("Bhaflau_Z",0);
    end
end;