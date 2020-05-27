-----------------------------------
--  PET: Luopan
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")




function doHealingBreath(player, threshold, breath)
    if player:getHPP() < threshold then
        player:getPet():useJobAbility(breath, player)
    else
        local party = player:getPartyWithTrusts()
        for _,member in ipairs(party) do
            if member:getHPP() < threshold then
                player:getPet():useJobAbility(breath, member)
                break
            end
        end
    end
end

function onMobSpawn(mob)
    printf("Luopan Spawn")
    local master = mob:getMaster()
    mob:addMod(dsp.mod.DMG, -40)
    local wyvernType = wyvernTypes[master:getSubJob()]
    local healingbreath = 624
    master:addListener("MAGIC_USE", "PET_WYVERN_MAGIC", function(player, target, spell, action)
        -- check master first!
        local threshold = 33
        if player:getMod(dsp.mod.WYVERN_EFFECTIVE_BREATH) > 0 then
            threshold = 50
        end
        doHealingBreath(player, threshold, healingbreath)
    end)
end

