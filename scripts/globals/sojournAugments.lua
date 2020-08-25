
local SOJOURN_AUG_CAP = 6

-- Augments = {{Def, Multiplier},{Aug2, Multiplier},{Aug3, Mulitplier},{Aug4, Multiplier}}

local shuraHeadAug = {{33,2.67},{23,2.70},{49,0.80},{41,0.40}}
local shuraBodyAug = {{33,3.83},{23,1.40},{49,0.40},{143,0.40}}
local shuraHandsAug = {{33,2.33},{25,3.20},{49,0.50},{145,0.40}}
local shuraLegsAug = {{33,3.33},{25,3.30},{49,0.60},{142,0.70}}
local shuraFeetAug = {{33,2.00},{23,2.70},{49,0.40},{195,0.70}}


local shuraHead = 13934
local shuraHeadHQ = 13935
local shuraBody = 14387
local shuraHands = 14821
local shuraLegs = 14303
local shuraFeet = 14184

local equipV1 = 8961
local equipV2 = 8961
local equipV3 = 8961
local equipV4 = 8961
local equipV5 = 8961
local equipV6 = 8961

-- NOTES
-- Need a way to distinguish which rock being traded for future sojourns

function shuraHeadTrade(player, trade)
    local quality = 1
    local rank = player:getVar("shuraHeadRank")

    if (trade:hasItemQty(shuraHeadHQ,1)) then
        quality = 0
    end

    if ((trade:hasItemQty(equipV1,1) and rank > 0) or (trade:hasItemQty(equipV2,1) and rank > 1) or (trade:hasItemQty(equipV3,1) and rank > 2) or (trade:hasItemQty(equipV4,1) and rank > 3) or (trade:hasItemQty(equipV5,1) and rank > 4) or (trade:hasItemQty(equipV6,1) and rank > 5)) then
        player:PrintToPlayer("Shelly: I cannot augment that item any further at this time",0xD)
    else
        rank = rank + 1
        player:setVar("shuraHeadRank",rank)
        local aug1 = 0
        local val1 = 0
        local aug2 = 0
        local val2 = 0
        local aug3 = 0
        local val3 = 0
        local aug4 = 0
        local val4 = 0

        for i=1, #shuraHeadAug do
            if (i == 1) then
                aug1 = shuraHeadAug[i][1]
                val1 = math.floor((shuraHeadAug[i][2] * rank) - quality)
                if (val1 < 0) then
                    val1 = 0
                end
            elseif (i == 2) then
                aug2 = shuraHeadAug[i][1]
                val2 = math.floor((shuraHeadAug[i][2] * rank) - quality)
                if (val2 < 0) then
                    val2 = 0
                end
            elseif (i == 3) then
                aug3 = shuraHeadAug[i][1]
                val3 = math.floor((shuraHeadAug[i][2] * rank) - quality)
                if (val3 < 0) then
                    val3 = 0
                end
            elseif (i == 4) then
                aug4 = shuraHeadAug[i][1]
                val4 = math.floor((shuraHeadAug[i][2] * rank) - quality)
                if (val4 < 0) then
                    val4 = 0
                end
            end
        end
        player:tradeComplete()
        player:PrintToPlayer("Shelly: Here you go, enjoy your new Shura Kabuto!",0xD)
        player:addItem(shuraHead,1,aug1,val1,aug2,val2,aug3,val3,aug4,val4)
    end
end