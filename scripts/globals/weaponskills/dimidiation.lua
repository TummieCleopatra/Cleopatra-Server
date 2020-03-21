-----------------------------------
-- Dimidiation
-- Great Sword weapon skill
-- Skill Level: N/A
-- Delivers a twofold attack.
-- Damage varies with TP. Epeolatry: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (RUN) quest.
-- Will stack with Sneak Attack.
-- Modifiers: DEX:80%
-- 100%TP    200%TP    300%TP
-- 2.25      4.50      6.50
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2 params.ftp200 = 2.13 params.ftp300 = 2.5
    params.str_wsc = 0.0 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.66; params.atk200 = 1.66; params.atk300 = 1.66;

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 2.25 params.ftp200 = 4.50 params.ftp300 = 6.50
        params.dex_wsc = 0.8
        params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params)

    -- Apply aftermath
    if damage > 0 then
        dsp.aftermath.addStatusEffect(player, tp, dsp.slot.MAIN, dsp.aftermath.type.MYTHIC)
    end

    return tpHits, extraHits, criticalHit, damage
end
