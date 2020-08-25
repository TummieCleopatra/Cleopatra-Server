-----------------------------------
--	Area: Port Bastok
--	NPC:  Greeter Moogle
--  Rewards for ZNM Paragon Chapter 3 Path 3
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
local ID = require("scripts/zones/Port_Bastok/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    local therion = player:getCurrency("therion_ichor");
    -- First lets see what wins the player has
    local t1nm1 = player:getVar("Velionis_Win");
	local t1nm2 = player:getVar("Apkallu_Win");
	local t1nm3 = player:getVar("Chigre_Win");

    local t2nm1 = player:getVar("Zareehkl_Win");
    local t2nm2 = player:getVar("Verdelet_Win");
    local t3nm3 = player:getVar("Wulgaru_Win");

    local t3nm1 = player:getVar("Mahjlaef_Win");
    local t3nm2 = player:getVar("Experimental_Win");
    local t3nm3 = player:getVar("Nuhn_Win");

    local t4nm1 = player:getVar("Tyger_Win");

    if ((t1nm1 == 1) or (t1nm2 == 1) or (t1nm3 == 1) or (t2nm1 == 1) or (t2nm2 == 1) or
	    (t2nm3 == 1) or (t3nm1 == 1) or (t3nm2 == 1) or (t3nm3 == 1) or (t4nm1 == 1)) then
		player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	    player:startEvent(0x1a9,10,therion,5000,10000,15000,25000,170,0);
	else
	    player:PrintToPlayer("Greeter Moogle : Sorry, I can't help you at this time.", 0xD);
	end
end






-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);

  -- Menu 1
    local m1a1 = 613;
	local m1a2 = 613;
	local m1a3 = 613;
	local m1a4 = 613;
	local m1a5 = 613;
	local m1a6 = 613;
	local m1a7 = 613;
	local m1a8 = 613;
	local m1a9 = 613;
	local m1a10 = 613;

  -- Menu 1
    local m2a1 = 613;
	local m2a2 = 613;
	local m2a3 = 613;
	local m2a4 = 613;
	local m2a5 = 613;
	local m2a6 = 613;
	local m2a7 = 613;
	local m2a8 = 613;
	local m2a9 = 613;
	local m2a10 = 613;

  -- Menu 1
    local m3a1 = 613;
	local m3a2 = 613;
	local m3a3 = 613;
	local m3a4 = 613;
	local m3a5 = 613;
	local ma6 = 613;
	local m31a7 = 613;
	local m3a8 = 613;
	local m3a9 = 613;
	local m3a10 = 613;

  -- Menu 1
    local m4a1 = 613;
	local m4a2 = 613;
	local m4a3 = 613;
	local m4a4 = 613;
	local m4a5 = 613;
	local m4a6 = 613;
	local m4a7 = 613;
	local m4a8 = 613;
	local m4a9 = 613;
	local m4a10 = 613;

