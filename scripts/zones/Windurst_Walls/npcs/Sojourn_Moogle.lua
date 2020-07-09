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

local leafdim = 40
local nq = {{17765,1868}}
local totalrp = {30,50,80,120,170,220,280,340,410,480,560,650,750,860,980}
 -- 17765 1

function onTrade(player,npc,trade)

    local lvl75stoneCount = trade:getItemQty(8951)
	local augmentslot = 0

    for i = 1, #nq do
        local weapon = nq[i][1]
        local augment = nq[i][2]
        if (trade:hasItemQty(8951, lvl75stoneCount) and trade:hasItemQty(weapon,1)) then
            for n = 0, 7 do
                if (trade:getItem(n):getID() == weapon) then
                    printf("GOOOOOD")
                    augmentslot = n
                    break
                end
            end

            stoneCount = trade:getItemQty(8951)
            -- TODO: This also needs Path Type as well
            local points,rank = trade:getMezzotintWeaponType(augmentslot);
            rank = rank / 4 -- Get current rank of weapon
            points = (points - 1) / 4  -- This is how many points into the rank

            local pointsTowards = leafdim * stoneCount  -- How many points based on traded stones
            local pointsNeededToRank = totalrp[rank+1] - points -- How many points needed to rank, this should match the weapon info

            -- player:PrintToPlayer("Item is: "..weapon.." Stone Count is: "..stoneCount.." Rank is: "..rank.."Points Needed to Rank Up: "..pointsNeededToRank.." Points Towards: "..pointsTowards)
            -- Now apply mezzotint
            if (pointsNeededToRank - pointsTowards > 0) then

                local newPoints = points + pointsTowards
                player:tradeComplete();
                player:addWeaponMezzotint(weapon, 1, newPoints, 1, rank, 0, augment)
                player:messageSpecial(ID.text.ITEM_OBTAINED,weapon)
            else
                print("Do the thing")
                local newPoints = (pointsNeededToRank - pointsTowards) * -1
                printf("New Points: %u",newPoints)
                -- Iterate through rank points to find new rank
                for z = 15,1,-1 do
                    if (newPoints > totalrp[z] and z > rank) then
                        rank = z - 1 -- New Rank
                        printf("New Rank %u",rank)
                        player:tradeComplete();
                        player:addWeaponMezzotint(weapon, 1, newPoints, 1, rank, 0, augment)
                        player:messageSpecial(ID.text.ITEM_OBTAINED,weapon)
                        break
                    else
                        player:tradeComplete();
                        player:addWeaponMezzotint(weapon, 1, newPoints, 1, rank + 1, 0, augment)
                        player:messageSpecial(ID.text.ITEM_OBTAINED,weapon)
                        break
                    end
                end
            end
            -- player:PrintToPlayer("Item is: "..weapon.." Stone Count is: "..stoneCount.." Rank is: "..rank.."Points Needed to Rank Up: "..pointsNeededToRank)
            break
        end
    end











end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    -- 1 Item = 254
	-- 2 Items = 250
	-- 3 Items = 234
    -- 4 Items = 170


    local m1a1 = 19327;  -- H2H
	local m1a2 = 19332;  -- Dagger
	local m1a3 = 19337;  -- Sword
	local m1a4 = 19342;  -- Great Sword
	local m1a5 = 19347;  -- Axe
	local m1a6 = 19352;  -- Great Axe
	local m1a7 = 19357;  -- Scythe
	local m1a8 = 19362;  -- Polearm
	local m1a9 = 19367;  -- Katana
	local m1a10 = 19372;  -- Great Katana

    -- m1a1 = bit.bor(bit.rshift(bit.ror(m1a1,8),16),bit.rshift(m1a1, 8))
    -- m1a2 = bit.bor(bit.rshift(bit.ror(m1a2,8),16),bit.rshift(m1a2, 8))




    local good = bit.bor(bit.lshift(m1a8,16),m1a7)

   --  m1a1 = bit.bor(bit.rshift(bit.ror(m1a1,8),16),bit.rshift(m1a1, 8))
  --   local nextt = bit.bor(bit.rshift(bit.ror(m1a2,8),16),bit.rshift(m1a2, 8))



   -- print(nextt)
  --  nextt = bit.lshift(nextt,16)
   -- print(nextt)

 --   local good = (bit.bor((bit.lshift(m1a2,16) * -1),m1a1))

    -- 200 is 5 with slot 1and2 sharing position 1 and slot 4 and 5 sharing position 4


    local points = 15000

    local slotab = itemMaker(25,2000)
    local slotcd = itemMaker(15000,20000)

	-- player:startEvent(0x210,10,points,slotab,5000,slotcd,0,200,0);
	player:startEvent(0x210,10,points,slotab,5000,slotcd,25000,3208,0);
    -- player:startEvent(0x210,10,2000,6553610,300,750,0,128,0);
