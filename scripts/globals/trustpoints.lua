-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function doKupipiTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local curePot = 0
    local cureTime = 0

    if (player:getVar("KUPIPI_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Kup")
        acc = player:getVar("TrustAcc_Kup")
        curePot = player:getVar("TrustCure_Kup")
        cureTime = player:getVar("TrustCast_Kup")

        mob:addMod(dsp.mod.ATT,att)
        mob:addMod(dsp.mod.ACC,acc)
        mob:addMod(dsp.mod.CURE_POTENCY,curePot)
        mob:addMod(dsp.mod.CURE_CAST_TIME,cureTime)
    end
end

function doCurillaTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local curePot = 0
    local cureTime = 0

    if (player:getVar("CURILLA_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Cur")
        acc = player:getVar("TrustAcc_Cur")
        def = player:getVar("TrustDEF_Cur")
        enmity = player:getVar("TrustENM_Cur")

        mob:addMod(dsp.mod.ATT,att)
        mob:addMod(dsp.mod.ACC,acc)
        mob:addMod(dsp.mod.DEF,def)
        mob:addMod(dsp.mod.ENMITY,enmity)
    end
end

function doNajiTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local da = 0
    local berserk = 0

    if (player:getVar("CURILLA_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Naji")
        acc = player:getVar("TrustAcc_Naji")
        da = player:getVar("TrustDA_Naji")
        berserk = player:getVar("TrustBerserk_Naji")

        mob:addMod(dsp.mod.ATT,att)
        mob:addMod(dsp.mod.ACC,acc)
        mob:addMod(dsp.mod.DEF,def)
        mob:addMod(dsp.mod.BERSERK_EFFECT,berserk)
    end
end