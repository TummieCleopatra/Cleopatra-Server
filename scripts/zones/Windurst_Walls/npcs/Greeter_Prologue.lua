-----------------------------------
--	Area: Windurst Walls
--	NPC:  Greeter Moogle
--	Working 100%
--  Prologue - Land Kings
-----------------------------------

require("scripts/globals/settings");
local ID = require("scripts/zones/Windurst_Walls/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local prestige = player:getCurrency("prestige");
    -- First lets see what wins the player has
    local fafnir = player:getVar("Fafnir_Win");
	local nidhogg = player:getVar("Nidhogg_Win");

	local adamantoise = player:getVar("Adamantoise_Win");
	local aspi = player:getVar("Aspi_Win");

	local behe = player:getVar("Behemoth_Win");
	local kb = player:getVar("King_Behemoth_Win");
	local moogle = player:getVar("Kupo_Paragon");


	if (moogle == 1) then
	if ((fafnir == 1) or (nidhogg == 1) or (adamantoise == 1) or (aspi == 1) or (behe == 1) or (kb == 1)) then
	player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	player:startEvent(0x210,10,prestige,1000,5000,10000,0,234,0);
	else
	player:PrintToPlayer("Greeter Moogle : Sorry, I can't help you at this time.", 0xD);
	end
	else
	player:PrintToPlayer("Greeter Moogle : Sorry, I can't help you at this time.", 0xD);
	end


	-- player:PrintToPlayer("Daruru : Here you go, enjoy your new weapon!", 0xD);

	-- Find the other numbers!!!!
	-- 191 is 4  option 25 and 26
	-- 190 is 1,4
	-- 234 is 1,2,3
	-- 170 1,2,3,4

	-- 1st choice = Option 1/2
	-- 2nd choice = option
	-- 3rd choice = option 17/18
    -- 4th choice = option 25/26

	-- Decide what menu to display


end;

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

  -- Menu 2
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

  -- Menu 3
    local m3a1 = 613;
	local m3a2 = 613;
	local m3a3 = 613;
	local m3a4 = 613;
	local m3a5 = 613;
	local m3a6 = 613;
	local m3a7 = 613;
	local m3a8 = 613;
	local m3a9 = 613;
	local m3a10 = 613;




-- First lets see what wins the player has
    local fafnir = player:getVar("Fafnir_Win");
	local nidhogg = player:getVar("Nidhogg_Win");

	local adamantoise = player:getVar("Adamantoise_Win");
	local aspi = player:getVar("Aspi_Win");

	local behe = player:getVar("Behemoth_Win");
	local kb = player:getVar("King_Behemoth_Win");


-- List the items if they have won
    if (behe == 1) then
	    m1a1 = 3341; -- Beastly Shank
	end


	if (fafnir == 1) then
        m1a2 = 3340;  -- Sweet Tea
	    m1a8 = 17653;  -- Hrotti
	    m1a9 = 16942;  -- Balmung
        m2a3 = 1321;  -- Earthen Abjuration: Hands
		m2a4 = 1339;  -- Neptunal Abjuration: Head
		m3a2 = 16555;  -- Ridill
	end

	if (adamantoise == 1) then
	    m1a3 = 3344; -- Red Pondweed
		m1a7 = 12361; -- Sipar
	end

	if (kb == 1) then
	    m1a4 = 1527; -- Behemoth Tongue
		m1a10 = 13415; -- Pixie Earring
		m2a1 = 1334; -- Wyrmal Abjuration Head
		m2a2 = 1322; -- Earthen Abjuration Legs
		m3a1 = 13566; -- Defending Ring
	end

    if (nidhogg == 1) then
	    m1a5 = 1526;  -- Wyrm Beard
	    m2a5 = 1320;  -- Earthen Abjuration Body
	    m2a6 = 1330;  -- Martial Abjuration Body
    end

	if (aspi == 1) then
	    m1a6 = 1525; -- Adamantoise Egg
		m2a7 = 1325; -- Aquarian Abjuration Body
		m2a8 = 1318; -- Dryadic Abjuration feet
		m2a9 = 1333; -- Martial Abjuration Feet
		m2a10 = 1335; -- Wyrmal Abjuration Body
	end





 -- Choice 1
	if (option == 1) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 2) then
	    player:updateEvent(m1a9,m1a10,699050,1000);
	end

 -- Choice 2
	if (option == 9) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,m2a7,m2a8);
	end

	if (option == 10) then
	   player:updateEvent(m2a9,m2a10,699050,5000);
	end

 -- Choice 3
	if (option == 17) then
	    player:updateEvent(m3a1,m3a2,m3a3,m3a4,m3a5,m3a6,m3a7,m3a8);
	end

	if (option == 18) then
	   player:updateEvent(m3a9,m3a10,699050,10000);
	end



  -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- 1,000 Prestiege (Shank, Tea, Pondweed, Tongue, Beard, Egg, Empty, Empty, Empty, Empty)
	-- Beastly Shank
    if (option == 2051) and (behe == 1) then
	    if (player:hasItem(3341) == false) then
           player:addItem(3341,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,3341,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (behe == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Sweat Tea
    elseif (option == 2115) and (fafnir == 1) then
	    if (player:hasItem(3340) == false) then
           player:addItem(3340,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,3340,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Red Pondweed
    elseif (option == 2179) and (aspi == 1) then
	    if (player:hasItem(3344) == false) then
           player:addItem(3344,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,3344,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Behemoth Tongue
    elseif (option == 2243) and (kb == 1) then
	    if (player:hasItem(1527) == false) then
           player:addItem(1527,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1527,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (kb == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	--Wyrm Beard
    elseif (option == 2307) and (nidhogg == 1) then
	    if (player:hasItem(1526) == false) then
           player:addItem(1526,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1526,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (nidhogg == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Adamantoise Egg
    elseif (option == 2371) and (aspi == 1) then
	    if (player:hasItem(1525) == false) then
           player:addItem(1528,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1525,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Sipar
    elseif (option == 2435) and (adamantoise == 1) then
	    if (player:hasItem(12361) == false) then
           player:addItem(12361,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12361,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (adamantoise == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Hrotti
    elseif (option == 2499) and (fafnir == 1) then
	    if (player:hasItem(17653) == false) then
           player:addItem(17653,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,17653,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Balmung
    elseif (option == 2563) and (fafnir == 1) then
	    if (player:hasItem(722) == false) then
           player:addItem(722,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,722,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Pixie Earring
    elseif (option == 2627) and (kb == 1) then
	    if (player:hasItem(13415) == false) then
           player:addItem(13415,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,13415,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (kb == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end


    -- 5,000 Prestiege
	-- Wyrmal Abjuration Head
    if (option == 2059) and (kb == 1) then
	    if (player:hasItem(1334) == false) then
           player:addItem(1334,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1334,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2059) and (kb == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Abjuration: Legs
    elseif (option == 2123) and (kb == 1) then
	    if (player:hasItem(1322) == false) then
           player:addItem(1322,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1322,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2123) and (kb == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Abjuration Hands
    elseif (option == 2187) and (fafnir == 1) then
	    if (player:hasItem(1321) == false) then
           player:addItem(1321,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1321,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2187) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Head
    elseif (option == 2251) and (fafnir == 1) then
	    if (player:hasItem(1339) == false) then
           player:addItem(1339,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1339,1);
	       player:delCurrency("prestige",5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2251) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Abjuration Body
    elseif (option == 2315) and (nidhogg == 1) then
	    if (player:hasItem(1320) == false) then
           player:addItem(1320,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1320,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2315) and (nidhogg == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Body
    elseif (option == 2379) and (nidhogg == 1) then
	    if (player:hasItem(1330) == false) then
           player:addItem(1330,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1330,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2379) and (nidhogg == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abj Body
    elseif (option == 2443) and (aspi == 1) then
	    if (player:hasItem(1325) == false) then
           player:addItem(1325,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1325,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2443) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Feet
    elseif (option == 2507) and (aspi == 1) then
	    if (player:hasItem(1318) == false) then
           player:addItem(1318,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1318,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2507) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1750);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Feet
    elseif (option == 2571) and (aspi == 1) then
	    if (player:hasItem(1333) == false) then
           player:addItem(1333,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1333,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2571) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1750);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Wyrmal Abjuration Body
    elseif (option == 2635) and (aspi == 1) then
	    if (player:hasItem(1335) == false) then
           player:addItem(1335,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1335,1);
	       player:delCurrency("prestige", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2635) and (aspi == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 1750);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end

     -- Defending Ring
    if (option == 2067) and (kb == 1) then
	    if (player:hasItem(13566) == false) then
           player:addItem(13566,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,13566,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2067) and (kb == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Ridill
    elseif (option == 2131) and (fafnir == 1) then
	    if (player:hasItem(16555) == false) then
           player:addItem(16555,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,16555,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2131) and (fafnir == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2195) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2259) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2323) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2387) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2451) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2515) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2579) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2643) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("prestige", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
end



  -- 2139
  -- 2203
  -- 2267
  -- 2331
  -- 2395
  -- 2459
  -- 2523
  -- 2587
  -- 2651









   --
   -- 1706   51370  46250
   -- 2730 1 thru 7
   -- Betweem 2730 and 3242?
   -- 10922 (1024 x 8 + 2730)
   -- 33450
   -- 39082
   -- 2730  is 1 thru 7  8192
   -- 10922 is 1-8    32768
   -- 43690 is 1 thru 9  131072 2^17
   -- 174,762 is 1 thru 10 with space 524288
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);
end;


