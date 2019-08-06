-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/mobscaler");
-----------------------------------

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.ADAMANTOISE_QM):setStatus(dsp.status.DISAPPEAR)
    end
    mob:setLocalVar("PartySize",5);
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    mobScaler(mob,target);
    local mobId = mob:getID();
    if (GetMobAction(mobId) ~= dsp.act.ATTACK) then
	    mob:setLocalVar("depopTime", os.time());
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ASPIDOCHELONE_SINKER)
	player:setVar("Aspi_Win",1);
	player:addCurrency('prestige', 250);
	player:PrintToPlayer("You obtain 250 Prestige Points!", 0xD);
end

function onMobDespawn(mob)
    -- Set Aspidochelone's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Aspidochelone", 0)
        DisallowRespawn(ID.mob.ADAMANTOISE, false)
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(75600 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
