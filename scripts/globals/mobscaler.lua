-------------------------------------------
-- Mob Scaler
-- This Function scales Notorious Monsters
-- level based on the amount of players present
-- in the party.  Set local variable
-- based on what the expected full level
-- of players needed to fight naturally
-- would be
-------------------------------------------

-------------------------------------------
-- Scale Chart
-- 1 = 1-3 Players
-- 2 = 4-6 Players
-- 3 = 7-9 Players
-- 4 = 10-12 Players
-- 5 = 13-15 Players
-- 6 = 16-18 Players
-------------------------------------------


-----------------------------------
-- mobScaler
-----------------------------------

function mobScaler(mob,target)

	local storedsize = mob:getLocalVar("PartySize");



    currentsize = target:getPartySize(0)
    -- printf("Current Size mobscaler is %u",currentsize)

    partycalc = math.ceil(target:getPartySize(0)/3);


	local sizecalc = math.ceil(currentsize/3);
	local sizediff = 0;
	local newsize = 0;

	if (partycalc ~= storedsize) then -- the two party sizes don't match; adjust
	    sizediff = partycalc - storedsize; -- Find differences between stored and partycalc size
	 -- Apply Difference to mob calculations
	    mob:addMod(dsp.mod.ATT,7*sizediff);
	    mob:addMod(dsp.mod.DEF,20*sizediff);
	    mob:addMod(dsp.mod.ACC,5*sizediff);
	    mob:addMod(dsp.mod.MACC,10*sizediff);
	    mob:addMod(dsp.mod.EVA,10*sizediff);
	    mob:addMod(dsp.mod.INT,10*sizediff);
	    mob:addMod(dsp.mod.CHR,30*sizediff);
	    mob:addMod(dsp.mod.MND,30*sizediff);
	    mob:addMod(dsp.mod.STR,10*sizediff);
		mob:addMod(dsp.mod.UDMGPHYS,-15*sizediff);

     -- set Mob dmg
	    local mobdmg = mob:getWeaponDmg();
		mob:setDamage(mobdmg + (6*sizediff));
		local newdmg = (mobdmg + (6*sizediff));
		printf("Mob damage is: %s",newdmg);


	 -- Store the Party Size
		if (sizecalc == 1) then -- 1-3 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 2) then -- 4-6 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 3) then -- 7-9 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 4) then -- 10-12 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 5) then -- 13-15 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 6) then -- 16-18 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
        end
	end
end



function znmT1Size(mob)
    mob:setLocalVar("PartySize",8);
end

function znmT2Size(mob)
    mob:setLocalVar("PartySize",12);
end

function znmT3Size(mob)
    mob:setLocalVar("PartySize",15);
end

function znmT4Size(mob)
    mob:setLocalVar("PartySize",18);
end



function znmScalerT1(mob,target)

	local storedsize = mob:getLocalVar("PartySize");


	local currentsize = 1
    if (target:getParty() ~= nil) then
       currentsize = target:getPartySize(0);
    end
	local partycalc = math.ceil(target:getPartySize(0)/3);
	local sizecalc = math.ceil(currentsize/3);
	local sizediff = 0;
	local newsize = 0;

	printf("Party Calc is %u",partycalc);
	printf("Stored Size is %u",storedsize);

	if (partycalc ~= storedsize) then -- the two party sizes don't match; adjust
	    sizediff = partycalc - storedsize; -- Find differences between stored and partycalc size
	 -- Apply Difference to mob calculations
	    mob:addMod(dsp.mod.ATT,7*sizediff);
	    mob:addMod(dsp.mod.DEF,20*sizediff);
	    mob:addMod(dsp.mod.ACC,5*sizediff);
	    mob:addMod(dsp.mod.MACC,10*sizediff);
	    mob:addMod(dsp.mod.EVA,10*sizediff);
	    mob:addMod(dsp.mod.INT,10*sizediff);
	    mob:addMod(dsp.mod.CHR,30*sizediff);
	    mob:addMod(dsp.mod.MND,30*sizediff);
	    mob:addMod(dsp.mod.STR,10*sizediff);
		mob:addMod(dsp.mod.UDMGPHYS,-15*sizediff);

     -- set Mob dmg
	    local mobdmg = mob:getWeaponDmg();
		mob:setDamage(mobdmg + (6*sizediff));
		local newdmg = (mobdmg + (6*sizediff));
		printf("Mob damage is: %s",newdmg);


	 -- Store the Party Size
		if (sizecalc == 1) then -- 1-3 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 2) then -- 4-6 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 3) then -- 7-9 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 4) then -- 10-12 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 5) then -- 13-15 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 6) then -- 16-18 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
        end
	end
