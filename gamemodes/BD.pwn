/*******************************************************************************

							BAKALAURA DARBA SERVERIS 2018
								
*******************************************************************************/


#include <a_samp>
#include <Dini>
#pragma unused ret_memcpy
#pragma tabsize 0

// Kraasu defineeshana
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_BRIGHTRED 0xFF6C6CFF
#define COLOR_RED 0xFF6C6CFF
#define COLOR_BLUE 0x0000FFAA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_PURPLE 0x9900FFAA
#define COLOR_BROWN 0x993300AA
#define COLOR_ORANGE 0xFF9933AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_LIME 0x99FF00AA
#define COLOR_BLACK 0x000000AA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_VIOLET 0x9955DEEE
#define COL_WHITE "{FFFFFF}"


// Character defineeshana
#define MAD_DOG 1
#define GANGSTER 2
#define CHICK 3
#define AGENT 4
#define MAFIA 5
#define TRIADS 6

// Mainiigie prieksh character
new gPlayerClass[MAX_PLAYERS];

// Laiks
new Text:TimeUp, Text:DateUp;

// Ieroèu izvçle spawnâ
new Menu:Weapons;
new Menu:Weapons2;
new Menu:Weapons3;

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
	
	// Speeleetaaja skinu izveele
	AddPlayerClass(24, 2163.5950,1680.0225,10.8203,88.6696, 0, 0, 0, 0, 0, 0); //Mad Dog
	AddPlayerClass(25, 2163.5950,1680.0225,10.8203,88.6696, 0, 0, 0, 0, 0, 0); //Mad Dog
	AddPlayerClass(67, 2163.5950,1680.0225,10.8203,88.6696, 0, 0, 0, 0, 0, 0); //Mad Dog
	AddPlayerClass(104, 2388.7134,-1541.3209,24.0000, 268.9916, 0, 0, 0, 0, 0, 0); //Gangster
	AddPlayerClass(107, 2388.7134,-1541.3209,24.0000, 268.9916, 0, 0, 0, 0, 0, 0); //Gangster
	AddPlayerClass(101, 2388.7134,-1541.3209,24.0000, 268.9916, 0, 0, 0, 0, 0, 0); //Gangster
	AddPlayerClass(192, 2421.3835,-1224.4628,25.2122,179.2296, 0, 0, 0, 0, 0, 0); //Chick
	AddPlayerClass(211, 2421.3835,-1224.4628,25.2122,179.2296, 0, 0, 0, 0, 0, 0); //Chick
	AddPlayerClass(233, 2421.3835,-1224.4628,25.2122,179.2296, 0, 0, 0, 0, 0, 0); //Chick
	AddPlayerClass(163, 2340.1055,2454.6816,14.9688,90.5945, 0, 0, 0, 0, 0, 0); //Agent
	AddPlayerClass(165, 2340.1055,2454.6816,14.9688,90.5945, 0, 0, 0, 0, 0, 0); //Agent
	AddPlayerClass(164, 2340.1055,2454.6816,14.9688,90.5945, 0, 0, 0, 0, 0, 0); //Agent
	AddPlayerClass(124, 2180.7917,1285.6940,10.8203,269.2880, 0, 0, 0, 0, 0, 0); //Italian mafia
	AddPlayerClass(125, 2180.7917,1285.6940,10.8203,269.2880, 0, 0, 0, 0, 0, 0); //Italian mafia
	AddPlayerClass(126, 2180.7917,1285.6940,10.8203,269.2880, 0, 0, 0, 0, 0, 0); //Italian mafia
	AddPlayerClass(117, -1951.6971,719.2115,46.5625,356.7177, 0, 0, 0, 0, 0, 0); //Triads
	AddPlayerClass(118, -1951.6971,719.2115,46.5625,356.7177, 0, 0, 0, 0, 0, 0); //Triads
	AddPlayerClass(120, -1951.6971,719.2115,46.5625,356.7177, 0, 0, 0, 0, 0, 0); //Triads
	
	// Ierochu izveelne piedzimstot
	Weapons = CreateMenu("Ieroci", 1, 200.0, 100.0, 150.0, 0);
	AddMenuItem(Weapons, 0, "Brass Knuckles");
	AddMenuItem(Weapons, 0, "Nightstick");
	AddMenuItem(Weapons, 0, "Baseball Bat");
	Weapons2 = CreateMenu("Ieroci", 1, 200.0, 100.0, 150.0, 0);
	AddMenuItem(Weapons2, 0, "Colt 9mm");
	AddMenuItem(Weapons2, 0, "Silenced 9mm");
	AddMenuItem(Weapons2, 0, "Desert Eagle");
	Weapons3 = CreateMenu("Ieroci", 1, 200.0, 100.0, 150.0, 0);
	AddMenuItem(Weapons3, 0, "Uzi");
	AddMenuItem(Weapons3, 0, "Tec-9");
	AddMenuItem(Weapons3, 0, "MP5");
	
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	// Vieta, kur izveelas skinu
	SetPlayerInterior(playerid, 1);
	SetPlayerPos(playerid, 212.4732,-41.5509,1002.0234);
	SetPlayerCameraPos(playerid, 206.5633,-41.5915,1002.8047);
	SetPlayerCameraLookAt(playerid, 212.4732,-41.5509,1002.0234);
	SetPlayerFacingAngle(playerid,90.0000);
	// Animaacija ar beisbola nuuju
	SetPlayerAttachedObject(playerid, 1, 336, 6);
	ApplyAnimation(playerid, "CRACK", "Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0);
	// Teksta maina pie skina izveeles
 	gPlayerClass[playerid] = classid;
	switch (classid) {
		case 0:
	 	{
			GameTextForPlayer(playerid, "~w~~<~Mad Dog~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_WHITE);
		}
		case 1:
	 	{
			GameTextForPlayer(playerid, "~w~~<~Mad Dog~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_WHITE);
		}
		case 2:
	 	{
			GameTextForPlayer(playerid, "~w~~<~Mad Dog~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_WHITE);
		}
		case 3:
	 	{
			GameTextForPlayer(playerid, "~g~~<~Gangster~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_GREEN);
		}
		case 4:
	 	{
			GameTextForPlayer(playerid, "~g~~<~Gangster~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_GREEN);
		}
		case 5:
	 	{
			GameTextForPlayer(playerid, "~g~~<~Gangster~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_GREEN);
		}
		case 6:
	 	{
			GameTextForPlayer(playerid, "~p~~<~Chick~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_PINK);
		}
		case 7:
	 	{
			GameTextForPlayer(playerid, "~p~~<~Chick~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_PINK);
		}
		case 8:
	 	{
			GameTextForPlayer(playerid, "~p~~<~Chick~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_PINK);
		}
		case 9:
	 	{
			GameTextForPlayer(playerid, "~b~~<~Agent~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_BLUE);
		}
		case 10:
	 	{
			GameTextForPlayer(playerid, "~b~~<~Agent~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_BLUE);
		}
		case 11:
	 	{
			GameTextForPlayer(playerid, "~b~~<~Agent~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_BLUE);
		}
		case 12:
	 	{
			GameTextForPlayer(playerid, "~r~~<~Mafia~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_RED);
		}
		case 13:
	 	{
			GameTextForPlayer(playerid, "~r~~<~Mafia~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_RED);
		}
		case 14:
	 	{
			GameTextForPlayer(playerid, "~r~~<~Mafia~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_RED);
		}
		case 15:
	 	{
			GameTextForPlayer(playerid, "~y~~<~Triads~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_YELLOW);
		}
		case 16:
	 	{
			GameTextForPlayer(playerid, "~y~~<~Triads~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_YELLOW);
		}
		case 17:
	 	{
			GameTextForPlayer(playerid, "~y~~<~Triads~>~", 1000, 3);
			SetPlayerColor(playerid, COLOR_YELLOW);
		}
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	// Paraada laiku un datumu
 	SetTimer("settime",1000,true);
	DateUp = TextDrawCreate(547.000000,11.000000,"--");
	TextDrawFont(DateUp,3);
	TextDrawLetterSize(DateUp,0.399999,1.600000);
    TextDrawColor(DateUp,0xffffffff);
	TimeUp = TextDrawCreate(547.000000,28.000000,"--");
	TextDrawFont(TimeUp,3);
	TextDrawLetterSize(TimeUp,0.399999,1.600000);
	TextDrawColor(TimeUp,0xffffffff);
	SetTimer("settime",1000,true);
	
	// Sveiciena zina 
 	SendClientMessage(playerid,COLOR_WHITE,"Laipni luugts {B7FF00}JAANA BEERTINA{FFFFFF} Bakalaura darba serverii!");
	SendClientMessage(playerid,COLOR_WHITE,"Informaacija par serveri, servera komandaam un teleportiem - /help.");

	//Pazinojums par speeleetaaja pievienoshanos serverim
	new pname[MAX_PLAYER_NAME], str[256];
    GetPlayerName(playerid, pname, sizeof(pname));
    format(str, sizeof(str), "PUBLIC: %s pievienojaas serverim.", pname);

    SendClientMessageToAll(COLOR_GREY, str);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    // Pasleepj laiku un datumu
    TextDrawHideForPlayer(playerid, TimeUp), TextDrawHideForPlayer(playerid, DateUp);

	// Pazinojums par speeleetaaju, kursh pamet serveri
    new pname[MAX_PLAYER_NAME], string[39 + MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, sizeof(pname));
    switch(reason)
    {
	    case 0: format(string, sizeof(string), "PUBLIC: %s pameta serveri. (Zudis savienojums)", pname);
	    case 1: format(string, sizeof(string), "PUBLIC: %s pameta serveri. (Aiziet)", pname);
	    case 2: format(string, sizeof(string), "PUBLIC: %s pameta serveri. (Kikots/Banots)", pname);
    }
    SendClientMessageToAll(COLOR_WHITE, string);
	return 1;
}

public OnPlayerSpawn(playerid)
{
   	// Uzstaada speeleetaaja interjeru uz 0
	SetPlayerInterior(playerid,0);

	// Paraada laiku un datumu
	TextDrawShowForPlayer(playerid, TimeUp), TextDrawShowForPlayer(playerid, DateUp);

	// Paraada ierochu izveelni
	ShowMenuForPlayer(Weapons,playerid);
	TogglePlayerControllable(playerid,false);

	// Uzstaada ierochu prasmi uz vismazaako
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 1);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 1);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 1);

	// Paraada speeleetaaju mapee
	SetPlayerMapIcon(playerid,12,-1577.3420,119.7031,3.1145,55,0,MAPICON_GLOBAL_CHECKPOINT);
	return 1;

}

public OnPlayerDeath(playerid, killerid, reason)
{
	// Ieskeedz nogalinaato sarakstu
    if(killerid == INVALID_PLAYER_ID)
    {
    	SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
    }
    else
    {
    	SendDeathMessage(killerid,playerid,reason);
    }
	return 1;
}

public OnPlayerText(playerid, text[])
{
    //printf("%d %d",playerid,text);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	// Mainiigie
	new cmd[256];
	new	tmp[256];
	// Prieksh givecash
	new	idx;
	cmd = strtok(cmdtext, idx);
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new giveplayerid, moneys;
	// Prieksh pm
	new Message[256];
	new gMessage[256];
	new pName[MAX_PLAYER_NAME+1];
	new iName[MAX_PLAYER_NAME+1];

	// Help
	if (strcmp("/help", cmdtext, true, 10) == 0) {
	    SendClientMessage(playerid, COLOR_LIME, "INFORMAACIJA");
	    SendClientMessage(playerid, COLOR_WHITE, "Lietotaaju komandas: /stats, /report, /givecash, /pm, /export, /team, /kill.");
	    SendClientMessage(playerid, COLOR_WHITE, "Ipashumu komandas: /buyproperty, /sellproperty, /myproperties.");
	    SendClientMessage(playerid, COLOR_WHITE, "Automashiinu komandas: /fix");
	    SendClientMessage(playerid, COLOR_WHITE, "Liimeni: /levels, /dlevels, /buylevel");
	    SendClientMessage(playerid, COLOR_WHITE, "Teleporti: /teles, /mteles");
	    return 1;
	}

	// Iespeeja nomainiit komandu, liidz ko nomirst
	if (strcmp("/team", cmdtext, true, 10) == 0) {
// 		printf("%d %d", playerid, cmdtext);
	    SendClientMessage(playerid, COLOR_GREY, "Tev buus iespeja nomainiit savu komandu tikai peec naaves!");
	    ForceClassSelection(playerid);
	    return 1;
	}

	// Izdariit pashnaaviibu
	if (strcmp("/kill", cmdtext, true, 10) == 0) {
//		printf("%d %d", playerid, cmdtext);
	    SetPlayerHealth(playerid, 0);
	    return 1;
	}

	// Salabot mashiinu
	if (strcmp("/fix", cmdtext, true, 10) == 0) {
//	    printf("%d %d", playerid, cmdtext);
	    if (IsPlayerInAnyVehicle(playerid))
	        if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            RepairVehicle(GetPlayerVehicleID(playerid));
	            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	        }
	    else {
	        SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
	    } else {
	        SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
	    }
	    return 1;
	}

	// Naudas suutiishana citam lietotaajam
	if (strcmp(cmd, "/givecash", true) == 0) {
	    tmp = strtok(cmdtext, idx);
	    if (!strlen(tmp)) {
	        SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /givecash [ID] [Summa]");
	        return 1;
	    }
	    giveplayerid = strval(tmp);
	    tmp = strtok(cmdtext, idx);
	    if (!strlen(tmp)) {
	        SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /givecash [ID] [Summa]");
	        return 1;
	    }
	    moneys = strval(tmp);
	    // paraada konsulee
//	    printf("GIVECASH: %d %d %d",giveplayerid,moneys, playerid);
	    if (IsPlayerConnected(giveplayerid)) {
	        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
	        GetPlayerName(playerid, sendername, sizeof(sendername));
	        playermoney = GetPlayerMoney(playerid);
	        if (moneys > 0 && playermoney >= moneys) {
	            // new shit
	            if (giveplayerid == playerid) {
	                SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari suutiit pats sev naudu!");
	            } else {
	                GivePlayerMoney(playerid, (0 - moneys));
	                GivePlayerMoney(giveplayerid, moneys);
	                format(string, sizeof(string), "Tu %s(ID: %d) iedevi $%d.", giveplayer, giveplayerid, moneys);
	                SendClientMessage(playerid, COLOR_YELLOW, string);
	                format(string, sizeof(string), "Tu saneemi $%d no %s(ID: %d).", moneys, sendername, playerid);
	                SendClientMessage(giveplayerid, COLOR_YELLOW, string);
//	                printf("%s(playerid:%d) iedeva %d spçlçtâjam %s(ID:%d)", sendername, playerid, moneys, giveplayer, giveplayerid);
	            }
	        } else {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari suutiit pats sev naudu!");
	        }
	    } else {
	        format(string, sizeof(string), "Speeleetaajs ar ID:%d nav piesleedzies.", giveplayerid);
	        SendClientMessage(playerid, COLOR_BRIGHTRED, string);
	    }
	    return 1;
	}

	// Privaatas zinas suutiishana citam lietotaajam
	if (strcmp("/pm", cmd, true) == 0) {
	    tmp = strtok(cmdtext, idx);
	    if (!strlen(tmp) || strlen(tmp) > 5) {
	        SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /pm [ID] [Zina]");
	        return 1;
	    }
	    new id = strval(tmp);
	    gMessage = strrest(cmdtext, idx);
	    if (!strlen(gMessage)) {
	        SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /pm [ID] [Zina]");
	        return 1;
	    }
	    if (!IsPlayerConnected(id)) {
	        format(string, sizeof(string), "Speeleetaajs ar ID:%d nav piesleedzies.", id);
	        SendClientMessage(playerid, COLOR_BRIGHTRED, string);
	        return 1;
	    }
	    if (playerid != id) {
//	        printf("PM: %d %d %d", playerid, pName, gMessage);
	        GetPlayerName(id, iName, sizeof(iName));
	        GetPlayerName(playerid, pName, sizeof(pName));
	        format(Message, sizeof(Message), ">> %s(%d): %s", iName, id, gMessage);
	        SendClientMessage(playerid, COLOR_YELLOW, Message);
	        format(Message, sizeof(Message), "** %s(%d): %s", pName, playerid, gMessage);
	        SendClientMessage(id, COLOR_YELLOW, Message);
	        PlayerPlaySound(id, 1085, 0.0, 0.0, 0.0);
//	        printf("PM: %s", Message);
	    } else {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari rakstît PM pats sev!");
	    }
	    return 1;
	}
	return SendClientMessage(playerid, COLOR_WHITE, "{B7FF00}SERVERIS:{FFFFFF} Nepareiza komanda! Lieto {B7FF00}/help{FFFFFF}, lai apskatiitu komandas!");
	
}


// Ierochu izveele pie spawn
public OnPlayerSelectedMenuRow(playerid, row) {
    new Menu: CurrentMenu = GetPlayerMenu(playerid);
    if (CurrentMenu == Weapons) {
        switch (row) {
            case 0: // Brass Knuckles
                {
                    GivePlayerWeapon(playerid, 1, 1);
                    ShowMenuForPlayer(Weapons2, playerid);
                }
            case 1: // Nightstick
                {
                    GivePlayerWeapon(playerid, 3, 1);
                    ShowMenuForPlayer(Weapons2, playerid);
                }
            case 2: // Baseball Bat
                {
                    GivePlayerWeapon(playerid, 5, 1);
                    ShowMenuForPlayer(Weapons2, playerid);
                }
        }
    }
    if (CurrentMenu == Weapons2) {
        switch (row) {
            case 0: // Colt 9mm
                {
                    GivePlayerWeapon(playerid, 22, 100);
                    ShowMenuForPlayer(Weapons3, playerid);
                }
            case 1: // Silenced 9mm
                {
                    GivePlayerWeapon(playerid, 23, 100);
                    ShowMenuForPlayer(Weapons3, playerid);
                }
            case 2: // Desert Eagle
                {
                    GivePlayerWeapon(playerid, 24, 100);
                    ShowMenuForPlayer(Weapons3, playerid);
                }
        }
    }
    if (CurrentMenu == Weapons3) {
        switch (row) {
            case 0: // Uzi
                {
                    GivePlayerWeapon(playerid, 28, 250);
                    TogglePlayerControllable(playerid, true);
                }
            case 1: // Tec-9
                {
                    GivePlayerWeapon(playerid, 32, 250);
                    TogglePlayerControllable(playerid, true);
                }
            case 2: // MP5
                {
                    GivePlayerWeapon(playerid, 29, 250);
                    TogglePlayerControllable(playerid, true);
                }
        }
    }
    return 1;
}

public OnPlayerExitedMenu(playerid){
    TogglePlayerControllable(playerid,true);
	return 1;
}

// Prieksh laika un datuma
forward settime(playerid);
public settime(playerid) {
    new string[256], year, month, day, hours, minutes, seconds;
    getdate(year, month, day), gettime(hours, minutes, seconds);
    format(string, sizeof string, "%d/%s%d/%s%d", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year);
    TextDrawSetString(DateUp, string);
    format(string, sizeof string, "%s%d:%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes, (seconds < 10) ? ("0") : (""), seconds);
    TextDrawSetString(TimeUp, string);
}

// Prieksh pm zinas
stock strrest(const string[], & index) {
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' ')) {
        index++;
    }
    new offset = index;
    new result[128];
    while ((index < length) && ((index - offset) < (sizeof(result) - 1))) {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}
/*******************************************************************************

								GAMEMODE BEIGAS

*******************************************************************************/

