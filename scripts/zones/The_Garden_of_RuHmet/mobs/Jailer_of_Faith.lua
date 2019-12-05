-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Faith
-----------------------------------

require("scripts/globals/mobscaler");
require("scripts/globals/status");
require("scripts/globals/magic");
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",8); 
    -- Give it two hour
    -- mob:setMod(dsp.mobMod.MAIN_2HOUR, 1);
    -- Change animation to open
    mob:AnimationSub(2);
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms 
-----------------------------------

function onMobFight(mob)
    local size = target:getPartySize();
	mobScaler(mob,target);
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed 
    local randomTime = math.random(45,180);
    local changeTime = mob:getLocalVar("changeTime");
    
    if (mob:getBattleTime() - changeTime > randomTime) then
        -- Change close to open.
        if (mob:AnimationSub() == 1) then
            mob:AnimationSub(2);
        else -- Change from open to close
            mob:AnimationSub(1);
        end
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

        player:setVar("Faith_Win",1);
	    player:addCurrency('zeni_point',500);
	    player:PrintToPlayer("You obtain 500 Zeni Points.", 0x15);		

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer, npc)
    -- Move QM to random location
    local pos = math.random(1, 5)
    GetNPCByID(ID.npc.JAILER_OF_FAITH_QM):setPos(ID.npc.JAILER_OF_FAITH_QM_POS[pos][1], ID.npc.JAILER_OF_FAITH_QM_POS[pos][2], ID.npc.JAILER_OF_FAITH_QM_POS[pos][3])
end;
