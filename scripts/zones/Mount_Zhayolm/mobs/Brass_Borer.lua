-----------------------------------
-- Area: Mount Zhayolm
-- MOB:  Brass Borer
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-- TODO: Damage resistances in streched and curled stances. Halting movement during stance change.

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    znmT1Size(mob)
	mob:setLocalVar("formTime", os.time() + math.random(43,47));
end;

-----------------------------------
-- onMobRoam Action
-- Autochange stance
-----------------------------------

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime");
    if (mob:AnimationSub() == 0 and os.time() > roamTime) then
        mob:AnimationSub(1);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    elseif (mob:AnimationSub() == 1 and os.time() > roamTime) then
        mob:AnimationSub(0);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    end
end;

-----------------------------------
-- OnMobFight Action
-- Stance change in battle
-----------------------------------
function onMobFight(mob,target)
    znmScalerT1(mob,target)
    local fightTime = mob:getLocalVar("formTime");
    if (mob:AnimationSub() == 0 and os.time() > fightTime) then
        mob:AnimationSub(1);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    elseif (mob:AnimationSub() == 1 and os.time() > fightTime) then
        mob:AnimationSub(0);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    end
end;

function onMobDeath(mob)
    local nm = 4;
    znmTherionT1(mob, player, nm)
end;