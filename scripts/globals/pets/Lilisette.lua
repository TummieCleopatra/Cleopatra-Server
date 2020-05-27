



require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local angle = getAngle(mob)
    local cureCooldown = 16
    local debuffCooldown = 10
    local buffCooldown = 7
    local ailmentCooldown = 15
    local wsCooldown = 4
    mob:setLocalVar("cureTime",0)
    local master = mob:getMaster()
    local accBuff = math.floor(lvl / 1.1)

    mob:setLocalVar("wsTime",0)
    mob:addMod(dsp.mod.HASTE_ABILITY, 2000)
    mob:addMod(dsp.mod.ACC, accBuff)

	mob:addListener("COMBAT_TICK", "LILISETTE_COMBAT_TICK", function(mob, player, target)
	    trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")

        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doLilisetteWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
	end)

    mob:addListener("COMBAT_TICK", "LILISETTE_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")
        local act = mob:getCurrentAction()
        local tp = mob:getTP()


        if (act ~= dsp.act.MAGIC_CASTING) then
            mob:setLocalVar("cureCasting",0)  -- Set this to 0 to mean mob is not or is done casting cures
            -- printf("Done Casting, set cure to 0")
        end

        if ((battletime > cureTime + cureCooldown) and tp > 350) then

            local party = player:getPartyWithTrusts()
            local target = player:getTarget()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 50) then
                    printf("CURE!!!!")
                    mob:useMobAbility(2447)
                    mob:setLocalVar("cureTime",battletime)
                    mob:delTP(350)
                    break
                end
            end
            -- mob:setLocalVar("cureTime",battletime - 12)
        end
    end)
-- 2442 -- 'thorned_dance -- Tanking Def Buff
-- 2443 --'sensual_dance -- AoE Party Attack + 15%
-- 2444--'dancers_fury',
-- 2445 --'whirling_edge'
-- 2446, -- rousing_samba (Crit Rate + 10)
-- 2447  -- vivifying_waltz Divine Waltz II AoE Heal

end


function doLilisetteWeaponskill(mob)
    local wsList = {{75,2444},{75,2445}}
    local newWsList = {}
	local maxws = 2 -- Maximum number of weaponskills to choose from randomly
	local wscount = 0
	local lvl = mob:getMainLvl()
	local finalWS = 0

	for i = 1, #wsList do
		if (lvl >= wsList[i][1]) then
			table.insert(newWsList, wscount + 1, wsList[i][2])
			wscount = wscount + 1
			if (wscount >= maxws) then
				break
			end
		end
	end

	finalWS = newWsList[math.random(1,#newWsList)]
	return finalWS



end

function doLilisetteCure(mob, player)



   -- mob:delTP(400)


end