-----------------------------------
-- Area: 
-- NPC:  Dagourmarche
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
-- mob:addMod(dsp.mod.EVA,50);






end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

-- mob:addMod(dsp.mod.HPP,-30);
-- mob:setMod(dsp.mod.ATT,-100);
mob:setMod(dsp.mod.EVA,230);
mob:setMod(dsp.mod.VIT,60);
mob:setMod(dsp.mod.STR,60);
mob:setMod(dsp.mod.DEF,100);
mob:setMod(dsp.mod.ATT,100);
mob:setMod(dsp.mod.INT,45);
local mobdef = mob:getStat(dsp.mod.DEF);
local mobatt = mob:getStat(dsp.mod.ATT);
print(mobatt);
print(mobdef);


end;






-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)

end;