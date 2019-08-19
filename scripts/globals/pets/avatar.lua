-----------------------------------
--  PET: Odin
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pets")


function onMobSpawn(mob)
    local master = mob:getMaster()
    local petID = master:getPetID()
    mob:setLocalVar("afCool",4)
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
            print(battletime)
            print(afcool)
            if (battletime > afTime + afCooldown) then
                mob:useMobAbility(2334)
                mob:setLocalVar("afTime",battletime)
            end
        end)
    end

    if (petID == 76) then
        mob:addListener("COMBAT_TICK", "ALICORN_TICK", function(mob, player, target)
            local battletime = os.time()
            local afCooldown = mob:getLocalVar("afCool")
            local afTime = mob:getLocalVar("afTime")
            if (battletime > afTime + afCooldown) then
                mob:useMobAbility(2370)
                mob:setLocalVar("afTime",battletime)
            end
        end)
    end
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end