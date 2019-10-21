---------------------------------------------------
-- High Jump
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/ability")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    local lvl = pet:getMainLvl()
    local vit = pet:getStat(dsp.mod.VIT)

    local pdif = pet:getStat(dsp.mod.ATT) / target:getStat(dsp.mod.DEF)
    local dmg = (lvl * (1 + (vit / 224))) * pdif

    pet:addTP(114)

    return dmg
end
