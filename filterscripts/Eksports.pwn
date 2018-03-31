#include <a_samp>
//#include <AC_FS>

#include <float>
#include <string>
#include <time>
#pragma tabsize 0

#define CHECKPOINT_NOEXPORT 0
#define CHECKPOINT_EXPORT 1
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_GRAD 0xB4B5B7AA
#define COLOR_VAGOS 0xFFC801C8
#define COLOR_LIGHTRED 0xFF0000AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_BLACK 0x000000ff
#define COLOR_BLUE 0x0000ffff
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_GREEN 0x33AA33AA

forward PlayerToPoint (Float:radi, playerid, Float:x, Float:y, Float:z);
forward ShowCheckpoint();
forward ScanVehicleStatus();
forward CarExport();
forward CoastExportCar(carid);

new MiniMission[MAX_PLAYERS];
new carselect[3];
new num1,num2,num3;
new Float:pX, Float:pY, Float:pZ;

new RandCarsX[20][1] = {
	{404},{405},{410},{413},{418},
	{419},{421},{422},{426},{436},
	{439},{445},{458},{466},{467},
	{474},{475},{479},{482},{483}
};

new RandCarsXL[20][1] = {
	{491},{492},{496},{500},{507},
	{516},{517},{518},{526},{527},
	{529},{533},{540},{542},{545},
	{546},{547},{549},{550},{551}
};

new RandCarsXXL[20][1] = {
	{555},{566},{579},{580},{585},
	{587},{589},{600},{602},{603},
	{536},{575},{534},{567},{535},
	{576},{412},{461},{468},{509}
};

new VehicleName[][] = {
	"Landstalker",
   	"Bravura",
   	"Buffalo",
   	"Linerunner",
   	"Pereniel",
   	"Sentinel",
   	"Dumper",
   	"Firetruck",
   	"Trashmaster",
   	"Stretch",
   	"Manana",
   	"Infernus",
   	"Voodoo",
   	"Pony",
   	"Mule",
   	"Cheetah",
   	"Ambulance",
   	"Leviathan",
   	"Moonbeam",
   	"Esperanto",
   	"Taxi",
   	"Washington",
   	"Bobcat",
   	"Mr Whoopee",
   	"BF Injection",
   	"Hunter",
   	"Premier",
   	"Enforcer",
   	"Securicar",
   	"Banshee",
   	"Predator",
   	"Bus",
   	"Rhino",
   	"Barracks",
   	"Hotknife",
   	"Trailer",
   	"Previon",
   	"Coach",
   	"Cabbie",
   	"Stallion",
   	"Rumpo",
   	"RC Bandit",
   	"Romero",
   	"Packer",
   	"Monster Truck",
   	"Admiral",
   	"Squalo",
   	"Seasparrow",
   	"Pizzaboy",
   	"Tram",
   	"Trailer",
   	"Turismo",
   	"Speeder",
   	"Reefer",
   	"Tropic",
   	"Flatbed",
   	"Yankee",
   	"Caddy",
   	"Solair",
   	"Berkley's RC Van",
   	"Skimmer",
   	"PCJ-600",
   	"Faggio",
   	"Freeway",
   	"RC Baron",
   	"RC Raider",
   	"Glendale",
   	"Oceanic",
   	"Sanchez",
   	"Sparrow",
   	"Patriot",
   	"Quad",
   	"Coastguard",
   	"Dinghy",
   	"Hermes",
   	"Sabre",
   	"Rustler",
   	"ZR-350",
   	"Walton",
   	"Regina",
   	"Comet",
   	"BMX",
   	"Burrito",
   	"Camper",
   	"Marquis",
   	"Baggage",
   	"Dozer",
   	"Maverick",
   	"News Chopper",
   	"Rancher",
   	"FBI Rancher",
   	"Virgo",
   	"Greenwood",
   	"Jetmax",
   	"Hotring",
   	"Sandking",
   	"Blista Compact",
   	"Police Maverick",
   	"Boxville",
   	"Benson",
   	"Mesa",
   	"RC Goblin",
   	"Hotring Racer",
   	"Hotring Racer",
 	"Bloodring Banger",
   	"Rancher",
   	"Super GT",
   	"Elegant",
   	"Journey",
   	"Bike",
   	"Mountain Bike",
   	"Beagle",
   	"Cropdust",
   	"Stunt",
   	"Tanker",
   	"RoadTrain",
   	"Nebula",
   	"Majestic",
   	"Buccaneer",
   	"Shamal",
   	"Hydra",
   	"FCR-900",
   	"NRG-500",
   	"HPV1000",
   	"Cement Truck",
   	"Tow Truck",
   	"Fortune",
   	"Cadrona",
   	"FBI Truck",
   	"Willard",
   	"Forklift",
   	"Tractor",
   	"Combine",
   	"Feltzer",
   	"Remington",
   	"Slamvan",
   	"Blade",
   	"Freight",
   	"Streak",
   	"Vortex",
   	"Vincent",
   	"Bullet",
   	"Clover",
   	"Sadler",
   	"Firetruck",
   	"Hustler",
   	"Intruder",
   	"Primo",
   	"Cargobob",
   	"Tampa",
   	"Sunrise",
   	"Merit",
   	"Utility",
   	"Nevada",
   	"Yosemite",
   	"Windsor",
   	"Monster Truck",
   	"Monster Truck",
   	"Uranus",
   	"Jester",
   	"Sultan",
   	"Stratum",
   	"Elegy",
   	"Raindance",
   	"RC Tiger",
   	"Flash",
   	"Tahoma",
   	"Savanna",
   	"Bandito",
   	"Freight",
   	"Trailer",
   	"Kart",
   	"Mower",
   	"Duneride",
   	"Sweeper",
   	"Broadway",
   	"Tornado",
   	"AT-400",
   	"DFT-30",
   	"Huntley",
   	"Stafford",
   	"BF-400",
   	"Newsvan",
   	"Tug",
   	"Trailer",
   	"Emperor",
   	"Wayfarer",
   	"Euros",
   	"Hotdog",
   	"Club",
   	"Trailer",
   	"Trailer",
   	"Andromada",
   	"Dodo",
   	"RC Cam",
   	"Launch",
   	"Police Car (LSPD)",
   	"Police Car (SFPD)",
   	"Police Car (LVPD)",
   	"Police Ranger",
   	"Picador",
   	"S.W.A.T. Van",
   	"Alpha",
   	"Phoenix",
   	"Glendale",
   	"Sadler",
   	"Luggage Trailer",
   	"Luggage Trailer",
 	"Stair Trailer",
   	"Boxville",
   	"Farm Plow",
   	"Utility Trailer"
};

