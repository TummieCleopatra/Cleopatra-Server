-----------------------------------
-- Area: Walk of Echoes
--  MOB: Apkallu NM
-- Spawns after defeating 5 Mobs inside Sojourn V1 (BIRDS)
-- Defeating 7 mobs removes removes Frigid Shuffle
-- Defeating 9 mobs removes Yawn
-- Defeating 11 mobs removes Mightly Strikes

-----------------------------------
require("scripts/globals/status");
require("scripts/globals/sojourn");
local ID = require("scripts/zones/Walk_of_Echoes/IDs")
-----------------------------------
function onMobSpawn(mob)
    t1nmDifficulty(mob)
    mob:setLocalVar("HundredDone",0)
    mob:setLocalVar("HundredTime",0)
end

function onMobEngaged(mob,target)


end;


function onMobFight(mob, target)
    --[[
    local ws5 = {1713,1714,1715,1716,1717} -- All TP Moves
    local ws4 = {1713,1714,1715,1717} -- Remove Frigid Shuffle
    local ws3 = {1714,1715,1717} -- Remove Frigid Shuffle and Yawn
    local battletime = mob:getBattleTime();
    local hundred = mob:getLocalVar("Hundred");
    local hundredTime = mob:getLocalVar("HundredTime")
    local hundredrand = math.random(90,120)
	local hundredDone = mob:getLocalVar("HundredDone")
	local instance = mob:getInstance()
	local progress = instance:getProgress()
    local hpp = mob:getHPP()
    local tp = mob:getTP()


    if (battletime > (hundredTime + hundredrand) and hundredDone ~= 1) then
        mob:useMobAbility(690);
        mob:setLocalVar("HundredTime", battletime);
		if (progress >= 11) then
		    mob:setLocalVar("HundredDone",1)
		end
    end

    -- Handle TP
    local randtp = math.random(1400,1600)
    if (hpp > 70 and tp >= randtp) then
        if (progress >= 9) then
            local tpmove = math.random(1,3)
            local mobskill = ws3[tpmove]
            mob:useMobAbility(mobskill)
        elseif (progress >= 7) then
            local tpmove = math.random(1,4)
            local mobskill = ws3[tpmove]
            mob:useMobAbility(mobskill)
        else
            local tpmove = math.random(1,5)
            local mobskill = ws5[tpmove]
            mob:useMobAbility(mobskill)
        end
    elseif (hpp > 30 and tp >= (randtp - 400)) then
        if (progress >= 9) then
            local tpmove = math.random(1,3)
            local mobskill = ws3[tpmove]
            mob:useMobAbility(mobskill)
        elseif (progress >= 7) then
            local tpmove = math.random(1,4)
            local mobskill = ws4[tpmove]
            mob:useMobAbility(mobskill)
        else
            local tpmove = math.random(1,5)
            local mobskill = ws5[tpmove]
            mob:useMobAbility(mobskill)
        end
    elseif (hpp <= 30 and tp >= 1000) then
        if (progress >= 9) then
            local tpmove = math.random(1,3)
            local mobskill = ws3[tpmove]
            mob:useMobAbility(mobskill)
        elseif (progress >= 7) then
            local tpmove = math.random(1,4)
            local mobskill = ws4[tpmove]
            mob:useMobAbility(mobskill)
        else
            local tpmove = math.random(1,5)
            local mobskill = ws5[tpmove]
            mob:useMobAbility(mobskill)
        end
    end

    ]]--
end

function onMobDespawn(mob)


end;

function onMobDeath(mob, player, isKiller)

    calculateV1T1Points(mob, player)
    local instance = mob:getInstance()
    instance:complete();


    instance:setProgress(instance:getProgress() + 1);


end;