-----------------------------------
-- Area: Ghoyus_Reverie
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GHOYUS_REVERIE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        TIME_TO_COMPLETE        = 7049, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED          = 7053, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES  = 7050, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS  = 7051, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN            = 7052,
    },
    mob =
    {
        LAA_YAKU = 17305662,
        [1]    = {
            YAGUDO_ONE    = 17305653,
            YAGUDO_TWO    = 17305650,
            YAGUDO_THREE  = 17305656, -- Yagudo_Herald
            YAGUDO_FOUR   = 17305647, -- Yagudo_Priest
            YAGUDO_FIVE   = 17305648, -- Yagudo_Priest
            YAGUDO_SIX    = 17305659, -- Yagudo_Votary
            YAGUDO_SEVEN  = 17305651, -- Yagudo_Theologist
            YAGUDO_EIGHT  = 17305657, -- Yagudo_Herald
            YAGUDO_NINE   = 17305660, -- Yagudo_Votary
            YAGUDO_TEN    = 17305658, -- Yagudo_Herald
            YAGUDO_ELEVEN = 17305649, -- Yagudo_Priest
            YAGUDO_TWELVE = 17305652, -- Yagudo_Theologist
        },
        [2] = {
            YAGUDO_ONE   = 17305654, -- Interrogator
            YAGUDO_TWO   = 17305818, -- Theologist
            YAGUDO_THREE = 17305822, -- Herald
            YAGUDO_FOUR  = 17305661, -- Votary
            YAGUDO_FIVE  = 17305655, -- Interrogator
            YAGUDO_SIX   = 17305823, -- Herald
            YAGUDO_SEVEN = 17305819, -- Theologist
        },
    },
    npc =
    {
       ROCK = 17305921,
    },
    mobPath =
    {
	        -- Left Side bottom Floor to AC
	    [1] = {
                -160,20,299,
                -145,16,301,
                -128,12,299,
                -112,6,296,
                -100,0,282,
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [2] = {
                -145,16,301,
                -128,12,299,
                -112,6,296,
                -100,0,282,
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [3] = {
                -128,12,299,
                -112,6,296,
                -100,0,282,
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [4] = {
                -112,6,296,
                -100,0,282,
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [5] = {
                -100,0,282,
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [6] = {
                -113,0,260,
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [7] = {
                -128,0,261,
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [8] = {
                -136,-1,260,
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [9] = {
                -140,0,248,
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [10] = {
                -139,0,234,
                -139,0,219,
                -151,0,180
	    },
	    [11] = {
                -139,0,219,
                -151,0,180
	    },
	    [12] = {
                -151,0,180
	    },
	},

}


return zones[dsp.zone.GHOYUS_REVERIE]