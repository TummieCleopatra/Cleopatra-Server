-----------------------------------
-- Area:
-- NPC:  Archaic Chariot
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    salvageScaler(mob)

end;

function onMobFight(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	salvageAmbient(mob,player);
    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();
    local nm = 17088785; -- Citadel Chelonian
    -- local chance = SSRFLOOR4;
    local ID = mob:getID()
	-- salvageChestS(mob, isKiller)
    if (player:getObjType() ~= dsp.objType.PC) then
        local master = player:getMaster();
        local level = master:getVar("Salvage_Level");
        if (level >= 70 and level <= 75 and GetMobAction(nm) == 0) then
            master:PrintToPlayer("You feel an unknown presense...",0x15);
            SpawnMob(nm):setPos(killx+1,killy,killz);
            GetMobByID(nm):updateClaim(player);
        else
            -- printf("Not of the correct level yet");
        end
    else
        local plvl = player:getVar("Salvage_Level");
        -- printf("Salvage Level %u",plvl);
        if (plvl >= 70 and plvl <= 75) then
            if (player:getObjType() == dsp.objType.PC) then
                player:PrintToPlayer("You feel an unknown presense...",0x15);
                SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(player);
            else
                -- printf("Not of the correct level yet");
            end
        end
    end

end;