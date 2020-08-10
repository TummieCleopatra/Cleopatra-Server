-----------------------------------
-- Area:
-- NPC:  Ashu Talif Crew
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
    --[[
    local ID = mob:getID()
    if (ID >= 17088513 and ID <= 17088556) then
        mob:addMod(dsp.mod.ATT, -30)
    end]]--
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
    local nm = 17088557; -- Hammerblow
    local nm2 = 17088617; -- Powderkeg
    local chance = SSRFLOOR1;
    local ID = mob:getID()
	salvageChestS(mob, isKiller)
    if (ID >= 17088513 and ID <= 17088556) then
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            local level = master:getVar("Salvage_Level");
            if (level >= 40 and level <= 45 and GetMobAction(nm) == 0) then
                if (math.random(0,99) < chance) then
                    master:PrintToPlayer("You feel an unknown presense...",0x15);
                    SpawnMob(nm):setPos(killx+1,killy,killz);
                    GetMobByID(nm):updateClaim(player);
                end
            else
                -- printf("Not of the correct level yet");
            end
        else
            local plvl = player:getVar("Salvage_Level");
            -- printf("Salvage Level %u",plvl);
            if (plvl >= 40 and plvl <= 45) then
                if (math.random(0,99) < chance) then
                    if (player:getObjType() == dsp.objType.PC) then
                        player:PrintToPlayer("You feel an unknown presense...",0x15);
                    end
                    SpawnMob(nm):setPos(killx+1,killy,killz);
                    GetMobByID(nm):updateClaim(player);
                end
            else
                -- printf("Not of the correct level yet");
            end
        end
    elseif (ID >= 17088558 and ID <= 17088637) then
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            local level = master:getVar("Salvage_Level");
            if (level >= 50 and level <= 55 and GetMobAction(nm2) == 0) then
                if (math.random(0,99) < chance) then
                    master:PrintToPlayer("You feel an unknown presense...",0x15);
                    SpawnMob(nm2):setPos(killx+1,killy,killz);
                    GetMobByID(nm2):updateClaim(player);
                end
            else
                -- printf("Not of the correct level yet");
            end
        else
            local plvl = player:getVar("Salvage_Level");
            -- printf("Salvage Level %u",plvl);
            if (plvl >= 50 and plvl <= 55) then
                if (math.random(0,99) < chance) then
                    if (player:getObjType() == dsp.objType.PC) then
                        player:PrintToPlayer("You feel an unknown presense...",0x15);
                    end
                    SpawnMob(nm2):setPos(killx+1,killy,killz);
                    GetMobByID(nm2):updateClaim(player);
                end
            else
                -- printf("Not of the correct level yet");
            end
        end
    end

end;