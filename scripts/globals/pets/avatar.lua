-----------------------------------
--  PET: Odin
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pets")


function onMobSpawn(mob)
    local master = mob:getMaster()
    local petID = master:getPetID()
    mob:setLocalVar("favorOn",0)
    mob:setLocalVar("afCool",2)
    mob:setLocalVar("despawn",os.time() + 9)
    mob:setLocalVar("afTime",os.time())
    printf("spawnnned")

    if (petID == dsp.pet.id.ODIN) then
        mob:addListener("COMBAT_TICK", "ODIN_TICK", function(mob, player, target)
            printf("ODIN TICK??")
            local battletime = os.time()
            local afCooldown = mob:getLocalVar("afCool")
            local afTime = mob:getLocalVar("afTime")
            if (battletime > afTime + afCooldown) then
                mob:useMobAbility(2126)
                mob:setLocalVar("afTime",battletime)
            end
        end)
    end

    if (petID == dsp.pet.id.DARK_IXION) then
        mob:addListener("COMBAT_TICK", "IXION_TICK", function(mob, player, target)
            local battletime = os.time()
            local afCooldown = mob:getLocalVar("afCool")
            local afTime = mob:getLocalVar("afTime")
            local afDespawn = mob:getLocalVar("despawn")
            if (battletime > afTime + afCooldown) then
                mob:useMobAbility(2334)
                mob:setLocalVar("afTime",battletime)
                mob:setLocalVar("afCool",20)
            elseif (battletime >  afDespawn) then
                mob:setHP(0)
            end

        end)
    end

    if (petID == 76) then
        mob:addListener("COMBAT_TICK", "ALICORN_TICK", function(mob, player, target)
            local battletime = os.time()
            local afCooldown = mob:getLocalVar("afCool")
            local afTime = mob:getLocalVar("afTime")
            local afDespawn = mob:getLocalVar("despawn")
            if (battletime > afTime + afCooldown) then
                mob:useMobAbility(2370, mob)
                mob:setLocalVar("afTime",battletime)
                mob:setLocalVar("afCool",20)
            elseif (battletime >  afDespawn) then
                mob:setHP(0)
            end
        end)
    end

    if (petID <= 20) then
        mob:addListener("COMBAT_TICK", "AVATAR_FAVOR", function(mob, player, target)
            local favorOn = mob:getLocalVar("favorOn")
            if (player:hasStatusEffect(dsp.effect.AVATAR_S_FAVOR) and favorOn ~= 1) then
                local skill = player:getSkillLevel(dsp.skill.SUMMONING_MAGIC);
                local attBuff = (skill / 250) + 3;
                local accBuff = (skill / 10) + 1;
                local mabBuff = (skill / 10) + 1;
                local regain = (skill / 10) + 10;

                mob:addMod(dsp.mod.ATTP, attBuff)
                mob:addMod(dsp.mod.ACC, accBuff)
                mob:addMod(dsp.mod.MAB, mabBuff)
                mob:addMod(dsp.mod.REGAIN, regain)
                mob:setLocalVar("favorOn",1)
            end
        end)
    end
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end