end


function onEventUpdate(player,csid,option)
    printf("Option is %u",option)
    print(csid)



    local m1a1 = 2488 -- Alexandrite
    local m1a2 = 4059 -- Pluton
    local m1a3 = 1449 -- Whitehslel
    local m1a4 = 1452 -- Bronzepiece
    local m1a5 = 1455 -- Byne Bill


    ---- Weapons 2000 -------
    local m2a1 = 19327;  -- H2H
	local m2a2 = 19332;  -- Dagger
	local m2a3 = 19337;  -- Sword
	local m2a4 = 19342;  -- Great Sword
	local m2a5 = 19347;  -- Axe
	local m2a6 = 19352;  -- Great Axe
	local m2a7 = 19357;  -- Scythe
	local m2a8 = 19362;  -- Polearm
	local m2a9 = 19367;  -- Katana
	local m2a10 = 19372;  -- Great Katana
    -- local m1a10 = 1266961279;

    local m2a11 = 19377;
	local m2a12 = 19382;
	local m2a13 = 19387;
	local m2a14 = 19392;

    ----- Items 5000 ----
    local m3a1 = 8960 -- Leaf Orb
    local m3a2 = 5736 -- Linen Coin Purse
    local m3a3 = 19245 -- Jinx Ampulla
    local m3a4 = 16054 -- Hiru Earring
    local m3a5 = 11586 -- Backlash Torque
    local m3a6 = 15954 -- Fierce Belt
    local m3a7 = 11635 -- Alert Ring
    local m3a8 = 15955 -- Fatality Belt
    local m3a9 = 16306 -- Halting Stole


    --

    -- local test = itemMaker(m1a1,m1a2)
    -- after the 6thitem it makes a blank spot every otherspot
    -- you have to combine the two items into a single 4 space hex value
    -- this is what item maker does
    local item7 = itemMaker(m2a7,m2a8)
    local item8 = itemMaker(m2a9,m2a10)
    local item9 = itemMaker(m2a11,m2a12)
    local item10 = itemMaker(m2a13,m2a14)

    local item25a = itemMaker(0,m1a1)
    local item25bc = itemMaker(m1a2,m1a3)
    local item25de = itemMaker(m1a4,m1a5)


    local item5k1 = itemMaker(m3a1,m3a2)
    local item5k2 = itemMaker(0,m3a3)
    local item5ka = itemMaker(m3a4,m3a5)
    local item5kbc = itemMaker(m3a6,m3a7)
    local item5kde = itemMaker(m3a8,m3a9)

    -- 32767 is 5: slots 1-7 are empty, slot 8 requires item maker with nothing in the first slot and item in the second

	if (option == 1) then
	    player:updateEvent(0,0,0,0,0,0,0,item25a);
	end

	if (option == 2) then
	    player:updateEvent(item25bc,item25de,32767,25);
	end


	if (option == 9) then
	    player:updateEvent(item5k1,0,0,0,0,0,item5k2,item5ka);
	end


	if (option == 10) then
         player:updateEvent(item5kbc,item5kde,8188,5000);
	end



	if (option == 5) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,item7,item8);
	end


	if (option == 6) then
	    -- player:updateEvent(m2a9,m2a10,43690,1000); -- 10 + 2 empty
        -- 43690
         player:updateEvent(item9,item10,2730,2000);
		-- player:updateEvent(m2a9,m1a10,699050,1000);
	end



    -- Display List
    -- Binary every 10 = 20 - every group of 10 for a slot.  For instance 1010 is 20 - 2 for 18 slots.

end



function itemMaker(itemA,itemB)
    printf("Triggered")

    local item = bit.bor(bit.lshift(itemB,16),itemA)

    return item
end