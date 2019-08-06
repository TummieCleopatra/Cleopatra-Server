-----------------------------------
-- Area: Al_Zahbi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.AL_ZAHBI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6388, -- Obtained: <item>.
        GIL_OBTAINED              = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET    = 7049, -- You can't fish here.
        MOG_LOCKER_OFFSET         = 7383, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET             = 7529, -- Home point set!
        IMAGE_SUPPORT_ACTIVE      = 7552, -- You have to wait a bit longer before asking for synthesis image support again.
        IMAGE_SUPPORT             = 7554, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        KAHAHHOBICHAI_SHOP_DIALOG = 7613, -- Step rrright up to Kahah Hobichai's Blades! We've got everything your battle-thirrrsty heart desires!
        ALLARD_SHOP_DIALOG        = 7619, -- Hey, how ya doin'? Welcome to the armor shop of the Ulthalam Parade's leading star--Allard, in the flesh!
        ZAFIF_SHOP_DIALOG         = 7625, -- Welcome... I'm Zafif, and this is my magic shop... I hope you can find something of use here.
        CHAYAYA_SHOP_DIALOG       = 7631, -- Chayaya's Projectiles! Get your darts and more at Chayaya's Projectiles! Just don't touch the stuff in the high drawers, okay?
        NEED_CANDESCENCE_BACK     = 7684, -- ...Hm? You! Yes, you! What do you think you're staring at, anyway? Go get the Astral Candescence back, and now!
        ITEM_DELIVERY_DIALOG      = 7835, -- No need to wrap your goods. Just hand them over and they're as good as delivered! (I've got to be nice as long as the manager's got his eye on me...)
        DEHBI_MOSHAL_SHOP_DIALOG  = 7839, -- Welcome to the Carpenters' Guild!
        NDEGO_SHOP_DIALOG         = 7841, -- The Blacksmiths' Guild thanks you for your business!
        BORNAHN_SHOP_DIALOG       = 7843, -- Welcome! We have all your goldsmithing needs right here!
        TATEN_BILTEN_SHOP_DIALOG  = 7845, -- Weave something beautiful with the materials you buy here, okay?
        CHOCOBO_HAPPY             = 7848, -- The chocobo appears to be extremely happy.
        SANCTION                  = 7973, -- You have received the Empire's Sanction.
        -- Besieged Texts
        MAMOOL_MARCH              = 8084,
        TROLL_MARCH               = 8085,
        UNDEAD_MARCH              = 8086,
        MAMOOL_START              = 8087,
		TROLL_START               = 8088,
        UNDEAD_START              = 8089,  -- Al Zahbi is in Besieged!
        BESIEGED_START            = 8090,  -- Al Zahbi is in Besieged!
		MAMOOL_LOSE               = 8093,
		TROLL_LOSE                = 8094,
		UNDEAD_LOSE               = 8095,  -- Undead has retreated
		MAMOOL_WIN                = 8098,
		TROLL_WIN                 = 8099,
        UNDEAD_WIN                = 8100,  -- The Hall of Binding has been breached, The undead swarp has taken the astral candy
    },
    mob =
    {
    },
    npc =
    {
    },
    besieged =
    {
        UNDEAD =
        {
            [1] = 16974025,  -- Lamia Immolator
            [2] = 16974026,  -- Lamia Jaegar
            [3] = 16974027,  -- Lamia Commandress
            [4] = 16974052,  -- Gespent
            [5] = 16974053,  -- Gespent
            [6] = 16974056,  -- Assault Draugar
            [7] = 16974066,  -- Assault Bhoot
            [8] = 16974071,  -- Qutrub Extortionist
            [9] = 16974075,  -- Qutrum Wastrel
            [10] = 16974079,  -- Expunger
            [11] = 16974084,   -- Bhoot Invador
            [12] = 16974030, -- Lamia Rover
            [13] = 16974067, -- Assault Bhoot
            [14] = 16974057, -- Assault Dragar
            [15] = 16974049, -- Merrow Seafarer
            [16] = 16974080, -- Expunger
            [17] = 16974041, -- Merrow Cantatrice
            [18] = 16974054, -- Gespent
            [19] = 16974061, -- Assault Dragar
            [20] = 16974062, -- Assault Dragar
            [21] = 16974031,  -- Seafarrer
            [22] = 16974042,  -- Shiranuhi
            [23] = 16974055,  -- Gespenst
            [24] = 16974072,  -- Extortionist
            [25] = 16974048,  -- Rover
            [26] = 16974058,  -- Dragar
            [27] = 16974081,  -- Expunger
            [28] = 16974073,  -- Extortionist
            [29] = 16974084,  -- Bhoot Invader
            -- Lvl 5-8
            [30] = 16974064,  -- Assault Dragar
            [31] = 16974076,  -- Qutrum Wastrel
            [32] = 16974095,  -- Frebooter
            [33] = 16974096,  -- Freebppter
            [34] = 16974068,  -- Bhoot
            [35] = 16974074,  -- Extortionist
            [36] = 16974082,  -- Expunger
            [37] = 16974032,  -- Cantatrice
            [38] = 16974039,  -- Rover
            [39] = 16974040,  -- Seafarer
            [40] = 16974102,  -- Medusa
        },
        UNDEAD_BOSS =
        {
            [1] = 16974104, -- Lamia No 34
            [2] = 16974105, -- Lamia No 21
            [3] = 16974106, -- Lamia No 15
            [4] = 16974107, -- Lamia No 11
            [5] = 16974108, -- Lamia No 9
            [6] = 16974115, -- Lamia No 12
            [7] = 16974116, -- Lamia No 3
            [8] = 16974117, -- Lamia No 2
        },
        BATTLE_NPCS =
        {
            npc_start = 16974135,
            npc_end = 16974173,
        },
        NPCS =
        {
            [1] =
            {
                npc_start = 16974277,
                  npc_end = 16974314,
            },
            [2] =
            {
                npc_start = 16974342,
                  npc_end = 16974377,
            },
        },
    },
}

