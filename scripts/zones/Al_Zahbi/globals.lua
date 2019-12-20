-- Zone: West Sarutabaruta [S] (95)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/status");
-----------------------------------

AL_ZAHBI = {
    mobPath =
    {
	        -- Left Side bottom Floor to AC
	        [1] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
			-- Left Side Bottom Floor to the right at main area make a circle around I-10
		    [2] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52
	        },
			-- Right Side bottom floor to AC
		    [3] = {
		        -79, 2, 40,
				-58, 0, 39,
                -32, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
			-- Right Side bottom floor to the right at main area make a circle around I-10
		    [4] = {
		        -79, 2, 40,
                -32, 0, 40,
			     20, 0, 40, -- Main area near AC
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52
	        },
	        -- Left Side Up and down stairs to AC via stairs to hall of binding
	        [5] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
                 9, -6, 55, -- Go Up the Stairs thru the hall
				16, -6, 60, -- Slight left
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Left Side Up and down stairs to the right at main area make a circle around I-10
	        [6] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
                 9, -6, 55, -- Go Up the Stairs thru the hall
                 12, -6, 18,
				 39, 0, 18, -- Make right towards right side, stairs are on the right to go up
				 40, 0, -18, -- End of hallway can go left or right at this point
				 60, 0, -23,
				 58, 0, -50,
				 33, 0, -52
	        },
	        -- Left Side on 1st floor thru main tunnel all the way to back near zone
	        [7] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     74, 0, 46, -- Back near Whitegate Zone on left
	        },
	        -- Left Side on 1st floor thru main tunnel all the way to back near zone
	        [8] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     86, 0, 37, -- Back near Whitegate Zone on right
	        },

            -- List of Quadrants to go back to the Astral Candy
	        -- Quadrant 1
	        [9] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 2
	        [10] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 3
	        [11] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 4
	        [12] = {
		        -79, 2, 84,
                -42, 2, 76,
			    -40, 0, 56, -- Stairs Left side
			    -14, 0, 40,
			     20, 0, 40, -- Main area near AC
			     39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
			     40, 0, 99, -- Main AC area stairs on right
			     59, 0, 119 -- in front of Hall of Binding
	        },
	        -- Quadrant 5
	        [13] = {
                39, 0, 40,
                39, 0, 56,
	            40, 0, 99,
	            62, 0, 119,
	            85, 2, 120,
	        },
            -- Random Points at 1
            [14] = {


			},
            -- Random Points at 2
            [15] = {


			},
            -- Random Points at 3
            [16] = {
	            41, 0, 102,
				52, 0, 121,
				35, 0, 119,
			},

	},
}

function mobStop(mob,randPath)
    if (randPath == 1) then
        mob:setSpawn(59, 0, 119,180)
    elseif (randPath == 2) then
        mob:setSpawn(33, 0, -52,180)
    elseif (randPath == 3) then
        mob:setSpawn(59, 0, 119,180)
    elseif (randPath == 4) then
        mob:setSpawn(33, 0, -52,180)
    elseif (randPath == 5) then
        mob:setSpawn(59, 0, 119,180)
    elseif (randPath == 6) then
        mob:setSpawn(33, 0, -52,180)
    elseif (randPath == 6) then
        mob:setSpawn(74, 0, 46,180)
    elseif (randPath == 8) then
        mob:setSpawn(86,0,37,180)
    end
    local mobid = mob:getID()
    printf("<%u> Has spawned with a path of %u",mobid,randPath)
    -- mob:setSpawn(-79, 2, 84)
    mob:setRespawnTime(0)
end




			      -- in front of Hall of Binding

			      -- in front of Hall of Binding

			      -- in front of Hall of Binding

			      -- Back near Whitegate Zone on left