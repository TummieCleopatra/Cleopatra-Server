-----------------------------------
-- Area:
-- NPC:  Long-Bowed_Chariot
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    salvageChestBBoss(mob, isKiller)
	player:addTitle(COMET_CHARIOTEER);
end;