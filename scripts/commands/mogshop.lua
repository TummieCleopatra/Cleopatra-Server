--------------------------------------------------------------
-- func: @mogshop <page number>
-- auth: forgottenandlost
-- desc: opens the custom moogle shop menu anywhere in the world
--------------------------------------------------------------
require("scripts/globals/keyitems");

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
local level = player:getMainLvl();
local aura = player:getVar("FerretoryAura");

-- printf("%s just triggered Mogshop", player:getName());

    if (page == 0 or page == nil) then
        player:PrintToPlayer( "Merchant Moogle : 1: Crystals, 2: Meds, 3: Food, 4: Tools/Ammo, 5: Keys and Misc, 6: Attachments, 7: Mounts, 8: Beyond Infinity", 0x1F);

    elseif (page == 1) then -- HQ Crystals
        local stock_1 =
        {
            4238,   5000,   -- HQ Fire Crystal
            4239,   5000,   -- HQ Ice Crystal
            4240,   5000,   -- HQ Wind Crystal
            4241,   5000,   -- HQ Earth Crystal
            4242,   5000,   -- HQ Lightning Crystal
            4243,   5000,   -- HQ Water Crystal
            4244,   5000,   -- HQ Light Crystal
            4245,   5000    -- HQ Dark Crystal
        };
        dsp.shop.general(player, stock_1);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Crystal Depot Kupo!", 0x1F);
    elseif (page == 2) then -- Pharmacy
        local stock_2 =
        {
            4148,   400,     -- Antidote
            4154,   4000,    -- Holy Water
            4150,   600,    -- Eye Drops
            4151,   1200    -- Echo Drops
            -- 4153,   35000,    -- Bottle of Antacid
            -- 5418,   1500,    -- Tincture
            -- 5328,   3000,    -- Hi-Potion Drop
            -- 5358,   3000,    -- Hi-Ether Drop
            -- 5356,   3500,    -- Remedy Ointment
            -- 4202,   25000   -- Daedalus Wing

        };
        dsp.shop.general(player, stock_2);
        player:PrintToPlayer( "Merchant Moogle : Medicines for you, Kupo!", 0x1F);
    elseif (page == 3) then -- MogDonalds
        local stock_3 =
        {
			-- attack foods
			4381,	650,   -- Meat mithkabob *
			5721,	600,   -- Crab Sushi
			5743,   11000,  -- Pizza
			5685,   11000,  -- Rabbit Pie
			4488,	3100,  -- Jack-o'-Lantern
			4421,	1200,   -- Melon Pie
			5932,   1200   -- Kitron Juice
        };
        dsp.shop.general(player, stock_3);
        player:PrintToPlayer( "Merchant Moogle : Fresh food for your adventures, Kupo!", 0x1F);
    elseif (page == 4) then
        local stock_4 =
        {
            605,    1100,     -- Pickaxe
            1021,   1100,     -- Hatchet
            1020,   1100,     -- Sickle
            4165,   3300,    -- Silent Oil
            4164,   2000,    -- Prism Powder
            1022,   7200,     -- Thief's Tools
			4219,   2100,     -- Stone Quiver *
		   19229,   510       -- Tin Bullet
		    -- 5363,   3200,     -- Bullet Pouch
        };
        dsp.shop.general(player, stock_4);
        player:PrintToPlayer( "Merchant Moogle : Tools and ammo just for you, Kupo!", 0x1F);
		elseif (page == 5) and (aura >= 4) then
	    local stock_5 =
        {
			1042,    25000,   -- Davoi Coffer Key
			1043,    25000,     -- Bdx
			1044,    25000,     -- Ozt
			1045,    25000,     -- Nest
			1046,    25000,      -- Eld
			1047,    25000,       -- Grl
			1048,    25000,       -- Zvahl
			1049,    25000,       -- Ugl
			1050,    25000,       -- Den
			1051,    25000,       -- Kuftal
			1052,    25000,       -- Byd
			1053,    25000,       -- Cld
			1054,    25000,       -- QSC
			1057,    25000,       -- Tor
			1059,    25000,       -- Groto
			17583,   7000,
			17584,   7000,
			17585,   7000,
			606,     2000,        -- Fetich Head
			607,     2000,        -- Fetich Torso
			608,     2000,        -- Fetich Arms
			609,     2000,        -- Fetich Legs


        };
        dsp.shop.general(player, stock_5);
        player:PrintToPlayer("Merchant Moogle : Miscellaneous items Kupo", 0x1F);
		elseif (page == 5) and (aura < 4) and (aura > 1) then
	    local stock_5 =
        {
			17583,   7000,
			17584,   7000,
			17585,   7000,
			606,     2000,        -- Fetich Head
			607,     2000,        -- Fetich Torso
			608,     2000,        -- Fetich Arms
			609,     2000,        -- Fetich Legs


        };
        dsp.shop.general(player, stock_5);
        player:PrintToPlayer("Merchant Moogle : Miscellaneous items Kupo.  Unlock more items with Feretory Aura!", 0x1F);
		elseif (page == 5) and (aura < 2) then
	    local stock_5 =
        {
			606,     2000,        -- Fetich Head
			607,     2000,        -- Fetich Torso
			608,     2000,        -- Fetich Arms
			609,     2000,        -- Fetich Legs


        };
        dsp.shop.general(player, stock_5);
        player:PrintToPlayer("Merchant Moogle : Miscellaneous items Kupo.  Unlock more items with Feretory Aura!", 0x1F);

		elseif (page == 6) then
	    local stock_6 =
        {
            8513,     12000,    -- Accelerator
            8516,    32000,    -- Accelerator II
			8546,     11000,    -- Armor Plate
			8548,    22000,    -- Armor Plate II
			8641,    11000,    -- Auto-Repair Kit
			8644,    35000,    -- Auto-Repair Kit II
			8520,    12000,    -- Barrage Turbine
			8583,    12000,    -- Coiler
			8643,     12000,    -- Damage Gauge
			8517,    3000,    -- Drum Magazine
			8582,    11000,    -- Dynamo
			1050,    12000,    -- Flashbulb
			8642,    32000,    -- Hammermill
			8451,    12000,    -- Inhibitor
			8482,     12000,    -- Loudspeaker I
			8484,    32000,    -- Loudspeaker II
			8674,    12000,    -- Mana Converter
			8609,    12000,    -- Mana Jammer
			8612,     7000,    -- Mana Jammer II
			8673,     12000,    -- Mana Tank
			8676,    32000,    -- Mana Tank II
			8483,     12000,    -- Scanner
			8545,    16000,    -- Shock Absorber
			8577,     12000,    -- Stabilizer I
			8580,    12000,    -- Stabilizer II
			8449,     32000,    -- Strobe
			8450,     12000,    -- Tension Spring
			8452,    32000,    -- Tension Spring II
            8518,    92000     -- Tubro Charger


        };
        dsp.shop.general(player, stock_6);
        player:PrintToPlayer("Merchant Moogle : Attachments Kupo", 0x1F);
		elseif (page == 7 and aura >= 6 and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)) then
	    local stock_7 =
        {
            10049,     25000,    -- Raptor
			10051,     50000,     -- Crab
			10050,     75000,    -- Tiger
			10053,     75000,    -- Bomb
			10056,     75000,    -- Crawler
			10058,     75000,    -- Beetle
        };
        dsp.shop.general(player, stock_7);
        player:PrintToPlayer("Merchant Moogle : Mounts Kupo!", 0x1F);
		elseif (page == 7 and aura >= 4 and aura < 6 and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)) then
	    local stock_7 =
        {
            10049,     25000,    -- Raptor
			10051,     50000     -- Crab
        };
        dsp.shop.general(player, stock_7);
        player:PrintToPlayer("Merchant Moogle : Mounts! Unlock more mount options with more Aura!", 0x1F);
		elseif (page == 7 and aura >= 2 and aura < 4 and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)) then
	    local stock_7 =
        {
            10049,     25000    -- Raptor
        };
        dsp.shop.general(player, stock_7);
        player:PrintToPlayer("Merchant Moogle : Mounts! Unlock more mount options with more Aura!", 0x1F);
		elseif (page == 7 and aura < 2) then
        player:PrintToPlayer("Merchant Moogle : Gain more Feretory Aura and have a Choco License to access this shop Kupo!", 0x1F);
	    elseif (page == 8) then -- Beyond infinity
        local plevel = player:getMainLvl();
            if (plevel > 98) then
            local stock_8 =
            {
                10902,  5000,     -- Euxine Hat
				10475,  5000,     -- Euxine Coat
				10524,  5000,     -- Euxine Gloves
				10555,  5000,     -- Euxine Kecks
				10621,  5000,     -- Euxine Nails
            };
            dsp.shop.general(player, stock_8);
            player:PrintToPlayer( "Beyond Infinity: Welcome, Kupo!");
            else
                player:PrintToPlayer("Merchant Moogle : That store is not accessible yet Kupo", 0x1F);
            end


       else
        -- local Mog = 16982044;
        -- message = "Test!";
        -- SpoofSay(Mog,player:getID(),message);
        player:PrintToPlayer( string.format( "The MogShop catalog doesn't have a page %i, Kupo!", page ) );
    end
end;