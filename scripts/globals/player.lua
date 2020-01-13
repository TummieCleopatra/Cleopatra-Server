require("scripts/globals/gear_sets")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/teleports")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------

local startingRaceInfo =
{
    [dsp.race.HUME_M]   = {gear = {body = 12631, hand = 12754, leg = 12883, feet = 13005}, homeNation = dsp.nation.BASTOK},
    [dsp.race.HUME_F]   = {gear = {body = 12632, hand = 12760, leg = 12884, feet = 13010}, homeNation = dsp.nation.BASTOK},
    [dsp.race.ELVAAN_M] = {gear = {body = 12633, hand = 12755, leg = 12885, feet = 13006}, homeNation = dsp.nation.SANDORIA},
    [dsp.race.ELVAAN_F] = {gear = {body = 12634, hand = 12759, leg = 12889, feet = 13011}, homeNation = dsp.nation.SANDORIA},
    [dsp.race.TARU_M]   = {gear = {body = 12635, hand = 12756, leg = 12886, feet = 13007}, homeNation = dsp.nation.WINDURST},
    [dsp.race.TARU_F]   = {gear = {body = 12635, hand = 12756, leg = 12886, feet = 13007}, homeNation = dsp.nation.WINDURST},
    [dsp.race.MITHRA]   = {gear = {body = 12636, hand = 12757, leg = 12887, feet = 13008}, homeNation = dsp.nation.WINDURST},
    [dsp.race.GALKA]    = {gear = {body = 12637, hand = 12758, leg = 12888, feet = 13009}, homeNation = dsp.nation.BASTOK},
}

local startingNationInfo =
{
    [dsp.nation.SANDORIA] = {ring = 13495, map = dsp.ki.MAP_OF_THE_SAN_DORIA_AREA},
    [dsp.nation.BASTOK]   = {ring = 13497, map = dsp.ki.MAP_OF_THE_BASTOK_AREA},
    [dsp.nation.WINDURST] = {ring = 13496, map = dsp.ki.MAP_OF_THE_WINDURST_AREA},
}

local startingJobGear =
{
    [dsp.job.WAR] = {16534},       -- onion sword
    [dsp.job.MNK] = {13184},       -- white belt
    [dsp.job.WHM] = {17068, 4608}, -- onion rod, scroll of cure
    [dsp.job.BLM] = {17104, 4607}, -- onion staff, scroll of stone
    [dsp.job.RDM] = {16482, 4606}, -- onion dagger, scroll of dia
    [dsp.job.THF] = {16483},       -- onion knife
}

-----------------------------------
-- local functions
-----------------------------------

local function CharCreate(player)
    local race = player:getRace()
    local raceInfo = startingRaceInfo[race]
    local nation = player:getNation()
    local nationInfo = startingNationInfo[nation]

    -- add race-specific starting gear
    for _, v in pairs(raceInfo.gear) do
        if not player:hasItem(v) then
            player:addItem(v)
            player:equipItem(v)
        end
    end

    -- add job-specific starting gear
    for _, v in pairs(startingJobGear[player:getMainJob()]) do
        if not player:hasItem(v) then
            player:addItem(v)
        end
    end

    -- add nation-specific map
    player:addKeyItem(nationInfo.map)

    -- add nation- and race-specific ring
    if nation == raceInfo.homeNation and not player:hasItem(nationInfo.ring) then
        player:addItem(nationInfo.ring)
    end

    -- unlock advanced jobs
    if ADVANCED_JOB_LEVEL == 0 then
        for i = dsp.job.PLD, dsp.job.SCH do
            player:unlockJob(i)
        end
    end

    -- unlock subjob
    if SUBJOB_QUEST_LEVEL == 0 then
        player:unlockJob(0)
    end

    -- give all maps
    if ALL_MAPS == 1 then
        for i = dsp.ki.MAP_OF_THE_SAN_DORIA_AREA, dsp.ki.MAP_OF_DIO_ABDHALJS_GHELSBA do
            player:addKeyItem(i)
        end
        for i = dsp.ki.MAP_OF_AL_ZAHBI, dsp.ki.MAP_OF_OUTER_RAKAZNAR do
            player:addKeyItem(i)
        end
        for i = dsp.ki.MAP_OF_RALA_WATERWAYS_U, dsp.ki.MAP_OF_OUTER_RAKAZNAR_U do
            player:addKeyItem(i)
        end
        for i = dsp.ki.MAP_OF_ESCHA_ZITAH, dsp.ki.MAP_OF_REISENJIMA do
            player:addKeyItem(i)
        end
    end

    -- set initial level cap
    if INITIAL_LEVEL_CAP ~= 50 then
        player:levelCap(INITIAL_LEVEL_CAP)
    end

    -- increase starting inventory
    if START_INVENTORY > 30 then
        player:changeContainerSize(dsp.inv.INVENTORY, START_INVENTORY - 30)
        player:changeContainerSize(dsp.inv.MOGSATCHEL, START_INVENTORY - 30)
    end


    --[[
        For some intermittent reason m_ZoneList ends up empty on characters, which is
        possibly also why they lose key items.  When that happens, CharCreate will be run and
        they end up losing their gil to the code below.  Added a conditional to hopefully
        prevent that until the bug is fixed.  Used the if instead of addGil to prevent abuse
        on servers with very high values of START_GIL, I guess.
    --]]

    if player:getGil() < START_GIL then
       player:setGil(START_GIL)
    end

    player:addItem(536) -- adventurer coupon
    player:addTitle(dsp.title.NEW_ADVENTURER)
    player:setVar("MoghouseExplication", 1) -- needs Moghouse intro
    player:setNewPlayer(true) -- apply new player flag
