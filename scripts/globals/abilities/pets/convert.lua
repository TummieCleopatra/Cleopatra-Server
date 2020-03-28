function onAbilityCheck(pet,target,ability)

end;


-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(pet, target, skill, action)

    local MP = pet:getMP()
    local HP = pet:getHP()

    if MP > 0 then
        pet:setHP(MP)
        pet:setMP(HP)
    end

end