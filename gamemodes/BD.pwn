/*******************************************************************************

							BAKALAURA DARBA SERVERIS 2018
								
*******************************************************************************/


#include <a_samp>
#define COLOR_BLUE 0x111ED1FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_GREEN 0x00FF00FF
//#define noderîgs prieksh kraasaam
//#define COLOR_WHITE    0xFFFFFFFF

new playersconnected=0;
new AdminDialog[1024];
new AdminLevel[MAX_PLAYERS];

main()
{
	print("\n..........----------==========**********==========----------...........\n\n");
	print("             Bakalaura darba serveris veiksmiigi palaists!");
	print("\n\n**********==========----------__________----------==========***********\n");
}

public OnGameModeInit()
{
	// Gamemode teksts, kursh raadaas samp serveru sarakstaa
	SetGameModeText("BD v. 1.0");
	// Izsleedz ieeju interjeros
	DisableInteriorEnterExits();
	// Izsleedz stunt bonusus
	EnableStuntBonusForAll(0);
	// Speeleetaaja skins
	AddPlayerClass(23, 1958.3783, 1343.1572, 15.3746, 269.1425, 38, 500, 0, 0, 0, 0); // Rapper
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
    AdminDialogText(playerid);
	SendClientMessage(playerid, COLOR_WHITE, "Sveicinaati Jaana Beertina Bakalaura darba serverii!");
	playersconnected++;
	//playersconnected += 1;
	new string[128];
	format(string, sizeof(string), "Shobriid serverii atrodas %d speeleetaaji/(-s).", playersconnected);
	SendClientMessageToAll(0xE81A1AFF, string);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	playersconnected--;
	new string[128];
	format(string, sizeof(string), "%d izgaaja no servera.", playersconnected);
	SendClientMessageToAll(0xE81A1AFF, string);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/ahelp", cmdtext, true, 10) == 0)
	{
 	AdminLevel[playerid] = GetPVarInt(playerid,"AdminLevel");
	ShowPlayerDialog(playerid,21,DIALOG_STYLE_MSGBOX,"Adminu komandas",AdminDialog,"Labi","");
	return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

AdminDialogText(playerid)
{
	if(AdminLevel[playerid] == 1)
	{
    AdminDialog = "";
    strcat(AdminDialog, "{B7FF00}Moderatora komandas {FFFFFF}- /mute, /unmute, /jail, /unjail, /kick.\n");
    return 1;
	}
	if(AdminLevel[playerid] == 2)
	{
	AdminDialog = "";
	strcat(AdminDialog, "{B7FF00}Administratora komandas {FFFFFF}- /info, /ban, /time, /weather, /spec, /specoff.\n");
	return 1;
	}
	if(AdminLevel[playerid] == 3)
	{
	AdminDialog = "";
	strcat(AdminDialog, "{B7FF00}Îpaðnieka komandas {FFFFFF}- /say, /dec, /setmoney, /setscore, /setlevel, /get, /goto.\n");
	strcat(AdminDialog, "{B7FF00}Îpaðumu komandas {FFFFFF}- /disableproperty, /enableproperty, /setpropertyprice, /setpropertyvalue, /setpropertyearning, /saveproperty.\n");
	return 1;
	}
	return 1;
}

/*******************************************************************************

								GAMEMODE BEIGAS

*******************************************************************************/

