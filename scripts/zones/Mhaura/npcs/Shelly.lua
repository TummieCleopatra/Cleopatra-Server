-----------------------------------
--	Area: Mhaura
--	NPC:  Augment for Sea Items
-----------------------------------

-----------------------------------
package.loaded["scripts/zones/Mhaura/IDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/IDs");
require("scripts/globals/settings");

require("scripts/globals/seaugments");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local homamhead = 15240;
	local homambody = 14488;
	local homamhands = 14905;
	local homamlegs = 15576;
	local homamfeet = 15661;

    local nashirahead = 15241;
	local nashirabody = 14489;
	local nashirahands = 14906;
	local nashiralegs = 15577;
	local nashirafeet = 15662;

	local leaf = 8933;
	local leaf1 = 8934;
	local leaf2 = 8935;

	local snow = 8930;
	local snow1 = 8931;
	local snow2 = 8932;

	local dusk = 8936;
	local dusk1 = 8937;
	local dusk2 = 8938;


    -- Homam Head
    if (trade:hasItemQty(homamhead,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = homamHeadLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = homamHeadLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = homamHeadLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = homamHeadSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = homamHeadSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = homamHeadSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = homamHeadDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = homamHeadDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	elseif (trade:hasItemQty(homamhead,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = homamHeadDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHeadPerfect",0);
        else
		    player:setVar("HomamHeadPerfect",1);
        end
	end

    -- Homam Body
    if (trade:hasItemQty(homambody,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = homamBodyLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = homamBodyLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
		        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = homamBodyLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = homamBodySnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = homamBodySnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = homamBodySnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = homamBodyDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = homamBodyDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	elseif (trade:hasItemQty(homambody,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = homamBodyDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homambody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamBodyPerfect",0);
        else
		    player:setVar("HomamBodyPerfect",1);
        end
	end

    -- Homam Hands
    if (trade:hasItemQty(homamhands,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = homamHandsLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = homamHandsLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = homamHandsLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = homamHandsSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = homamHandsSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = homamHandsSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = homamHandsDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = homamHandsDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	elseif (trade:hasItemQty(homamhands,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = homamHandsDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamhands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamHandsPerfect",0);
        else
		    player:setVar("HomamHandsPerfect",1);
        end
	end

    -- Homam Legs
    if (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = homamLegsLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = homamLegsLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = homamLegsLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = homamLegsSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = homamLegsSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = homamLegsSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = homamLegsDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = homamLegsDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	elseif (trade:hasItemQty(homamlegs,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = homamLegsDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamlegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamLegsPerfect",0);
        else
		    player:setVar("HomamLegsPerfect",1);
        end
	end

    -- Homam Feet
    if (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = homamFeetLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = homamFeetLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = homamFeetLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();

		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        printf("Aug1: %u, Val1: %u, Aug2: %u, Val2: %u",aug1,val1,aug2,val2)
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = homamFeetSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = homamFeetSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = homamFeetSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = homamFeetDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = homamFeetDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	elseif (trade:hasItemQty(homamfeet,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = homamFeetDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(homamfeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("HomamFeetPerfect",0);
        else
		    player:setVar("HomamFeetPerfect",1);
        end
	end


    -- Nashira Head
    if (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahead,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHeadDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahead,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHeadPerfect",0);
        else
		    player:setVar("NashiraHeadPerfect",1);
        end
	end

    -- Nashira Body
    if (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
		        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodySnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodySnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
		if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodySnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	elseif (trade:hasItemQty(nashirabody,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = nashiraBodyDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraabody,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraBodyPerfect",0);
        else
		    player:setVar("NashiraBodyPerfect",1);
        end
	end

    -- Nashira Hands
    if (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	elseif (trade:hasItemQty(nashirahands,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = nashiraHandsDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraahands,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraHandsPerfect",0);
        else
		    player:setVar("NashiraHandsPerfect",1);
        end
	end

    -- Nashira Legs
    if (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	elseif (trade:hasItemQty(nashiralegs,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = nashiraLegsDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraalegs,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraLegsPerfect",0);
        else
		    player:setVar("NashiraLegsPerfect",1);
        end
	end

    -- Nashira Feet
    if (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(leaf,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetLeafNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(leaf1,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetLeafHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(leaf2,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetLeafHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(snow,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetSnowNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(snow1,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetSnowHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(snow2,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetSnowHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(dusk,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetDuskNQ(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(dusk1,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetDuskHQ1(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	elseif (trade:hasItemQty(nashirafeet,1) and trade:hasItemQty(dusk2,1)) then
	    local aug1,val1,aug2,val2 = nashiraFeetDuskHQ2(aug1,val1,aug2,val2);
		player:tradeComplete();
		player:addItem(nashiraafeet,1,aug1,val1,aug2,val2);
        if (aug2 == 2046) then
		    player:setVar("NashiraFeetPerfect",0);
        else
		    player:setVar("NashiraFeetPerfect",1);
        end
	end



end;


function onTrigger(player,npc)




end;