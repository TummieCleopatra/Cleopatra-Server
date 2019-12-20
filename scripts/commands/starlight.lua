---------------------------------------------------------------------------------------------------
-- func: Merry Christmas!
-- auth: Tagban
-- desc: Opens Shop for Xmas 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};
function onTrigger(player)
   
stock = {
-- Gear'
15179,30, -- Dream Hat +1
10383,30, -- Dream Mittens +1
11968,30, -- Dream Pants +1
11966,30, -- Dream Trousers +1
14520,30, -- Dream Robe +1
15753,30, -- Dream Boots +1

-- Other
5543,5, -- N0mz
-- 18864,5, -- Bell (CRASHES SERVER WHEN EQUIPPED DO NOT USE)
3886,5, -- Bastok Case Kit
3887,5, -- Other Kit Windy
3885,5, -- SanD Kit
-- 21098,50, -- Leafkin Bopper +1
 
-- Prizes?
3621,25, -- WINDY
3620,25, -- Bastok
3619,25, -- San D
4215, 30, -- Popstar
4216, 25, -- Brilliant Snow
4218, 300, -- air rider
5883, 75, -- falling Star
   }
 
 dsp.shop.general(player, stock);
end