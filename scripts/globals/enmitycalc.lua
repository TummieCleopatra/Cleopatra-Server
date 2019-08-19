-----------------------------------
--
-- ENMITY CALCULATION
--
-----------------------------------

function enmityCalc(mob, player, target)

    local trustID = mob:getID()
    local trustEnmity = 0
    local party = player:getParty()
    local ce = 0
    local ve = 0
    local total = 0
    local highest = 0
    local highestID = 0
    local diff = 0
    local enmityList = {}

    for i, member in ipairs(party) do
        ce = target:getCE(member)
        ve = target:getVE(member)
        total = ve + ce
        local id = member:getID()
        if (id == trustID) then
            -- printf("Trust Enmity ID Triggered")
            -- printf("CE is %u \n",ce)
            -- printf("VE is %u \n",ve)
            -- printf("New Total is %u \n",total)
            trustEnmity = total
        end

        table.insert(enmityList, i, {total, id})
    end

    -- printf("Trust Total Enmity is %u \n",trustEnmity)

    for i, v in pairs(enmityList) do
        if (v[1] > highest) then
            highest = v[1]
            highestID = v[2]
        end
    end

    if (trustID ~= highestID) then
        -- printf("Trust Enmity is: %u \n",trustEnmity)
        -- printf("Highest Enmity is: %u \n",highest)
        diff = (highest - trustEnmity)
        -- printf("HATE LEVEL DIFF IS: %u \n",diff)
    else
        diff = 0
        -- printf("Trust Enmity is: %u \n",trustEnmity)
        -- printf("Highest Enmity is: %u \n",highest)
        -- printf("TRUST HAS HATE!! DIFF IS: %u \n",diff)
    end

    return diff
end