end



function znmScalerT2(mob,target)

	local storedsize = mob:getLocalVar("PartySize");
	local currentsize = 1
    if (target:getParty() ~= nil) then
       currentsize = target:getPartySize(0);
    end
	local partycalc = math.ceil(target:getPartySize(0)/3);
	local sizecalc = math.ceil(currentsize/3);
	local sizediff = 0;
	local newsize = 0;

	if (partycalc ~= storedsize) then -- the two party sizes don't match; adjust
	    sizediff = partycalc - storedsize; -- Find differences between stored and partycalc size
	 -- Apply Difference to mob calculations
	    mob:addMod(dsp.mod.ATT,7*sizediff);
	    mob:addMod(dsp.mod.DEF,20*sizediff);
	    mob:addMod(dsp.mod.ACC,5*sizediff);
	    mob:addMod(dsp.mod.MACC,10*sizediff);
	    mob:addMod(dsp.mod.EVA,10*sizediff);
	    mob:addMod(dsp.mod.INT,10*sizediff);
	    mob:addMod(dsp.mod.CHR,30*sizediff);
	    mob:addMod(dsp.mod.MND,30*sizediff);
	    mob:addMod(dsp.mod.STR,10*sizediff);
		mob:addMod(dsp.mod.UDMGPHYS,-15*sizediff);

     -- set Mob dmg
	    local mobdmg = mob:getWeaponDmg();
		mob:setDamage(mobdmg + (6*sizediff));
		local newdmg = (mobdmg + (6*sizediff));
		printf("Mob damage is: %s",newdmg);


	 -- Store the Party Size
		if (sizecalc == 1) then -- 1-3 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 2) then -- 4-6 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 3) then -- 7-9 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 4) then -- 10-12 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 5) then -- 13-15 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 6) then -- 16-18 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
        end
	end
end


function znmScalerT3(mob,target)

	local storedsize = mob:getLocalVar("PartySize");
	local currentsize = 1
    if (target:getParty() ~= nil) then
       currentsize = target:getPartySize(0);
    end
	local partycalc = math.ceil(target:getPartySize(0)/3);
	local sizecalc = math.ceil(currentsize/3);
	local sizediff = 0;
	local newsize = 0;

	if (partycalc ~= storedsize) then -- the two party sizes don't match; adjust
	    sizediff = partycalc - storedsize; -- Find differences between stored and partycalc size
	 -- Apply Difference to mob calculations
	    mob:addMod(dsp.mod.ATT,7*sizediff);
	    mob:addMod(dsp.mod.DEF,20*sizediff);
	    mob:addMod(dsp.mod.ACC,5*sizediff);
	    mob:addMod(dsp.mod.MACC,10*sizediff);
	    mob:addMod(dsp.mod.EVA,10*sizediff);
	    mob:addMod(dsp.mod.INT,10*sizediff);
	    mob:addMod(dsp.mod.CHR,30*sizediff);
	    mob:addMod(dsp.mod.MND,30*sizediff);
	    mob:addMod(dsp.mod.STR,10*sizediff);
		mob:addMod(dsp.mod.UDMGPHYS,-15*sizediff);

     -- set Mob dmg
	    local mobdmg = mob:getWeaponDmg();
		mob:setDamage(mobdmg + (6*sizediff));
		local newdmg = (mobdmg + (6*sizediff));
		printf("Mob damage is: %s",newdmg);


	 -- Store the Party Size
		if (sizecalc == 1) then -- 1-3 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 2) then -- 4-6 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 3) then -- 7-9 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 4) then -- 10-12 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 5) then -- 13-15 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 6) then -- 16-18 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
        end
	end
end



