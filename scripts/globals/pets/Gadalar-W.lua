-------------------------------------------------
--  TRUST: Gadalar
--  Subjob: BLM
--  JA: None
--  WS: Slice, Shadown of Death, Vorpal Scythe
--      Guillotine,
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hp = mob:getHPP()
    local angle = getAngle(mob)
    local wsCooldown = 4
	local castCooldown = 20
    local berserkCooldown = 300

    mob:setLocalVar("berserkTime",0)
    mob:setLocalVar("castTime",0)
    mob:setLocalVar("wsTime",0)

    mob:addListener("COMBAT_TICK", "GADALAR_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doGadalarWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
    end)

    mob:addListener("COMBAT_TICK", "GADALAR_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        if ((battletime > berserk + berserkCooldown) and lvl >= 50 and mob:getTP() >= 800) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
        end
    end)


	mob:addListener("COMBAT_TICK", "GADALAR_DISTANCE_TICK", function(mob, player, target)
	    local battletime = os.time()
		local castTime = mob:getLocalVar("castTime")
		if (mob:getTP() >= 300 and (battletime > castTime + castCooldown)) then
		    if (target:getHPP() >= 50) then
			    local spell = doGadalarLowSpells(mob)
			else
                local spell = doGadalarSpells(mob)
	        end

            if (spell > 0) then
                mob:castSpell(spell, target)
                mob:setLocalVar("castTime",battletime)
            end
        end
	end)
end


function doGadalarLowSpells(mob)
    local spellList = {{73,146,63},{62,145,26},{38,144,7},{13,144,7}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local finalSpell = 0

    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][3]) then
            finalSpell = spellList[i][2]
            break
        end
    end

    return finalSpell
end

function doGadalarSpells(mob)
    local spellList = {{73,147,135},{62,146,63},{38,145,26},{13,144,7}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local finalSpell = 0

    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][3]) then
            finalSpell = spellList[i][2]
            break
        end
    end

    return finalSpell
end



