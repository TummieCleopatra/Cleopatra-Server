-----------------------------------
-- Exudation
-- Club weapon skill
-- Skill Level: N/A
-- Single Attack
-- Attack varies with TP. Idris: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (GEO) quest.
-- Will stack with Sneak Attack.
-- Modifiers: INT:50% MND:50%
-- 100%TP    200%TP    300%TP
-- 1.5      3.625      4.75
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.8 params.ftp200 = 2.8 params.ftp300 = 2.8
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5
    params.mnd_wsc = 0.5 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.5; params.atk200 = 3.66; params.atk300 = 4.75;

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 4.8 params.ftp200 = 4.8 params.ftp300 = 4.8
        params.int_wsc = 0.5
        params.mnd_wsc = 0.5
        params.atk100 = 2.5; params.atk200 = 3.625; params.atk300 = 4.75;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params)

    -- Apply aftermath
    if damage > 0 then
        dsp.aftermath.addStatusEffect(player, tp, dsp.slot.MAIN, dsp.aftermath.type.MYTHIC)
    end

    return tpHits, extraHits, criticalHit, damage
end
