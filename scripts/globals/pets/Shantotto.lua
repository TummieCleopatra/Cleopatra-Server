-------------------------------------------------
--  TRUST: Shantotto
--  Magic: Tier I-IV Elemental Spells
--  JA: None
--  WS: None
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local magicCooldown = 45
    local dotCooldown = 7
    local aspirCooldown = 60
    local angle = getAngle(mob)

	mob:setLocalVar("magicTime",0)
    mob:setLocalVar("dotTime",0)
    mob:setLocalVar("aspirTime",0)
    mob:SetAutoAttackEnabled(false)

    mob:addListener("COMBAT_TICK", "SHANTOTTO_DISTANCE_TICK", function(mob, player, target)
        trustMageMove(mob, player, target, angle)
        local distance = mob:checkDistance(target)
        local battletime = os.time()
        local magicTime = mob:getLocalVar("magicTime")
        local enmity = enmityCalc(mob, player, target)
        if (battletime > magicTime + magicCooldown and enmity >= 2000 and distance >= 9.9) then
            local spell = doShantottoSpells(mob)
            if (spell > 0) then
                mob:castSpell(spell, target)
                mob:setLocalVar("magicTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "SHANTOTTO_DEBUFF_TICK", function(mob, player, target)
        trustMageMove(mob, player, target, angle)
        local distance = mob:checkDistance(target)
        local battletime = os.time()
        local dotTime = mob:getLocalVar("dotTime")
        if (battletime > dotTime + dotCooldown and distance >= 9.9) then
            local spell = doShantottoDoT(mob, target)
            if (spell > 0) then
                mob:castSpell(spell, target)
                mob:setLocalVar("dotTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "SHANTOTTO_ASPIR_TICK", function(mob, player, target)
        local distance = mob:checkDistance(target)
        local battletime = os.time()
        local aspirTime = mob:getLocalVar("aspirTime")
        local mp = mob:getMP()
        local mpmax = mob:getMaxMP()
        local mpp = (mp / mpmax ) * 100
        local lvl = mob:getMainLvl()
        local tmp = target:getMaxMP()
        if (battletime > aspirTime + aspirCooldown and distance >= 9.9 and mpp < 90 and lvl >= 25 and tmp > 0) then
            mob:castSpell(247, target)
            mob:setLocalVar("aspirTime",battletime)
        end
    end)

end

function doShantottoDoT(mob, target)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0

    if (target:hasStatusEffect(dsp.effect.FROST) == false and lvl >= 22 and mp >= 25) then
        spell = 236
    elseif (target:hasStatusEffect(dsp.effect.DROWN) == false and lvl >= 27 and mp >= 25) then
        spell = 240
    elseif (target:hasStatusEffect(dsp.effect.RASP) == false and lvl >= 18 and mp >= 25) then
        spell = 238
    end

    return spell
end

function doShantottoSpells(mob)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0

    local spellList = {{75,195,167},{74,162,149},{73,135,147},{72,115,157},{70,99,172},{68,88,162},
                       {66,91,166},{64,75,148},{62,63,146},{59,54,156},{55,46,171},{51,40,161},
                       {46,37,165},{42,31,147},{38,26,145},{34,22,155},{30,19,170},{26,16,160},
                       {21,9,164},{17,8,146},{13,7,144},{9,6,154},{5,5,169},{1,4,159}}


    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][2]) then
            spell = spellList[i][3]
            break
        end
    end

    print(spell)
    return spell
end


