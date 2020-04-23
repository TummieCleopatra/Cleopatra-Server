-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Olla Media
-----------------------------------

require("scripts/globals/mobscaler");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",5);
end;

function onMobFight( mob, target )
    mobScaler(mob,target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    SpawnMob(mob:getID() + 1,180):updateEnmity(player);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    if (GetMobAction(mob:getID() + 1) == 0) then -- if this Media despawns and Grande is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(17506692):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;