end

-----------------------------------
-- public functions
-----------------------------------

-- called by core after a player logs into the server or zones
function onGameIn(player, firstLogin, zoning)
    player:setVar("restingLogin", os.time());
    local playsession = player:getVar("RestPlaySession");
    local logintime = player:getVar("restingLogin");
    local lastlogin = player:getVar("logoutRestStart");
    local loginok = player:getVar("logoutOK");
    local bonus = 0;

    if not zoning then
        -- things checked ONLY during logon go here
        if firstLogin then
            CharCreate(player)
        end

        --[[
        local jpmid = getMidnight()
        local loginday = player:getVar("loginDay")
        printf("Midnight is %u",jpmid)
        if (loginday < jpmid) then
            printf("GIFT TRIGGERED!!!!!")
            player:addStatusEffect(dsp.effect.CUSTOM_EFFECT,0,3,12)
        end --]]
        -- Check for Besieged if player is logging into the zone

		if (player:getObjType() == dsp.objType.PC) then
        	player:addMod(dsp.mod.RERAISE_III,1);
	    end

        -- Login Message... Logout message handled in Core
        if (player:getObjType() == dsp.objType.PC) then
		    player:PrintToServer(string.format("%s has logged in...", player:getName()), 0x1C);
		end


        if ((player:hasStatusEffect(dsp.effect.RESTING_BONUS) == false) and loginok == 1) then
			if ((logintime - lastlogin) >= 39600) then  --39600 is 11 hours
                bonus = math.floor((logintime - lastlogin) / 3600)
                if (bonus <= 24 and bonus >= 2) then
                   -- bonus =  bonus + 1
				   bonus = math.floor(bonus * 4.2)

                elseif (bonus >= 25) then
                   -- bonus =  math.floor(bonus * 2.6)
				   bonus = math.floor(bonus * 5.2)
                end

				if (bonus >= 250) then
				    bonus = 250; -- cap bonus at 150%
				end

			    player:setVar("RestExp",bonus)
			    player:addStatusEffectEx(dsp.effect.RESTING_BONUS,dsp.effect.DEDICATION,bonus,0,86400,0,20000)
                player:setVar("logoutOK",0)
			else
                local minutes = (logintime - lastlogin) / 60
                printf("No login bonu.  Logout time: %u minutes",minutes)
            end
		end

        local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
        if (undead == 3 and player:getZone() == 48) then
            -- apply besieged effect
            player:addStatusEffect(dsp.effect.BESIEGED,0,3,3600);
        end

        if (player:hasStatusEffect(dsp.effect.BESIEGED) and player:getZone() ~= 48) then
            player:delStatusEffect(dsp.effect.BESIEGED)
        end




    else
        -- things checked ONLY during zone in go here
        local prevZone = player:getPreviousZone()
        if (prevZone == 48) then
            player:delStatusEffect(dsp.effect.BESIEGED)
        end

        if (prevZone >=73 and prevZone <= 76) then
           player:delStatusEffect(dsp.effect.LEVEL_RESTRICTION)
        end


    -- apply mods from gearsets (scripts/globals/gear_sets.lua)
    checkForGearSet(player)

    -- Feretory
    if (player:getObjType() == dsp.objType.PC) then
        local plvl = player:getMainLvl();
	    local boonpower = player:getVar("FerretoryMageBoonPower");
	    local plvl = player:getMainLvl();
	    local plvladj = (math.floor((plvl - 1) / 10));
	    if (boonpower > (plvladj)) then
	        boonpower = plvladj;
	    else
	        boonpower = boonpower;
	    end

	    local mabboon = (math.floor(boonpower * 1.43));
	    local fcboon = (math.floor((boonpower * 0.5) -1));
	    local maccboon = boonpower;
	    local curepotboon = (boonpower - 4);
	    if (curepotboon < 0) then
		    curepotboon = 0;
	    end

	    player:addMod(dsp.mod.MATT,mabboon);
	    player:addMod(dsp.mod.MACC,maccboon);
	    player:addMod(dsp.mod.CURE_POTENCY,curepotboon);

        -- Melee Boons
	    local meleeboonpower = player:getVar("FerretoryMeleeBoonPower");
	    local plvladj1 = (math.floor((plvl - 1) / 10));
	    if (meleeboonpower > (plvladj1)) then
            meleeboonpower = plvladj1;
	    else
	        meleeboonpower = meleeboonpower;
	    end

	    local attboon = (math.floor(meleeboonpower * 1.5));
	    local rattboon = (math.floor(meleeboonpower * 1.5));
	    local accboon = (math.floor(meleeboonpower * 1.5));
        local storetpboon = (math.floor((meleeboonpower * 0.5) - 1));
	    if (storetpboon < 0) then
	        storetpboon = 0;
	    end

        player:addMod(dsp.mod.ATT,attboon);
	    player:addMod(dsp.mod.RATT,rattboon);
	    player:addMod(dsp.mod.ACC,accboon);
	    player:addMod(dsp.mod.RACC,accboon);
        player:addMod(dsp.mod.STORETP,storetpboon);
    end

    -- god mode
    if player:getVar("GodMode") == 1 then
        player:addStatusEffect(dsp.effect.MAX_HP_BOOST,1000,0,0)
        player:addStatusEffect(dsp.effect.MAX_MP_BOOST,1000,0,0)
        player:addStatusEffect(dsp.effect.MIGHTY_STRIKES,1,0,0)
        player:addStatusEffect(dsp.effect.HUNDRED_FISTS,1,0,0)
        player:addStatusEffect(dsp.effect.CHAINSPELL,1,0,0)
        player:addStatusEffect(dsp.effect.PERFECT_DODGE,1,0,0)
        player:addStatusEffect(dsp.effect.INVINCIBLE,1,0,0)
        player:addStatusEffect(dsp.effect.ELEMENTAL_SFORZO,1,0,0)
        player:addStatusEffect(dsp.effect.MANAFONT,1,0,0)
        player:addStatusEffect(dsp.effect.REGAIN,300,0,0)
        player:addStatusEffect(dsp.effect.REFRESH,99,0,0)
        player:addStatusEffect(dsp.effect.REGEN,99,0,0)
        player:addMod(dsp.mod.RACC,2500)
        player:addMod(dsp.mod.RATT,2500)
        player:addMod(dsp.mod.ACC,2500)
        player:addMod(dsp.mod.ATT,2500)
        player:addMod(dsp.mod.MATT,2500)
        player:addMod(dsp.mod.MACC,2500)
        player:addMod(dsp.mod.RDEF,2500)
        player:addMod(dsp.mod.DEF,2500)
        player:addMod(dsp.mod.MDEF,2500)
        player:addHP(50000)
        player:setMP(50000)
    end

    -- !hide
    if player:getVar("GMHidden") == 1 then
        player:setGMHidden(true)
    end

    -- remember time player zoned in (e.g., to support zone-in delays)
    player:setLocalVar("ZoneInTime", os.time())
end

function onPlayerLevelUp(player)
end

function onPlayerLevelDown(player)
end