function znmScalerT4(mob,target)

	local storedsize = mob:getLocalVar("PartySize");
	local currentsize = 1
    if (target:getParty() ~= nil) then
       currentsize = target:getPartySize(0);
    end
	local partycalc = math.ceil(target:getPartySize(0)/3);
	local sizecalc = math.ceil(currentsize/3);
	local sizediff = 0;
	local newsize = 0;

	if (partycalc ~= storedsize) then -- the two party sizes don't match; adjust
	    sizediff = partycalc - storedsize; -- Find differences between stored and partycalc size
	 -- Apply Difference to mob calculations
	    mob:addMod(dsp.mod.ATT,7*sizediff);
	    mob:addMod(dsp.mod.DEF,20*sizediff);
	    mob:addMod(dsp.mod.ACC,5*sizediff);
	    mob:addMod(dsp.mod.MACC,10*sizediff);
	    mob:addMod(dsp.mod.EVA,10*sizediff);
	    mob:addMod(dsp.mod.INT,10*sizediff);
	    mob:addMod(dsp.mod.CHR,30*sizediff);
	    mob:addMod(dsp.mod.MND,30*sizediff);
	    mob:addMod(dsp.mod.STR,10*sizediff);
		mob:addMod(dsp.mod.UDMGPHYS,-15*sizediff);

     -- set Mob dmg
	    local mobdmg = mob:getWeaponDmg();
		mob:setDamage(mobdmg + (6*sizediff));
		local newdmg = (mobdmg + (6*sizediff));
		printf("Mob damage is: %s",newdmg);


	 -- Store the Party Size
		if (sizecalc == 1) then -- 1-3 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 2) then -- 4-6 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 3) then -- 7-9 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 4) then -- 10-12 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 5) then -- 13-15 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
		elseif (sizecalc == 6) then -- 16-18 Players
		    mob:setLocalVar("PartySize",partycalc);
			printf("Changing Party Size to: %s",partycalc);
        end
	end
end


function znmTherionT1(mob, player, nm)
    local points = 100;
    if (nm == 1) then -- Vulpangue
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Vulpangue_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Vulpangue_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 2) then -- Chamrosh
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Chamrosh_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Chamrosh_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 3) then -- Cheese
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("CheeseHoarder_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("CheeseHoarder_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 4) then -- Brass
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Brass_Borer_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Brass_Borer_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 5) then -- Claret
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Claret_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Claret_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 6) then -- Ob
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Ob_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Ob_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 7) then -- Velionis
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Velionis_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Velionis_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 8) then -- Apkallu
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Apkallu_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Apkallu_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 9) then -- chigre
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Chigre_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Chigre_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    end

end


function znmTherionT2(mob, player, nm)
    local points = 250;
    if (nm == 10) then -- Iriz
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Iriz_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Iriz_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 11) then -- Iriri
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Iriri_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Iriri_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 12) then -- Lividroot
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Lividroot_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Lividroot_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 13) then -- Anantaboga
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Anantaboga_Borer_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Anantaboga_Borer_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 14) then -- Reacton
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Reacton_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Reacton_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 15) then -- Dextrose
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Dextrose_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Dextrose_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 16) then -- Zareehkl
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Zareehkl_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Zareehkl_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 17) then -- Verdelet
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Verdelet_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Verdelet_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 18) then -- Wulgaru
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Wulgaru_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Wulgaru_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    end

end


function znmTherionT3(mob, player, nm)
    local points = 500;
    if (nm == 19) then -- Armed
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Armed_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Armed_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 20) then -- Gotah
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Gotah_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Gotah_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 21) then -- Dea
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Dea_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Dea_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 22) then -- Nosferatu
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Nosferatu_Borer_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Nosferatu_Borer_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 23) then -- Khrom
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Khrom_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Khrom_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 24) then -- Achamoth
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Achamoth_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Achamoth_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 25) then -- Mahjlaef
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Mahjlaef_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Mahjlaef_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 26) then -- Experimental
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Experimental_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Experimental_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 27) then -- Nuhn
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Nuhn_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Nuhn_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    end

end



function znmTherionT4(mob, player, nm)
    local points = 500;
    if (nm == 28) then -- Tinnin
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Tinnin_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Tinnin_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 29) then -- Sarameya
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Sarameya_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Sarameya_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
    elseif (nm == 30) then -- Tyger
        if (player:getObjType() ~= dsp.objType.PC) then
            local master = player:getMaster();
            master:setVar("Tyger_Win",1);
            master:addCurrency("therion_ichor",points);
            master:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
	    else
            player:setVar("Tyger_Win",1);
            player:addCurrency("therion_ichor",points);
            player:PrintToPlayer("You obtain "..points.." Therion Ichor.", 0x15);
        end
	end
end