return zones[dsp.zone.AL_ZAHBI]

--[[
INSERT INTO `mob_spawn_points` VALUES (16974028,'Lamias_Elemental','Lamia\'s Elemental',72,1,1,1,1);
INSERT INTO `mob_spawn_points` VALUES (16974029,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);



INSERT INTO `mob_spawn_points` VALUES (16974033,'Merrow_Shiranuhi','Merrow Shiranuhi',77,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974034,'Lamia_Immolator','Lamia Immolator',69,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974035,'Lamia_Jaeger','Lamia Jaeger',70,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974036,'Lamia_Commandress','Lamia Commandress',71,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974037,'Lamias_Elemental','Lamia\'s Elemental',72,1,1,1,1);
INSERT INTO `mob_spawn_points` VALUES (16974038,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);


INSERT INTO `mob_spawn_points` VALUES (16974043,'Lamia_Immolator','Lamia Immolator',69,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974044,'Lamia_Jaeger','Lamia Jaeger',70,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974045,'Lamia_Commandress','Lamia Commandress',71,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974046,'Lamias_Elemental','Lamia\'s Elemental',72,1,1,1,1);
INSERT INTO `mob_spawn_points` VALUES (16974047,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);


INSERT INTO `mob_spawn_points` VALUES (16974050,'Merrow_Cantatrice','Merrow Cantatrice',76,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974051,'Merrow_Shiranuhi','Merrow Shiranuhi',77,-91,2,57,1);

INSERT INTO `mob_spawn_points` VALUES (16974059,'Assault_Draugar','Assault Draugar',79,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974060,'Assault_Draugar','Assault Draugar',79,-91,2,57,1);

INSERT INTO `mob_spawn_points` VALUES (16974063,'Draugars_Wyvern','Draugar\'s Wyvern',80,-91,2,57,1);




INSERT INTO `mob_spawn_points` VALUES (16974065,'Draugars_Wyvern','Draugar\'s Wyvern',80,-91,2,57,1);



INSERT INTO `mob_spawn_points` VALUES (16974069,'Assault_Bhoot','Assault Bhoot',81,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974070,'Assault_Bhoot','Assault Bhoot',81,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974077,'Qutrub_Wastrel','Qutrub Wastrel',83,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974078,'Qutrub_Wastrel','Qutrub Wastrel',83,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974083,'Expunger','Expunger',84,-91,2,57,1);





INSERT INTO `mob_spawn_points` VALUES (16974085,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974086,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974087,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974088,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974089,'Bhoot_Invader','Bhoot Invader',85,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974090,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974091,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974092,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974093,'Bhoot_Intruder','Bhoot Intruder',86,-91,2,57,1);




INSERT INTO `mob_spawn_points` VALUES (16974094,'Lamia_No4','Lamia No.4',87,-91,2,57,1);

INSERT INTO `mob_spawn_points` VALUES (16974097,'Lamia_Freebooter','Lamia Freebooter',88,-91,2,57,1);



INSERT INTO `mob_spawn_points` VALUES (16974098,'Pining_Abazohn','Pining Abazohn',89,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974099,'Qutrub_Forayer','Qutrub Forayer',90,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974100,'Qutrub_Forayer','Qutrub Forayer',90,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974101,'Qutrub_Forayer','Qutrub Forayer',90,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974102,'Medusa','Medusa',91,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974103,'Nemean_Lion','Nemean Lion',92,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974104,'Lamia_No34','Lamia No.34',93,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974105,'Lamia_No21','Lamia No.21',94,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974106,'Lamia_No15','Lamia No.15',95,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974107,'Merrow_No11','Merrow No.11',96,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974108,'Lamia_No9','Lamia No.9',97,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974109,'Lamias_Elemental','Lamia\'s Elemental',72,1,1,1,1);
INSERT INTO `mob_spawn_points` VALUES (16974110,'Lamias_Elemental','Lamia\'s Elemental',72,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974111,'Lamias_Elemental','Lamia\'s Elemental',72,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974112,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974113,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974114,'Lamias_Avatar','Lamia\'s Avatar',73,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974115,'Merrow_No12','Merrow No.12',98,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974116,'Lamia_No3','Lamia No.3',99,-91,2,57,1);
INSERT INTO `mob_spawn_points` VALUES (16974117,'Lamia_No2','Lamia No.2',100,-91,2,57,1);



--]]