-- First lets see what wins the player has
    local t1nm1 = player:getVar("Velionis_Win");
	local t1nm2 = player:getVar("Apkallu_Win");
	local t1nm3 = player:getVar("Chigre_Win");

    local t2nm1 = player:getVar("Zareehkl_Win");
    local t2nm2 = player:getVar("Verdelet_Win");
    local t3nm3 = player:getVar("Wulgaru_Win");

    local t3nm1 = player:getVar("Mahjlaef_Win");
    local t3nm2 = player:getVar("Experimental_Win");
    local t3nm3 = player:getVar("Nuhn_Win");

    local t4nm1 = player:getVar("Tyger_Win");


	if (t1nm1 == 1) then
	    m1a1 = 18950;  -- White Joker
        m1a2 = 15916;  -- Corsair's Belt
	    m1a3 = 2636;   -- Velionis Bone
	end

	if (t1nm2 == 1) then
	    m1a4 = 11368;  -- Hake Habaki
	    m1a5 = 11369;  -- Numerist Pumps
		m1a6 = 2637;   -- Lil Apkallu Egg
	end

	if (t1nm3 == 1) then
	    m1a7 = 15828;  -- Blood Ring
	    m1a8 = 15827;  -- Insect Ring
		m1a9 = 2602;   -- Spoilt Blood
	end

	-- Tier II
	if (t2nm1 == 1) then
	    m2a1 = 19108;  -- Zareehkl Jambiya
        m2a2 = 18949;  -- Zareehkl Scythe
	    m2a3 = 2634;   -- Zareehkls Necklace
	end

	if (t2nm2 == 1) then
	    m2a4 = 16175;  -- Muse Tariqah
	    m2a5 = 16239;  -- Solitaire Cape
		m2a6 = 2635;   -- Verdlet
	end

	if (t2nm3 == 1) then
	    m2a7 = 16174;  -- Riot Shield
	    m2a8 = 16152;  -- Hissho Hachimaki
		m2a9 = 2633;   -- Wulgaru's Head
	end

	-- Tier III
	if (t3nm1 == 1) then
	    m3a1 = 16177;  -- Legion Scutum
        m3a2 = 15021;  -- Aurum Gauntlets
	    m3a3 = 16342;  -- Oracle's Braconi

	end

	if (t3nm2 == 1) then
	    m3a4 = 18595;  -- Mekki Shakki
	    m3a5 = 16341;  -- Aurum Cuisses
		m3a6 = 11378;  -- Enkidu's Leggins
	end

	if (t3nm3 == 1) then
	    m3a7 = 18430;  -- Oninochocho
	    m3a8 = 15023;  -- Enkidu's Mittens
		m3a9 = 11377;  -- Oracle's Pigaches
	end

	if (t3nm1 == 1 and t3nm2 == 1 and t3nm3 == 1) then
		m3a10 = 2593; -- Singed Buffalo
	end

	-- Tier IV
	if (t4nm1 == 1) then
	    m4a1 = 18857;  -- Antares
        m4a2 = 18948;  -- Enforcer
	    m4a3 = 16155;  -- Aurum Armet
	    m4a4 = 16157;  -- Enkidu's Cap
	    m4a5 = 16341;  -- Aurum Cuisse*
		m4a6 = 15015;  -- Hachiryu Kote
	    m4a7 = 2371;  -- Khimaria Horn
	    m4a8 = 2372;  -- Khimaria Mane
		m4a9 = 2373;  -- Khimaria Tail
		m4a10 = 2629;  -- Tyger's Tail
	end

 -- Choice 1
	if (option == 1) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 2) then
	   player:updateEvent(m1a9,m1a10,699050,5000);
	end

 -- Choice 2
	if (option == 9) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,m2a7,m2a8);
	end

	if (option == 10) then
	   player:updateEvent(m2a9,m2a10,699050,10000);
	end

 -- Choice 3
	if (option == 17) then
	    player:updateEvent(m3a1,m3a2,m3a3,m3a4,m3a5,m3a6,m3a7,m3a8);
	end

	if (option == 18) then
	   player:updateEvent(m3a9,m3a10,699050,15000);
	end

  -- Choice 4
	if (option == 25) then
	    player:updateEvent(m4a1,m4a2,m4a3,m4a4,m4a5,m4a6,m4a7,m4a8);
	end

	if (option == 26) then
	   player:updateEvent(m4a9,m4a10,699050,25000);
	end

 -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- T1_NM1
    if (option == 2051) and (t1nm1 == 1) then
	    if (player:hasItem(m1a1) == false) then
           player:addItem(m1a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a1,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t1nm1 == 1) then
	    if (player:hasItem(m1a2) == false) then
           player:addItem(m1a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a2,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t1nm1 == 1) then
	    if (player:hasItem(m1a3) == false) then
           player:addItem(m1a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a3,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T1_NM2 --
    elseif (option == 2243) and (t1nm2 == 1) then
	    if (player:hasItem(m1a4) == false) then
           player:addItem(m1a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a4,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t1nm2 == 1) then
	    if (player:hasItem(m1a5) == false) then
           player:addItem(m1a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a5,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t1nm2 == 1) then
	    if (player:hasItem(m1a6) == false) then
           player:addItem(m1a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a6,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T1_NM3

    elseif (option == 2435) and (t1nm3 == 1) then
	    if (player:hasItem(m1a7) == false) then
           player:addItem(m1a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a7,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t1nm3 == 1) then
	    if (player:hasItem(m1a8) == false) then
           player:addItem(m1a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a8,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t1nm3 == 1) then
	    if (player:hasItem(m1a9) == false) then
           player:addItem(m1a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a9,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t1nm3 == 1) then
	    if (player:hasItem(m1a10) == false) then
           player:addItem(m1a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a10,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T2_NM1
    if (option == 2051) and (t2nm1 == 1) then
	    if (player:hasItem(m2a1) == false) then
           player:addItem(m2a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a1,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t2nm1 == 1) then
	    if (player:hasItem(m2a2) == false) then
           player:addItem(m2a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a2,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t2nm1 == 1) then
	    if (player:hasItem(m2a3) == false) then
           player:addItem(m2a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a3,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T2_NM2 --
    elseif (option == 2243) and (t2nm2 == 1) then
	    if (player:hasItem(m2a4) == false) then
           player:addItem(m2a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a4,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t2nm2 == 1) then
	    if (player:hasItem(m2a5) == false) then
           player:addItem(m2a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a5,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t2nm2 == 1) then
	    if (player:hasItem(m2a6) == false) then
           player:addItem(m2a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a6,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T2_NM3

    elseif (option == 2435) and (t2nm3 == 1) then
	    if (player:hasItem(m2a7) == false) then
           player:addItem(m2a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a7,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t2nm3 == 1) then
	    if (player:hasItem(m2a8) == false) then
           player:addItem(m2a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a8,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t2nm3 == 1) then
	    if (player:hasItem(m2a9) == false) then
           player:addItem(m2a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a9,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t2nm3 == 1) then
	    if (player:hasItem(m2a10) == false) then
           player:addItem(m2a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a10,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T3_NM1
    if (option == 2051) and (t3nm1 == 1) then
	    if (player:hasItem(m3a1) == false) then
           player:addItem(m3a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a1,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t3nm1 == 1) then
	    if (player:hasItem(m3a2) == false) then
           player:addItem(m3a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a2,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t3nm1 == 1) then
	    if (player:hasItem(m3a3) == false) then
           player:addItem(m3a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a3,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T3_NM2 --
    elseif (option == 2243) and (t3nm2 == 1) then
	    if (player:hasItem(m3a4) == false) then
           player:addItem(m3a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a4,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t3nm2 == 1) then
	    if (player:hasItem(m3a5) == false) then
           player:addItem(m3a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a5,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t3nm2 == 1) then
	    if (player:hasItem(m3a6) == false) then
           player:addItem(m3a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a6,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T3_NM3

    elseif (option == 2435) and (t3nm3 == 1) then
	    if (player:hasItem(m3a7) == false) then
           player:addItem(m3a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a7,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t3nm3 == 1) then
	    if (player:hasItem(m3a8) == false) then
           player:addItem(m3a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a8,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t3nm3 == 1) then
	    if (player:hasItem(m3a9) == false) then
           player:addItem(m3a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a9,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t3nm3 == 1) then
	    if (player:hasItem(m3a10) == false) then
           player:addItem(m3a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a10,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T4_NM
    if (option == 2075) and (t4nm1 == 1) then
	    if (player:hasItem(m4a1) == false) then
           player:addItem(m4a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a1,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2075) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2139) and (t4nm1 == 1) then
	    if (player:hasItem(m4a2) == false) then
           player:addItem(m4a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a2,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2139) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (t4nm1 == 1) then
	    if (player:hasItem(m4a3) == false) then
           player:addItem(m4a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a3,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (t4nm1 == 1) then
	    if (player:hasItem(m4a4) == false) then
           player:addItem(m4a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a4,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2331) and (t4nm1 == 1) then
	    if (player:hasItem(m4a5) == false) then
           player:addItem(m4a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a5,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2331) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (t4nm1 == 1) then
	    if (player:hasItem(m4a6) == false) then
           player:addItem(m4a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a6,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (t4nm1 == 1) then
	    if (player:hasItem(m4a7) == false) then
           player:addItem(m4a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a7,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (t4nm1 == 1) then
	    if (player:hasItem(m4a8) == false) then
           player:addItem(m4a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a8,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2587) and (t4nm1 == 1) then
	    if (player:hasItem(m4a9) == false) then
           player:addItem(m4a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a9,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2587) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2651) and (t4nm1 == 1) then
        printf("GOOD")
	    if (player:hasItem(m4a10) == false) then
           player:addItem(m4a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a10,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2651) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
           player:stopEvent()
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);
end;