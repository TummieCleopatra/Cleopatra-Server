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
        [3] = {
            ROMAA_MIHGO   = 17305683, -- Romaa Mihgo
            COBRA_1       = 17305684, -- Cobra
            COBRA_2       = 17305685, -- Cobra
            COBRA_3       = 17305686, -- Cobra
            COBRA_4       = 17305687, -- Cobra
            COBRA_5       = 17305688, -- Cobra
            COBRA_6       = 17305689, -- Cobra
            COBRA_7       = 17305690, -- Cobra
            COBRA_8       = 17305691, -- Cobra
            COBRA_9       = 17305692, -- Cobra
        },
        [4] = {
            MOB_1         = 17305693, -- Romaa Mihgo
            MOB_2         = 17305694, -- Cobra
            MOB_3         = 17305695, -- Cobra
            MOB_4         = 17305696, -- Cobra
            MOB_5         = 17305697, -- Cobra
            MOB_6         = 17305698, -- Cobra
            MOB_7         = 17305699, -- Cobra
            MOB_8         = 17305700, -- Cobra
            MOB_9         = 17305701, -- Cobra
            MOB_10        = 17305702, -- Cobra
            MOB_11        = 17305703, -- Cobra
            MOB_12        = 17305704, -- Cobra
            BELFRY        = 17305712, -- Cobra
        },
        [5] = {
            MOB_11        = 17305705, -- Cobra
        },
        [6] = {
             MOB_11        = 17305706, -- Cobra
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
    feastPath =
    {
        ROMAA =
        {
            -394,0,-6,
            -385,-3,-5,
            -368,-4,17,
            -367,0,36,
            -355,0,29,
            -333,0,37,
        },
        UNIT1 =
        {
            -385,-3,-5, -- TOP
            -368,-4,17, -- TOP BACK RAMP
            -367,0,36,
            -365,0,37,
            -344,0,37,
        },
        UNIT2 =
        {
            -394,0,-6,
            -385,-3,-5,
            -368,-4,17,
            -367,0,36,
            -365,0,37,
            -344,0,37,
        },
    },

}


return zones[dsp.zone.GHOYUS_REVERIE]