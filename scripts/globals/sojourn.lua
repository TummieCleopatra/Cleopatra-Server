require("scripts/globals/status");

function t1Difficulty(mob)

    local instance = mob:getInstance();
    local difficulty = instance:getProgress()
    if (difficulty == 1) then

       -- mob:setMobMod(dsp.mobMod.LVL_INC, 8)
        mob:setMobMod(dsp.mobMod.HP_SCALE,5)
        mob:setLocalVar("Difficulty",1)
        mob:setMobLevel(80)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-87,0,1800)
    elseif (difficulty == 2) then
        mob:setLocalVar("Difficulty",1)
        mob:setMobLevel(82)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-87,0,1800)
    elseif (difficulty == 3) then
        mob:setLocalVar("Difficulty",3)
        mob:setMobLevel(83)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-88,0,1800)
    elseif (difficulty == 4) then
        mob:setLocalVar("Difficulty",4)
        mob:setMobLevel(83)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-75,0,1800)
    elseif (difficulty == 5) then
        mob:setLocalVar("Difficulty",5)
        mob:setMobLevel(84)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-75,0,1800)
    end

end



function t1nmDifficulty(mob)

        mob:setMobLevel(84)
        mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,-55,0,1800)




end


function calculateV1T1Points(mob, player)
    local difficulty = mob:getLocalVar("Difficulty")
    printf("Difficulty is %u", difficulty)
    local points = 0
    local pc = 0
    local party = player:getPartyWithTrusts()
    for i, member in ipairs(party) do
        if (member:getObjType() == dsp.objType.PC) then
            pc = pc + 1
        end
    end

    local bonus = (pc * 3) - 3
    bonus = 1 + (bonus / 100)

    if (difficulty == 1) then
        points = 875 * bonus
    elseif (difficulty == 2) then
        points = 1125 * bonus
    elseif (difficulty == 3) then
        points = 1375 * bonus
    elseif (difficulty == 4) then
        points = 1625 * bonus
    elseif (difficulty == 5) then
        points = 1875 * bonus
    end



    local currentpoints = player:getVar("SojournPointsV1")
    local totalpoints = currentpoints + points

    player:PrintToPlayer("You gain "..points.. " Sojourn Points[Vol.1].  Total: "..totalpoints..".", 0x15);
    player:setVar("SojournPointsV1",totalpoints)
end