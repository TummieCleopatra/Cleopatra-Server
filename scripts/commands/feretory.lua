---------------------------------------------------------------------------------------------------
-- func: @addcurrency <currency type> <amount> <target player>
-- desc: Adds the specified currency to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "sis"
};

function onTrigger(player)
local quest = player:getVar("FerretoryQuest1");
local amount = player:getVar("FerretoryPlantoid");
local quest2 = player:getVar("FerretoryQuest75");
local undead = player:getVar("FerretoryUndead");
local arcana = player:getVar("FerretoryArcana");
local demon = player:getVar("FerretoryDragonDemon");
local lumian = player:getVar("FerretoryLuminian");


if (quest == 0) then
player:PrintToPlayer("No Feretory Quest Active.",0x15);
elseif (quest == 1) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Plantoids", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 2) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding monsters from the Lizard family", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 3) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding monsters from the Bird family", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 4) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Beast Monsters", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 5) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Amorph Monsters", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 6) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Vermin", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
elseif (quest == 7) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Aquan Monsters", 0xD);
player:PrintToPlayer("Objectives Remaining: "..amount..".", 0xD);
end

if (quest2 == 8) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Undead and Arcana", 0xD);
player:PrintToPlayer("Objectives Remaining: Undead("..undead..")/Arcana("..arcana..").", 0xD);
end
if (quest2 == 9) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Demons or Dragons", 0xD);
player:PrintToPlayer("Objectives Remaining: "..demon..".", 0xD);
end
if (quest2 == 10) then
player:PrintToPlayer("The Following Aura Quest is Active:",0x15);
player:PrintToPlayer("Defeat experience yielding Luminians or Lumorians", 0xD);
player:PrintToPlayer("Objectives Remaining: "..lumian..".", 0xD);
end



end;