public OnFilterScriptInit() {
    SetTimer("CarExport", 300000, 1);
    SetTimer("ShowCheckpoint", 1000, 1);
    SetTimer("ScanVehicleStatus", 1000, 1);
    pX = -1577.3334;
    pY = 119.9252;
    pZ = 3.5495;
    CarExport();
    return 1;
}

public CarExport() {
    new string[256];
    new randa = random(sizeof(RandCarsX));
    randa = random(sizeof(RandCarsX));
    carselect[0] = RandCarsX[randa][0];
    randa = random(sizeof(RandCarsXL));
    carselect[1] = RandCarsXL[randa][0];
    randa = random(sizeof(RandCarsXXL));
    carselect[2] = RandCarsXXL[randa][0];
    num1 = carselect[0] - 400;
    num2 = carselect[1] - 400;
    num3 = carselect[2] - 400;
    format(string, sizeof(string), "Eksporteejamaas mashiinas: %s, %s, %s ", VehicleName[num1], VehicleName[num2], VehicleName[num3]);
    SendClientMessageToAll(COLOR_WHITE, string);
    return 1;
}

public PlayerToPoint(Float: radi, playerid, Float: x, Float: y, Float: z) {
    new Float: oldposx, Float: oldposy, Float: oldposz;
    new Float: tempposx, Float: tempposy, Float: tempposz;
    GetPlayerPos(playerid, oldposx, oldposy, oldposz);
    tempposx = (oldposx - x);
    tempposy = (oldposy - y);
    tempposz = (oldposz - z);
    if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) {
        return 1;
    }
    return 0;
}

public ShowCheckpoint() {
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i)) {
            if (GetPlayerState(i) == 2) {
                if (PlayerToPoint(100, i, pX, pY, pZ)) {
                    SetPlayerCheckpoint(i, pX, pY, pZ, 4.0);
                } else if (MiniMission[i] == CHECKPOINT_NOEXPORT || MiniMission[i] == CHECKPOINT_EXPORT) {
                    DisablePlayerCheckpoint(i);
                }
            }
        }
    }
    return 1;
}

