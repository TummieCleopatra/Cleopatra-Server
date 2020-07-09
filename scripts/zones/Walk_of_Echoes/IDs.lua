-----------------------------------
-- Area: Walk_of_Echoes
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

-- Mob Families
-- 1) Bird
-- 2) Aquan
-- 3) Amorph
-- 4) Plantoid
-- 5) Lizard

zones[dsp.zone.WALK_OF_ECHOES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        TIME_TO_COMPLETE        = 7231, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED          = 7294, -- The mission has failed. Leaving area.
    },
    mob =
    {
        [1] = {
            BIRD_ONE   = 17523360, -- Bird
            BIRD_TWO   = 17523361, -- Bird
            BIRD_THREE = 17523362, -- Bird
            BIRD_FOUR  = 17523363, -- Bird
        },
        [2] = {
            CRAB_ONE    = 17522701, -- Damasc Crab
            CRAB_TWO    = 17522702, -- Damask Crab
            CRAB_THREE  = 17522703, -- Damask crab
        },
        [3] = {
            BIRD_ONE   = 17522689, -- Interrogator
            BIRD_TWO   = 17522690, -- Theologist
            BIRD_THREE = 17522681, -- Herald
        },
        ----- POS 2
        [100] = {
            BIRD_ONE   = 17523364, -- GreaterBird
            BIRD_TWO   = 17523365, -- GreaterBird
            BIRD_THREE = 17523366, -- GreaterBird
            BIRD_FOUR  = 17523367, -- GreaterBird
        },
        ----- POS 3
        [1000] = {
            BIRD_ONE   = 17523368, -- Hippo
            BIRD_TWO   = 17523369, -- Hippo
            BIRD_THREE = 17523370, -- Hippo
            BIRD_FOUR  = 17523371, -- Hippo
        }


    },
    miniBoss =
    {
        [1] = {
            BIRD_BOSS = 17523372,
        }
    },
    mainBoss =
    {
        [1] = {
            BIRD_BOSS = 17523373,
        }
    },
    npc =
    {
    },
}

return zones[dsp.zone.WALK_OF_ECHOES]