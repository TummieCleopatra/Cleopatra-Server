-----------------------------------
-- Area: West Saurtabaruta (S)
-- Mob: Fortification
-- Note: Campaign Mob
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/zones/West_Sarutabaruta_[S]/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ATTACK_SKILL_LIST,900)
    mob:setHP(100000)
end