public ScanVehicleStatus() {
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerInAnyVehicle(i)) {
            new carmodel = GetVehicleModel(GetPlayerVehicleID(i));
            if (carmodel == carselect[0] || carmodel == carselect[1] || carmodel == carselect[2]) {
                MiniMission[i] = CHECKPOINT_EXPORT;
            }
        }
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    new string[255];
    if (strcmp(cmdtext, "/export", true) == 0) {
        format(string, sizeof(string), "Eksporteejamaas mashiinas: %s, %s, %s.", VehicleName[num1], VehicleName[num2], VehicleName[num3]);
        SendClientMessage(playerid, COLOR_WHITE, string);
        return 1;
    }
    return 0;
}

public OnPlayerExitVehicle(playerid, vehicleid) {
    if (MiniMission[playerid] == CHECKPOINT_EXPORT) {
        MiniMission[playerid] = CHECKPOINT_NOEXPORT;
    }
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
    if (newstate == PLAYER_STATE_DRIVER) {
        //new nstring[256];
        new newcar = GetPlayerVehicleID(playerid);
        new model = GetVehicleModel(newcar);
        if (model == carselect[0] || model == carselect[1] || model == carselect[2]) {
            MiniMission[playerid] = CHECKPOINT_EXPORT;
            SendClientMessage(playerid, COLOR_YELLOW, "Sho auto var nodot San Fierro ostaa.");
            SetPlayerCheckpoint(playerid, pX, pY, pZ, 4.0);
        }
    }
    return 1;
}

public CoastExportCar(carid){
	switch (carid) {

		case 401: return 5000;
		case 402: return 5000;
		case 403: return 5000;
		case 404: return 5000;
		case 405: return 7000;
		case 406: return 7000;
		case 407: return 7000;
		case 408: return 7000;
		case 409: return 5000;
		case 410: return 5000;
		case 411: return 5000;
		case 415: return 5000;
		case 416: return 10000;
		case 417: return 7000;
		case 420: return 5000;
		case 422: return 7000;
		case 423: return 5000;
		case 424: return 5000;
		case 426: return 5000;
		case 427: return 5000;
		case 428: return 5000;
		case 429: return 5000;
		case 432: return 5000;
		case 433: return 5000;
		case 434: return 5000;
		case 435: return 7000;
		case 436: return 7000;
		case 441: return 7000;
		case 442: return 5000;
		case 443: return 5000;
		case 444: return 5000;
		case 446: return 7000;
		case 447: return 7000;
		case 449: return 7000;
		case 450: return 7000;
		case 451: return 5000;
		case 452: return 7000;
		case 463: return 5000;
		case 464: return 7000;
		case 465: return 7000;
		case 466: return 7000;
		case 467: return 5000;
		case 468: return 8000;
		case 469: return 7000;
		case 470: return 5000;
		case 471: return 7000;
		case 473: return 7000;
		case 474: return 8000;
		case 475: return 5000;
		case 476: return 7000;
		case 477: return 5000;
		case 480: return 5000;
		case 481: return 5000;

		default: return 7000;

	}
return 1;
}

public OnPlayerEnterCheckpoint(playerid) {
    new string[128];
    //new name[MAX_PLAYER_NAME];
    switch (MiniMission[playerid]) {
        case CHECKPOINT_EXPORT:
            {
                if (IsPlayerInAnyVehicle(playerid)) {
                    new carmodel = GetVehicleModel(GetPlayerVehicleID(playerid));
                    new carcoast = CoastExportCar(carmodel);
                    if (carmodel == carselect[0] || carmodel == carselect[1] || carmodel == carselect[2]) {
                        GivePlayerMoney(playerid, carcoast);
                        DisablePlayerCheckpoint(playerid);
                        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
                        format(string, sizeof(string), "Tu nodevi %s, un saneemi $%d.", VehicleName[carmodel - 400], carcoast);
                        SendClientMessage(playerid, COLOR_YELLOW, string);
                        MiniMission[playerid] = CHECKPOINT_NOEXPORT;
                    }
                }
            }
        case CHECKPOINT_NOEXPORT:
            {
                if (IsPlayerInAnyVehicle(playerid)) {
                    GameTextForPlayer(playerid, "Sho auto tagad nepienemam.", 2500, 3);
                }
            }
    }
    return 1;
}
