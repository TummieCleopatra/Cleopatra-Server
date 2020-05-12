-----------------------------------
--  PET: Odin
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pets")


function onMobSpawn(mob)
    local master = mob:getMaster()
    local petID = master:getPetID()
    -- buff HP

    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,25,0,0);
    mob:addHP(1000)

    mob:setLocalVar("favorOn",0)
    mob:setLocalVar("afCool",2)
    mob:setLocalVar("despawn",os.time() + 9)
    mob:setLocalVar("afTime",os.time())
    printf("spawnnned")
    if (mob:getMaster() ~= nil) then
        if (master:hasStatusEffect(dsp.effect.AVATAR_S_FAVOR)) then
            printf("Apply buffs on spawn")
            master:addMod(dsp.mod.AVATAR_PERPETUATION, 9)
            local skill = master:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
            local attBuff = (skill / 30) + 1;
            local accBuff = (skill / 5) + 1;
            local mabBuff = (skill / 10) + 5;
            local regain = (skill / 10) + 20;
            local def = (skill / 5) + 10

            mob:addMod(dsp.mod.ATTP, attBuff)
            mob:addMod(dsp.mod.ACC, accBuff)
            mob:addMod(dsp.mod.MATT, mabBuff)
            mob:addMod(dsp.mod.REGAIN, regain)
            mob:setLocalVar("favorOn",1)
        end
    end


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
            elseif (battletime > afDespawn) then
                mob:setHP(0)
            end
        end)
    end

    if (petID <= 20) then
        mob:addListener("TICK", "TEST", function(mob)
            local hp = mob:getMaxHP()
            -- print(hp)
            local favorOn = mob:getLocalVar("favorOn")
            local player = mob:getMaster()
            -- Turn On if favor is on
            if (player ~= nil) then
                if (player:hasStatusEffect(dsp.effect.AVATAR_S_FAVOR) and favorOn == 0) then
                    printf("Favor On!")
                    player:addMod(dsp.mod.AVATAR_PERPETUATION, 9)
                    local skill = player:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
                    local attBuff = (skill / 30) + 1;
                    local accBuff = (skill / 5) + 1;
                    local mabBuff = (skill / 10) + 5;
                    local regain = (skill / 10) + 20;

                    mob:addMod(dsp.mod.ATTP, attBuff)
                    mob:addMod(dsp.mod.ACC, accBuff)
                    mob:addMod(dsp.mod.MATT, mabBuff)
                    mob:addMod(dsp.mod.REGAIN, regain)
                    mob:setLocalVar("favorOn",1)
                end
            end
            if (player ~= nil) then
                if (not player:hasStatusEffect(dsp.effect.AVATAR_S_FAVOR) and favorOn == 1) then
                   printf("Favor off")
                    local skill = player:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
                    local attBuff = (skill / 30) + 1;
                    local accBuff = (skill / 5) + 1;
                    local mabBuff = (skill / 10) + 5;
                    local regain = (skill / 10) + 20;
                    master:addMod(dsp.mod.AVATAR_PERPETUATION, -9)
                    mob:delMod(dsp.mod.ATTP, attBuff)
                    mob:delMod(dsp.mod.ACC, accBuff)
                    mob:delMod(dsp.mod.MATT, mabBuff)
                    mob:delMod(dsp.mod.REGAIN, regain)
                    mob:setLocalVar("favorOn",0)
                end
            end

        end)

        --[[
        mob:addListener("COMBAT_TICK", "AVATAR_FAVOR", function(mob)
            local favorOn = mob:getLocalVar("favorOn")
            local player = mob:getMaster()
            if (player:hasStatusEffect(dsp.effect.AVATAR_S_FAVOR) and favorOn == 0) then
                local skill = player:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
                local attBuff = (skill / 10) + 5;
                local accBuff = (skill / 10) + 1;
                local mabBuff = (skill / 10) + 5;
                local regain = (skill / 10) + 20;

                mob:addMod(dsp.mod.ATTP, attBuff)
                mob:addMod(dsp.mod.ACC, accBuff)
                mob:addMod(dsp.mod.MATT, mabBuff)
                mob:addMod(dsp.mod.REGAIN, regain)
                mob:setLocalVar("favorOn",1)
            end
        end)]]--
    end
end

function onMobRoam(mob)
    printf("I am roaming")
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end