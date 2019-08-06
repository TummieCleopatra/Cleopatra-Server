-----------------------------------
--
--  dsp.effect.CUSTOM_EFFECT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    printf("TIIIICK")
    local tickCount = effect:getTickCount()
    local jpmid = getMidnight()
    printf("Tick Count is %u",tickCount)
    local FreeSlots = target:getFreeSlotsCount();


    if (effect:getTickCount() == 3) then
        if (FreeSlots >= 1) then
            local plutons = 0
            local item = 0
            local alex = 0
            local seals = 0
            local diceroll = math.random(1,105)
            printf("Diceroll is %u",diceroll)
            target:PrintToPlayer("Cleopatra Server Anniversary Bonus",0x1F)
            if (diceroll < 20) then
                plutons = math.random(10,20)
                target:addItem(4059,plutons)
                target:messageBasic(693,4059)
            elseif (diceroll < 40) then
                alex = math.random(50,99)
                target:addItem(2488,alex)
                target:messageBasic(693,alex)
            elseif (diceroll < 70) then
                local rareroll = math.random(1,4)
                local rarelist = {{1,15515},{2,15224},{3,15351},{4,14986}}
                for i = 1, #rarelist do
                    if (rareroll == rarelist[i][1]) then
                        item = rarelist[i][2]
                        break
                    end
                end
                target:addItem(item,1)
                target:messageBasic(693,item)
            elseif (diceroll < 80) then
                seals = math.random(1404,1407)
                target:addItem(seals,1)
                target:messageBasic(693,seals)
            elseif (diceroll < 90) then
                local money = math.random(1,3)
                local moneylist = {{1,1450},{2,1453},{3,1456}}
                for i = 1, #moneylist do
                    if (money == moneylist[i][1]) then
                        item = moneylist[i][2]
                        break
                    end
                end
                local qty = math.random(1,4)
                target:addItem(item,qty)
                target:messageBasic(693,item)
            elseif (diceroll < 100) then
                local rareroll = math.random(1,6)
                local rarelist = {{1,1325},{2,1320},{3,1315},{4,1430},{5,1330},{6,1335}}
                for i = 1, #rarelist do
                    if (rareroll == rarelist[i][1]) then
                        item = rarelist[i][2]
                        break
                    end
                end
                target:addItem(item,1)
                target:messageBasic(693,item)
            else
                local rareroll = math.random(1,6)
                local rarelist = {{1,11281},{2,15458},{3,1315},{4,1430},{5,1330},{6,1335}}
                for i = 1, #rarelist do
                    if (rareroll == rarelist[i][1]) then
                        item = rarelist[i][2]
                        break
                    end
                end
                target:addItem(item,1)
                target:messageBasic(693,item)
            end
        --[[
        1456 -- 100 Byne
        1453 -- Montiont Silverpiece
        1450 -- L Jadeshell
        2488 -- Alexandrite
        4059 -- Pluton
        1404 -- Seal of Genbu
        1405 -- SEal of Syrieu
        1406 -- Seal of Byakko
        1407 -- Suza
        1325 -- Dalmatica Body
        1320 -- Earthen Abjuration Body
        1315 -- Dryatic Abjuration
        1430 -- Neptunal
        1330 -- PLD abj
        1335 -- Wyrmal
        15515 -- PCA
        15224 -- Empress Hairpin
        15351 -- Bounding Boots
        14986 -- Ochi Kote]]--
        target:setVar("loginDay",jpmid)

        else
            target:PrintToPlayer("Unable to receive special bonus.  Please sort your inventory and login again",0xD)
        end
        target:delStatusEffectSilent(dsp.effect.CUSTOM_EFFECT)
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;