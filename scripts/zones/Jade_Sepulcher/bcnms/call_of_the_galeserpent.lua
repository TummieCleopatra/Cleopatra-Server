-----------------------------------
-- Area: Jade Sepulcher
-- BCNM: 
-----------------------------------
package.loaded["scripts/zones/Jade_Sepulcher/IDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Jade_Sepulcher/IDs");

----------------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    -- print("leave code "..leavecode);
   
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage        
        player:setVar("Najelith_Fight",2);
        player:startEvent(32002);
    elseif (leavecode == 4) then
         player:startEvent(32002);
    end		 
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);
    
    if (csid == 32001) then
        player:completeMission(TOAU,PUPPET_IN_PERIL);
        player:setVar("AhtUrganStatus",0);
        player:addMission(TOAU,PREVALENCE_OF_PIRATES);
    end
    
end;