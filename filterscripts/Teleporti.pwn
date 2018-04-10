#include <a_samp>

// KRAASU DEFINEESHANA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIME 0x99FF00AA

// Teleportu defineetie mainiigie prieksh dialoga loga
#define TELES 12
#define LIDOSTAS 13
#define DRIFTI 14
#define MAZPILSETAS 15
#define TUNETAVAS 16
#define LS 18
#define SF 19
#define LV 20

public OnPlayerCommandText(playerid, cmdtext[]) {

	// Teleportu saraksts chataa
    if (strcmp("/teles", cmdtext, true, 10) == 0)
	{
	 	SendClientMessage(playerid,COLOR_LIME,"TELEPORTI");
		SendClientMessage(playerid, COLOR_WHITE, "/area51, /vinewood, /grove, /docks, /garage, /4dragons, /jmotel, /5towers, /jizzy, /malvada, /drift[1-14],");
		SendClientMessage(playerid, COLOR_WHITE, "/bayside, /movieset, /dunes, /skatepark, /djump, /smbeach, /canal, /forest, /hotel, /quarry, /hippy,");
		SendClientMessage(playerid, COLOR_WHITE, "/lsair, /sfair, /lvair, /oldair, /ottosauto, /chilliad, /stadium, /junkjard, /ranch, /ccasino, /mdcrib,");
		SendClientMessage(playerid, COLOR_WHITE, "/town[1-5], /lspd, /sfpd, /lvpd, /arch, /locolow, /lvtrans, /lstrans.");
		return 1;
	}
	
	// Teleportu saraksts dialoga logaa
    if (strcmp(cmdtext, "/mteles", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        ShowPlayerDialog(playerid, TELES, DIALOG_STYLE_LIST, "Teleporti", " Lidostas\r\n Drift zonas\r\n Mazpilsetas\r\n Tunetavas\r\n Los Santos\r\n San Fierro\r\n Las Venturas", "Labi", "Atcelt");
        return 1;
    }

    // AREA 51
    if (strcmp(cmdtext, "/area51", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 214.5073,1913.3160,17.6406);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 177.8107);
            GameTextForPlayer(playerid, "Area 51", 1700, 6);
        } else {
            SetPlayerPos(playerid, 214.5073,1913.3160,17.6406);
            SetPlayerFacingAngle(playerid, 177.8107);
            GameTextForPlayer(playerid, "Area 51", 1700, 6);
        }
        return 1;
    }

    // VINEWOOD
    if (strcmp(cmdtext, "/vinewood", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1382.6194, -888.5532, 38.0863);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.0000);
            GameTextForPlayer(playerid, "Vinewood", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1382.6194, -888.5532, 38.0863);
            SetPlayerFacingAngle(playerid, 0.0000);
            GameTextForPlayer(playerid, "Vinewood", 1700, 6);
        }
        return 1;
    }
    // GROVE STREET
    if (strcmp(cmdtext, "/grove", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2497.9172,-1666.7535,13.3441);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.6666);
            GameTextForPlayer(playerid, "Grove street", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2497.9172,-1666.7535,13.3441);
            SetPlayerFacingAngle(playerid, 91.6666);
            GameTextForPlayer(playerid, "Grove street", 1700, 6);
        }
        return 1;
    }

    // DOCKS IN LS
    if (strcmp(cmdtext, "/docks", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2759.9070,-2440.6570,13.5125);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 355.519);
            GameTextForPlayer(playerid, "Docks", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2759.9070,-2440.6570,13.5125);
            SetPlayerFacingAngle(playerid, 355.519);
            GameTextForPlayer(playerid, "Docks", 1700, 6);
        }
        return 1;
    }

    // CJ`S DOHERTY GARAGE IN SF
    if (strcmp(cmdtext, "/garage", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2023.8254,174.4654,28.8359);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.6050);
            GameTextForPlayer(playerid, "Doherty Garage", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2023.8254,174.4654,28.8359);
            SetPlayerFacingAngle(playerid, 270.6050);
            GameTextForPlayer(playerid, "Doherty Garage", 1700, 6);
        }
        return 1;
    }

    // 4 DRAGONS CASINO
    if (strcmp(cmdtext, "/4dragons", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2032.1162, 1008.2006, 10.8203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 267.0018);
            GameTextForPlayer(playerid, "4Dragons Casino", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2032.1162, 1008.2006, 10.8203);
            SetPlayerFacingAngle(playerid, 267.0018);
            GameTextForPlayer(playerid, "4Dragons Casino", 1700, 6);
        }
        return 1;
    }

    // BAYSIDE
    if (strcmp(cmdtext, "/bayside", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2261.7222, 2290.5598, 4.8202);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 358.2453);
            GameTextForPlayer(playerid, "Bayside", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2261.7222, 2290.5598, 4.8202);
            SetPlayerFacingAngle(playerid, 358.2453);
            GameTextForPlayer(playerid, "Bayside", 1700, 6);
        }
        return 1;
    }

    // DESERT JUMP
    if (strcmp(cmdtext, "/djump", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -673.3369,2306.3269,134.7616);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 88.0000);
            GameTextForPlayer(playerid, "Desert jump", 1700, 6);
        } else {
            SetPlayerPos(playerid, -673.3369,2306.3269,134.7616);
            SetPlayerFacingAngle(playerid, 88.0000);
            GameTextForPlayer(playerid, "Desert jump", 1700, 6);
        }
        return 1;
    }

    // DRIFT 1
    if (strcmp(cmdtext, "/drift1", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1254.6299, -2027.0791, 59.4393);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.6426);
            GameTextForPlayer(playerid, "Drift 1", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1254.6299, -2027.0791, 59.4393);
            SetPlayerFacingAngle(playerid, 270.6426);
            GameTextForPlayer(playerid, "Drift 1", 1700, 6);
        }
        return 1;
    }

    // DRIFT 2
    if (strcmp(cmdtext, "/drift2", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2593.9050, -2441.9844, 13.6267);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 354.3026);
            GameTextForPlayer(playerid, "Drift 2", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2593.9050, -2441.9844, 13.6267);
            SetPlayerFacingAngle(playerid, 354.3026);
            GameTextForPlayer(playerid, "Drift 2", 1700, 6);
        }
        return 1;
    }

    // DRIFT 3
    if (strcmp(cmdtext, "/drift3", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2807.7927, -1435.5458, 40.0450);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 175.7242);
            GameTextForPlayer(playerid, "Drift 3", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2807.7927, -1435.5458, 40.0450);
            SetPlayerFacingAngle(playerid, 175.7242);
            GameTextForPlayer(playerid, "Drift 3", 1700, 6);
        }
        return 1;
    }

    // DRIFT 4
    if (strcmp(cmdtext, "/drift4", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1273.0135, -1365.0475, 118.7953);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 114.0438);
            GameTextForPlayer(playerid, "Drift 4", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1273.0135, -1365.0475, 118.7953);
            SetPlayerFacingAngle(playerid, 114.0438);
            GameTextForPlayer(playerid, "Drift 4", 1700, 6);
        }
        return 1;
    }

    // DRIFT 5
    if (strcmp(cmdtext, "/drift5", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -762.9998, -1692.9659, 97.1620);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 357.1927);
            GameTextForPlayer(playerid, "Drift 5", 1700, 6);
        } else {
            SetPlayerPos(playerid, -762.9998, -1692.9659, 97.1620);
            SetPlayerFacingAngle(playerid, 357.1927);
            GameTextForPlayer(playerid, "Drift 5", 1700, 6);
        }
        return 1;
    }

    // DRIFT 6
    if (strcmp(cmdtext, "/drift6", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2405.9675, -596.0287, 132.3281);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 124.1926);
            GameTextForPlayer(playerid, "Drift 6", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2405.9675, -596.0287, 132.3281);
            SetPlayerFacingAngle(playerid, 124.1926);
            GameTextForPlayer(playerid, "Drift 6", 1700, 6);
        }
        return 1;
    }

    // DRIFT 7
    if (strcmp(cmdtext, "/drift7", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2058.4185, 2376.7231, 49.5312);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 359.1201);
            GameTextForPlayer(playerid, "Drift 7", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2058.4185, 2376.7231, 49.5312);
            SetPlayerFacingAngle(playerid, 359.1201);
            GameTextForPlayer(playerid, "Drift 7", 1700, 6);
        }
        return 1;
    }

    // DRIFT 8
    if (strcmp(cmdtext, "/drift8", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2286.3958, 1935.7424, 31.7797);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 89.9643);
            GameTextForPlayer(playerid, "Drift 8", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2286.3958, 1935.7424, 31.7797);
            SetPlayerFacingAngle(playerid, 89.9643);
            GameTextForPlayer(playerid, "Drift 8", 1700, 6);
        }
        return 1;
    }

    // DRIFT 9
    if (strcmp(cmdtext, "/drift9", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -370.5519, 1578.7170, 76.0698);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 134.2737);
            GameTextForPlayer(playerid, "Drift 9", 1700, 6);
        } else {
            SetPlayerPos(playerid, -370.5519, 1578.7170, 76.0698);
            SetPlayerFacingAngle(playerid, 134.2737);
            GameTextForPlayer(playerid, "Drift 9", 1700, 6);
        }
        return 1;
    }

    // DRIFT 10
    if (strcmp(cmdtext, "/drift10", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2135.0884, 918.6184, 79.8516);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.1566);
            GameTextForPlayer(playerid, "Drift 10", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2135.0884, 918.6184, 79.8516);
            SetPlayerFacingAngle(playerid, 270.1566);
            GameTextForPlayer(playerid, "Drift 10", 1700, 6);
        }
        return 1;
    }

    // DRIFT 11
    if (strcmp(cmdtext, "/drift11", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2267.1318, 1398.3477, 42.8203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 265.5624);
            GameTextForPlayer(playerid, "Drift 11", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2267.1318, 1398.3477, 42.8203);
            SetPlayerFacingAngle(playerid, 265.5624);
            GameTextForPlayer(playerid, "Drift 11", 1700, 6);
        }
        return 1;
    }

    // DRIFT 12
    if (strcmp(cmdtext, "/drift12", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -632.8318, 2468.1130, 74.5528);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 49.2925);
            GameTextForPlayer(playerid, "Drift 12", 1700, 6);
        } else {
            SetPlayerPos(playerid, -632.8318, 2468.1130, 74.5528);
            SetPlayerFacingAngle(playerid, 49.2925);
            GameTextForPlayer(playerid, "Drift 12", 1700, 6);
        }
        return 1;
    }
    // DRIFT TRACK IN LV BIKE SCHOOL
    if (strcmp(cmdtext, "/drift13", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1154.4248, 1349.6830, 10.8203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.5257);
            GameTextForPlayer(playerid, "Drift 13", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1154.4248, 1349.6830, 10.8203);
            SetPlayerFacingAngle(playerid, 91.5257);
            GameTextForPlayer(playerid, "Drift 13", 1700, 6);
        }
        return 1;
    }

    // DRIFT TRACK IN SF DRIVING SCHOOL
    if (strcmp(cmdtext, "/drift14", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2087.8723, -116.2517, 35.3203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 269.0790);
            GameTextForPlayer(playerid, "Drift 14", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2087.8723, -116.2517, 35.3203);
            SetPlayerFacingAngle(playerid, 269.0790);
            GameTextForPlayer(playerid, "Drift 14", 1700, 6);
        }
        return 1;
    }

    // LAS VENTURAS AIRPORT
    if (strcmp(cmdtext, "/lvair", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1319.1837,1279.5657,10.8203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 356.4737);
            GameTextForPlayer(playerid, "Las Venturas Airport", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1319.1837,1279.5657,10.8203);
            SetPlayerFacingAngle(playerid, 356.4737);
            GameTextForPlayer(playerid, "Las Venturas Airport", 1700, 6);
        }
        return 1;
    }

    // LOS SANTOS AIRPORT
    if (strcmp(cmdtext, "/lsair", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1934.8811,-2305.5283,13.5469);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 182.1529);
            GameTextForPlayer(playerid, "Los Santos Airport", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1934.8811,-2305.5283,13.5469);
            SetPlayerFacingAngle(playerid, 182.1529);
            GameTextForPlayer(playerid, "Los Santos Airport", 1700, 6);
        }
        return 1;
    }

    // SAN FIERRO AIRPORT
    if (strcmp(cmdtext, "/sfair", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1331.5831,-216.6404,14.1484);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 314.0432);
            GameTextForPlayer(playerid, "San Fierro Airport", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1331.5831,-216.6404,14.14844);
            SetPlayerFacingAngle(playerid, 314.0432);
            GameTextForPlayer(playerid, "San Fierro Airport", 1700, 6);
        }
        return 1;
    }

    // OLD AIRPORT
    if (strcmp(cmdtext, "/oldair", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 385.4967,2538.5596,16.5391);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 177.5221);
            GameTextForPlayer(playerid, "Abandoned Airstrip", 1700, 6);
        } else {
            SetPlayerPos(playerid, 385.4967,2538.5596,16.5391);
            SetPlayerFacingAngle(playerid, 177.5221);
            GameTextForPlayer(playerid, "Abandoned Airstrip", 1700, 6);
        }
        return 1;
    }

    // OTTOS AUTO IN SF
    if (strcmp(cmdtext, "/ottosauto", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1642.3815, 1214.6411, 7.0391);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 225.8508);
            GameTextForPlayer(playerid, "Otto`s Auto", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1642.3815, 1214.6411, 7.0391);
            SetPlayerFacingAngle(playerid, 225.8508);
            GameTextForPlayer(playerid, "Otto`s Auto", 1700, 6);
        }
        return 1;
    }

    // MOUNTAIN CHILLIAD
    if (strcmp(cmdtext, "/chilliad", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2308.7378, -1656.6962, 483.6840);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 206.9879);
            GameTextForPlayer(playerid, "Chilliad", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2308.7378, -1656.6962, 483.6840);
            SetPlayerFacingAngle(playerid, 206.9879);
            GameTextForPlayer(playerid, "Chilliad", 1700, 6);
        }
        return 1;
    }

    // BASEBALL STADIUM IN LV
    if (strcmp(cmdtext, "/stadium", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1383.5419, 2185.1062, 11.0234);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 130.3693);
            GameTextForPlayer(playerid, "Baseball Stadium", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1383.5419, 2185.1062, 11.0234);
            SetPlayerFacingAngle(playerid, 130.3693);
            GameTextForPlayer(playerid, "Baseball Stadium", 1700, 6);
        }
        return 1;
    }

    // DUNES
    if (strcmp(cmdtext, "/dunes", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2611.1233, -2318.7329, 11.3069);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 59.6021);
            GameTextForPlayer(playerid, "Dunes", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2611.1233, -2318.7329, 11.3069);
            SetPlayerFacingAngle(playerid, 59.6021);
            GameTextForPlayer(playerid, "Dunes", 1700, 6);
        }
        return 1;
    }

    // FOREST
    if (strcmp(cmdtext, "/forest", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -511.9102,-87.1235,62.1672);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 175.7253);
            GameTextForPlayer(playerid, "San Fierro Forest", 1700, 6);
        } else {
            SetPlayerPos(playerid, -511.9102,-87.1235,62.1672);
            SetPlayerFacingAngle(playerid, 175.7253);
            GameTextForPlayer(playerid, "San Fierro Forest", 1700, 6);
        }
        return 1;
    }

    // RANCH
    if (strcmp(cmdtext, "/ranch", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -372.3780, 2187.6462, 42.0334);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 13.8315);
            GameTextForPlayer(playerid, "Ranch In Nowhere", 1700, 6);
        } else {
            SetPlayerPos(playerid, -372.3780, 2187.6462, 42.0334);
            SetPlayerFacingAngle(playerid, 13.8315);
            GameTextForPlayer(playerid, "Ranch In Nowhere", 1700, 6);
        }
        return 1;
    }

    // HIPPY FARM
    if (strcmp(cmdtext, "/hippy", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1087.7207, -1647.3049, 76.3739);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 268.5476);
            GameTextForPlayer(playerid, "Hippy World", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1087.7207, -1647.3049, 76.3739);
            SetPlayerFacingAngle(playerid, 268.5476);
            GameTextForPlayer(playerid, "Hippy World", 1700, 6);
        }
        return 1;
    }

    // MALVADA
    if (strcmp(cmdtext, "/malvada", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1297.5616, 2496.6252, 86.9875);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 195.4383);
            GameTextForPlayer(playerid, "Malvada", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1297.5616, 2496.6252, 86.9875);
            SetPlayerFacingAngle(playerid, 195.4383);
            GameTextForPlayer(playerid, "Malvada", 1700, 6);
        }
        return 1;
    }

    // HOTEL
    if (strcmp(cmdtext, "/hotel", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2727.5608, -309.9989, 7.0391);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 133.5857);
            GameTextForPlayer(playerid, "San Fierro Hotel", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2727.5608, -309.9989, 7.0391);
            SetPlayerFacingAngle(playerid, 133.5857);
            GameTextForPlayer(playerid, "San Fierro Hotel", 1700, 6);
        }
        return 1;
    }

    // CALIGULAS CASINO
    if (strcmp(cmdtext, "/ccasino", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2155.6875,1679.8540,10.6875);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 266.4393);
            GameTextForPlayer(playerid, "Caligulas Casion", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2155.6875,1679.8540,10.6875);
            SetPlayerFacingAngle(playerid, 266.4393);
            GameTextForPlayer(playerid, "Caligulas Casion", 1700, 6);
        }
        return 1;
    }

    // MOVIESET LS
    if (strcmp(cmdtext, "/movieset", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 929.8060, -1220.9590, 16.9220);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 93.8152);
            GameTextForPlayer(playerid, "Movieset", 1700, 6);
        } else {
            SetPlayerPos(playerid, 929.8060, -1220.9590, 16.9220);
            SetPlayerFacingAngle(playerid, 93.8152);
            GameTextForPlayer(playerid, "Movieset", 1700, 6);
        }
        return 1;
    }

    // CANAL IN LS
    if (strcmp(cmdtext, "/canal", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2604.9971, -1477.0031, 16.6674);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 174.9320);
            GameTextForPlayer(playerid, "Los Santos Canal", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2604.9971, -1477.0031, 16.6674);
            SetPlayerFacingAngle(playerid, 174.9320);
            GameTextForPlayer(playerid, "Los Santos Canal", 1700, 6);
        }
        return 1;
    }

    // JUNKYARD SF
    if (strcmp(cmdtext, "/junkyard", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1888.8149, -1712.0717, 21.7500);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 338.5562);
            GameTextForPlayer(playerid, "Junkyard", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1888.8149, -1712.0717, 21.7500);
            SetPlayerFacingAngle(playerid, 338.5562);
            GameTextForPlayer(playerid, "Junkyard", 1700, 6);
        }
        return 1;
    }

    // QUARRY LV
    if (strcmp(cmdtext, "/quarry", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 820.1353, 846.7553, 10.8806);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 107.9949);
            GameTextForPlayer(playerid, "Quarry", 1700, 6);
        } else {
            SetPlayerPos(playerid, 820.1353, 846.7553, 10.8806);
            SetPlayerFacingAngle(playerid, 107.9949);
            GameTextForPlayer(playerid, "Quarry", 1700, 6);
        }
        return 1;
    }

    // 5 TOWERS LS
    if (strcmp(cmdtext, "/5towers", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1668.0607, -1715.1782, 20.4844);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 89.2808);
            GameTextForPlayer(playerid, "Los Santos 5 Towers", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1668.0607, -1715.1782, 20.4844);
            SetPlayerFacingAngle(playerid, 89.2808);
            GameTextForPlayer(playerid, "Los Santos 5 Towers", 1700, 6);
        }
        return 1;
    }

    // TOWN 1 - PALOMINO CREEK
    if (strcmp(cmdtext, "/town1", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2231.1831, 159.1095, 27.0583);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 179.0595);
            GameTextForPlayer(playerid, "Palomino Creek", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2231.1831, 159.1095, 27.0583);
            SetPlayerFacingAngle(playerid, 179.0595);
            GameTextForPlayer(playerid, "Palomino Creek", 1700, 6);
        }
        return 1;
    }

    // TOWN 2 - MONTGOMERY
    if (strcmp(cmdtext, "/town2", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1294.0902, 218.1614, 19.5547);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 65.2725);
            GameTextForPlayer(playerid, "Montgomery", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1294.0902, 218.1614, 19.5547);
            SetPlayerFacingAngle(playerid, 65.2725);
            GameTextForPlayer(playerid, "Montgomery", 1700, 6);
        }
        return 1;
    }

    // TOWN 3 - DILLAMORE
    if (strcmp(cmdtext, "/town3", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 772.0282, -548.9765, 17.0284);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.3874);
            GameTextForPlayer(playerid, "Dillamore", 1700, 6);
        } else {
            SetPlayerPos(playerid, 772.0282, -548.9765, 17.0284);
            SetPlayerFacingAngle(playerid, 0.3874);
            GameTextForPlayer(playerid, "Dillamore", 1700, 6);
        }
        return 1;
    }

    // TOWN 4 - BLUEBERRY
    if (strcmp(cmdtext, "/town4", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 197.9940, -171.6521, 1.5781);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 88.5746);
            GameTextForPlayer(playerid, "Blueberry", 1700, 6);
        } else {
            SetPlayerPos(playerid, 197.9940, -171.6521, 1.5781);
            SetPlayerFacingAngle(playerid, 88.5746);
            GameTextForPlayer(playerid, "Blueberry", 1700, 6);
        }
        return 1;
    }

    // TOWN 5 - ANGEL PINE
    if (strcmp(cmdtext, "/town5", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2155.5208, -2468.1521, 30.6250);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 231.2580);
            GameTextForPlayer(playerid, "Angel Pine", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2155.5208, -2468.1521, 30.6250);
            SetPlayerFacingAngle(playerid, 231.2580);
            GameTextForPlayer(playerid, "Angel Pine", 1700, 6);
        }
        return 1;
    }

    // ARCH TRANSFENDER SF
    if (strcmp(cmdtext, "/arch", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2696.5745, 217.9548, 4.1797);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.6176);
            SetPlayerFacingAngle(playerid, 91.6176);
            GameTextForPlayer(playerid, "Arch Transfender", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2696.5745, 217.9548, 4.1797);
            SetPlayerFacingAngle(playerid, 91.6176);
            GameTextForPlayer(playerid, "Arch Transfender", 1700, 6);
        }
        return 1;
    }

    // LOCOLOW TRANSFENDER LS
    if (strcmp(cmdtext, "/locolow", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2644.8323, -2028.4680, 13.5469);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 178.5381);
            GameTextForPlayer(playerid, "Locolow Transfender", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2644.8323, -2028.4680, 13.5469);
            SetPlayerFacingAngle(playerid, 178.5381);
            GameTextForPlayer(playerid, "Locolow Transfender", 1700, 6);
        }
        return 1;
    }

    // LOS SANTOS TRANSFENDER
    if (strcmp(cmdtext, "/lstrans", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1041.2063, -1032.1448, 32.0238);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 358.8318);
            GameTextForPlayer(playerid, "LS Transfender", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1041.2063, -1032.1448, 32.0238);
            SetPlayerFacingAngle(playerid, 358.8318);
            GameTextForPlayer(playerid, "LS Transfender", 1700, 6);
        }
        return 1;
    }

    // LAS VENTURAS TRANSFENDER
    if (strcmp(cmdtext, "/lvtrans", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2385.7468, 1029.7635, 10.8203);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 355.3224);
            GameTextForPlayer(playerid, "LV Transfender", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2385.7468, 1029.7635, 10.8203);
            SetPlayerFacingAngle(playerid, 355.3224);
            GameTextForPlayer(playerid, "LV Transfender", 1700, 6);
        }
        return 1;
    }

    // LOS SANTOS POLICE DEPARTMENT
    if (strcmp(cmdtext, "/lspd", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1536.2205, -1675.2029, 13.3828);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 1.5414);
            GameTextForPlayer(playerid, "LS Police Department", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1536.2205, -1675.2029, 13.3828);
            SetPlayerFacingAngle(playerid, 1.5414);
            GameTextForPlayer(playerid, "LS Police Department", 1700, 6);
        }
        return 1;
    }

    // SAN FIERRO POLICE DEPARTMENT
    if (strcmp(cmdtext, "/sfpd", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -1630.0681,664.0426,7.1875);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 262.9265);
            GameTextForPlayer(playerid, "SF Police Department", 1700, 6);
        } else {
            SetPlayerPos(playerid, -1630.0681,664.0426,7.1875);
            SetPlayerFacingAngle(playerid, 262.9265);
            GameTextForPlayer(playerid, "SF Police Department", 1700, 6);
        }
        return 1;
    }

    // LAS VENTURAS POLICE DEPARTMENT
    if (strcmp(cmdtext, "/lvpd", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2227.7554,2453.9058,10.8701);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.0250);
            GameTextForPlayer(playerid, "LV Police Department", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2227.7554,2453.9058,10.8701);
            SetPlayerFacingAngle(playerid, 270.0250);
            GameTextForPlayer(playerid, "LV Police Department", 1700, 6);
        }
        return 1;
    }

    // SKATEPARK LS
    if (strcmp(cmdtext, "/skatepark", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1928.8911, -1400.7212, 13.5703);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 92.1199);
            GameTextForPlayer(playerid, "LS Skatepark", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1928.8911, -1400.7212, 13.5703);
            SetPlayerFacingAngle(playerid, 92.1199);
            GameTextForPlayer(playerid, "LS Skatepark", 1700, 6);
        }
        return 1;
    }
    
    // JIZZY`S PLEASURE DOME SF
    if (strcmp(cmdtext, "/jizzy", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2613.0125,1398.9583,7.0938);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 208.4489);
            GameTextForPlayer(playerid, "Jizzy`s Pleasure Dome", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2613.0125,1398.9583,7.0938);
            SetPlayerFacingAngle(playerid, 208.4489);
            GameTextForPlayer(playerid, "Jizzy`s Pleasure Dome", 1700, 6);
        }
        return 1;
    }
    
    // SANTA MARINA BEACH LS
    if (strcmp(cmdtext, "/smbeach", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 426.7906,-1798.3453,5.5469);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 181.1418);
            GameTextForPlayer(playerid, "Santa Marina Beach", 1700, 6);
        } else {
            SetPlayerPos(playerid, 426.7906,-1798.3453,5.5469);
            SetPlayerFacingAngle(playerid, 181.1418);
            GameTextForPlayer(playerid, "Santa Marina Beach", 1700, 6);
        }
        return 1;
    }
    
    // MADD DOGG`S CRIB LS
    if (strcmp(cmdtext, "/mdcrib", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1237.9805,-736.3685,95.6355);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 202.7854);
            GameTextForPlayer(playerid, "Madd Dogg`s Crib", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1237.9805,-736.3685,95.6355);
            SetPlayerFacingAngle(playerid, 202.7854);
            GameTextForPlayer(playerid, "Madd Dogg`s Crib", 1700, 6);
        }
        return 1;
    }
    
    // JEFFERSON MOTEL
    if (strcmp(cmdtext, "/jmotel", true) == 0) {
        if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
        if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2222.1292,-1166.6246,25.7331);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 357.8868);
            GameTextForPlayer(playerid, "Jefferson Motel", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2222.1292,-1166.6246,25.7331);
            SetPlayerFacingAngle(playerid, 357.8868);
            GameTextForPlayer(playerid, "Jefferson Motel", 1700, 6);
        }
        return 1;
    }
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	// TELEPORTU IZVEELE
    if (dialogid == TELES) {
        if (!response) {
            return 1;
        }

        // LIDOSTAS
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, LIDOSTAS, DIALOG_STYLE_LIST, "Teleports > Airports", " Los Santos Airport\r\n San Fierro Airport\r\n Las Venturas Airport\r\n Abandoned Airstrip", "Ok", "Cancel");
        }

        // DRIFTI
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, DRIFTI, DIALOG_STYLE_LIST, "Teleports > Drift places", " Drift 1\r\n Drift 2\r\n Drift 3\r\n Drift 4\r\n Drift 5\r\n Drift 6\r\n Drift 7\r\n Drift 8\r\n Drift 9\r\n Drift 10\r\n Drift 11\r\n Drift 12\r\n Drift 13\r\n Drift 14", "Ok", "ACancel");
        }

        // MAZPILSEETAS
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, MAZPILSETAS, DIALOG_STYLE_LIST, "Teleports > Towns", " Palomino Creek\r\n Montgomery\r\n Dillamore\r\n Blueberry\r\n Angel Pine", "Ok", "Cancel");
        }

        // TUNETAVAS
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, TUNETAVAS, DIALOG_STYLE_LIST, "Teleports > Transfenders", " Arch\r\n Locolow\r\n LS Transfender\r\n LV Transfender", "Ok", "Cancel");
        }

        // Los Santos
        if (listitem == 5) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, LS, DIALOG_STYLE_LIST, "Teleports > Los Santos", " Grove Street\r\n Vinewood\r\n Docks\r\n Jefferson Motel\r\n 5 Towers\r\n Movieset\r\n Dunes\r\n Skatepark\r\n Canal\r\n LS Police Department\r\n Hippy\r\n Madd Dogg`s Crib\r\n Santa Marina Beach", "Ok", "Cancel");
        }

        // San Fierro
        if (listitem == 6) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, SF, DIALOG_STYLE_LIST, "Teleports > San Fierro", " Doherty Garage\r\n Bayside\r\n Forest\r\n Otto`s Autos\r\n Chilliad\r\n Junkyard\r\n Hotel\r\n SF Police Department\r\n Jizzy`s Pleasure Dome", "Ok", "Cancel");
        }

        // Las Venturas
        if (listitem == 7) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            ShowPlayerDialog(playerid, LV, DIALOG_STYLE_LIST, "Teleports > Las Venturas", " Area 51\r\n 4 Dragons\r\n LV Police Department\r\n Desert Jump\r\n Baseball Stadium\r\n Ranch\r\n Caligulas Casino\r\n Quarry\r\n Malvada", "Ok", "Cancel");
        }
    }


    // LIDOSTU TELEPORTI
    if (dialogid == LIDOSTAS) {
        if (!response) {
            return 1;
        }

        // LS AIRPORT
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1934.8811,-2305.5283,13.5469);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 182.1529);
                GameTextForPlayer(playerid, "Los Santos Airport", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1934.8811,-2305.5283,13.5469);
                SetPlayerFacingAngle(playerid, 182.1529);
                GameTextForPlayer(playerid, "Los Santos Airport", 1700, 6);
            }
        }

        // SF AIRPORT
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1331.5831,-216.6404,14.1484);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 314.0432);
                GameTextForPlayer(playerid, "San Fierro Airport", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1331.5831,-216.6404,14.1484);
                SetPlayerFacingAngle(playerid, 314.0432);
                GameTextForPlayer(playerid, "San Fierro Airport", 1700, 6);
            }
        }

        // LV AIRPORT
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1319.1837,1279.5657,10.8203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 356.4737);
                GameTextForPlayer(playerid, "Las Venturas Airport", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1319.1837,1279.5657,10.8203);
                SetPlayerFacingAngle(playerid, 356.4737);
                GameTextForPlayer(playerid, "Las Venturas Airport", 1700, 6);
            }
        }

        // OLD AIRPORT
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 385.4967,2538.5596,16.5391);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 177.5221);
                GameTextForPlayer(playerid, "Abandoned Airstrip", 1700, 6);
            } else {
                SetPlayerPos(playerid, 385.4967,2538.5596,16.5391);
                SetPlayerFacingAngle(playerid, 177.5221);
                GameTextForPlayer(playerid, "Abandoned Airstrip", 1700, 6);
            }
        }
    }

	// DRIFTU TELEPORTI
    if (dialogid == DRIFTI) {
        if (!response) {
            return 1;
        }
        
        // DRIFT
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1254.6299, -2027.0791, 59.4393);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.6426);
                GameTextForPlayer(playerid, "Drift 1", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1254.6299, -2027.0791, 59.4393);
                SetPlayerFacingAngle(playerid, 270.6426);
                GameTextForPlayer(playerid, "Drift 1", 1700, 6);
            }
        }
        
    	// DRIFT 2
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2593.9050, -2441.9844, 13.6267);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 354.3026);
                GameTextForPlayer(playerid, "Drift 2", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2593.9050, -2441.9844, 13.6267);
                SetPlayerFacingAngle(playerid, 354.3026);
                GameTextForPlayer(playerid, "Drift 2", 1700, 6);
            }
        }
        
        // DRIFT 3
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2807.7927, -1435.5458, 40.0450);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 175.7242);
                GameTextForPlayer(playerid, "Drift 3", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2807.7927, -1435.5458, 40.0450);
                SetPlayerFacingAngle(playerid, 175.7242);
                GameTextForPlayer(playerid, "Drift 3", 1700, 6);
            }
        }
        
        // DRIFT 4
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1273.0135, -1365.0475, 118.7953);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 114.0438);
                GameTextForPlayer(playerid, "Drift 4", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1273.0135, -1365.0475, 118.7953);
                SetPlayerFacingAngle(playerid, 114.0438);
                GameTextForPlayer(playerid, "Drift 4", 1700, 6);
            }
        }
        
        // DRIFT 5
        if (listitem == 4) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -762.9998, -1692.9659, 97.1620);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 357.1927);
                GameTextForPlayer(playerid, "Drift 5", 1700, 6);
            } else {
                SetPlayerPos(playerid, -762.9998, -1692.9659, 97.1620);
                SetPlayerFacingAngle(playerid, 357.1927);
                GameTextForPlayer(playerid, "Drift 5", 1700, 6);
            }
        }
        
        // DRIFT 6
        if (listitem == 5) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2405.9675, -596.0287, 132.3281);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 124.1926);
                GameTextForPlayer(playerid, "Drift 6", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2405.9675, -596.0287, 132.3281);
                SetPlayerFacingAngle(playerid, 124.1926);
                GameTextForPlayer(playerid, "Drift 6", 1700, 6);
            }
        }
        
        // DRIFT 7
        if (listitem == 6) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2058.4185, 2376.7231, 49.5312);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 359.1201);
                GameTextForPlayer(playerid, "Drift 7", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2058.4185, 2376.7231, 49.5312);
                SetPlayerFacingAngle(playerid, 359.1201);
                GameTextForPlayer(playerid, "Drift 7", 1700, 6);
            }
        }
        
        // DRIFT 8
        if (listitem == 7) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2286.3958, 1935.7424, 31.7797);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 89.9643);
                GameTextForPlayer(playerid, "Drift 8", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2286.3958, 1935.7424, 31.7797);
                SetPlayerFacingAngle(playerid, 89.9643);
                GameTextForPlayer(playerid, "Drift 8", 1700, 6);
            }
        }
        
        // DRIFT 9
        if (listitem == 8) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -370.5519, 1578.7170, 76.0698);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 134.2737);
                GameTextForPlayer(playerid, "Drift 9", 1700, 6);
            } else {
                SetPlayerPos(playerid, -370.5519, 1578.7170, 76.0698);
                SetPlayerFacingAngle(playerid, 134.2737);
                GameTextForPlayer(playerid, "Drift 9", 1700, 6);
            }
        }
        
        // DRIFT 10
        if (listitem == 9) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2135.0884, 918.6184, 79.8516);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.1566);
                GameTextForPlayer(playerid, "Drift 10", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2135.0884, 918.6184, 79.8516);
                SetPlayerFacingAngle(playerid, 270.1566);
                GameTextForPlayer(playerid, "Drift 10", 1700, 6);
            }
        }
        
        // DRIFT 11
        if (listitem == 10) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2267.1318, 1398.3477, 42.8203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 265.5624);
                GameTextForPlayer(playerid, "Drift 11", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2267.1318, 1398.3477, 42.8203);
                SetPlayerFacingAngle(playerid, 265.5624);
                GameTextForPlayer(playerid, "Drift 11", 1700, 6);
            }
        }
        
        // DRIFT 12
        if (listitem == 11) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -632.8318, 2468.1130, 74.5528);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 49.2925);
                GameTextForPlayer(playerid, "Drift 12", 1700, 6);
            } else {
                SetPlayerPos(playerid, -632.8318, 2468.1130, 74.5528);
                SetPlayerFacingAngle(playerid, 49.2925);
                GameTextForPlayer(playerid, "Drift 12", 1700, 6);
            }
        }
        
        // DRIFT 13
        if (listitem == 12) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1154.4248, 1349.6830, 10.8203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.5257);
                GameTextForPlayer(playerid, "Drift 13", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1154.4248, 1349.6830, 10.8203);
                SetPlayerFacingAngle(playerid, 91.5257);
                GameTextForPlayer(playerid, "Drift 13", 1700, 6);
            }
        }
        
        // DRIFT 14
        if (listitem == 13) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2087.8723, -116.2517, 35.3203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 269.0790);
                GameTextForPlayer(playerid, "Drift 14", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2087.8723, -116.2517, 35.3203);
                SetPlayerFacingAngle(playerid, 269.0790);
                GameTextForPlayer(playerid, "Drift 14", 1700, 6);
            }
        }
    }

	// MAZPILSEETAS
    if (dialogid == MAZPILSETAS) {
        if (!response) {
            return 1;
        }
        // PALOMINO CREEK
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2231.1831, 159.1095, 27.0583);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 179.0595);
                GameTextForPlayer(playerid, "Palomino Creek", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2231.1831, 159.1095, 27.0583);
                SetPlayerFacingAngle(playerid, 179.0595);
                GameTextForPlayer(playerid, "Palomino Creek", 1700, 6);
            }
        }
        
        // MONTGOMERY
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1294.0902, 218.1614, 19.5547);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 65.2725);
                GameTextForPlayer(playerid, "Montgomery", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1294.0902, 218.1614, 19.5547);
                SetPlayerFacingAngle(playerid, 65.2725);
                GameTextForPlayer(playerid, "Montgomery", 1700, 6);
            }
        }
        
        // DILLAMORE
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 772.0282, -548.9765, 17.0284);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.3874);
                GameTextForPlayer(playerid, "Dillamore", 1700, 6);
            } else {
                SetPlayerPos(playerid, 772.0282, -548.9765, 17.0284);
                SetPlayerFacingAngle(playerid, 0.3874);
                GameTextForPlayer(playerid, "Dillamore", 1700, 6);
            }
        }
        
        // BLUEBERRY
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 197.9940, -171.6521, 1.5781);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 88.5746);
                GameTextForPlayer(playerid, "Blueberry", 1700, 6);
            } else {
                SetPlayerPos(playerid, 197.9940, -171.6521, 1.5781);
                SetPlayerFacingAngle(playerid, 88.5746);
                GameTextForPlayer(playerid, "Blueberry", 1700, 6);
            }
        }
        
        // ANGEL PINE
        if (listitem == 4) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2155.5208, -2468.1521, 30.6250);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 231.2580);
                GameTextForPlayer(playerid, "Angel Pine", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2155.5208, -2468.1521, 30.6250);
                SetPlayerFacingAngle(playerid, 231.2580);
                GameTextForPlayer(playerid, "Angel Pine", 1700, 6);
            }
        }
    }

	// AUTOMASHIINU TUUNEETAVAS
    if (dialogid == TUNETAVAS) {
        if (!response) {
            return 1;
        }
        
        // ARCH
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2696.5745, 217.9548, 4.1797);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.6176);
                SetPlayerFacingAngle(playerid, 91.6176);
                GameTextForPlayer(playerid, "Arch Transfender", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2696.5745, 217.9548, 4.1797);
                SetPlayerFacingAngle(playerid, 91.6176);
                GameTextForPlayer(playerid, "Arch Transfender", 1700, 6);
            }
        }
        
        // LOCOLOW
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2644.8323, -2028.4680, 13.5469);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 178.5381);
                GameTextForPlayer(playerid, "Locolow Transfender", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2644.8323, -2028.4680, 13.5469);
                SetPlayerFacingAngle(playerid, 178.5381);
                GameTextForPlayer(playerid, "Locolow Transfender", 1700, 6);
            }
        }
        // LS TRANS
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1041.2063, -1032.1448, 32.0238);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 358.8318);
                GameTextForPlayer(playerid, "LS Transfender", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1041.2063, -1032.1448, 32.0238);
                SetPlayerFacingAngle(playerid, 358.8318);
                GameTextForPlayer(playerid, "LS Transfender", 1700, 6);
            }
        }
        
        // LV TRANS
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2385.7468, 1029.7635, 10.8203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 355.3224);
                GameTextForPlayer(playerid, "LV Transfender", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2385.7468, 1029.7635, 10.8203);
                SetPlayerFacingAngle(playerid, 355.3224);
                GameTextForPlayer(playerid, "LV Transfender", 1700, 6);
            }
        }
    }
    
    // LOS SANTOS TELEPORTI
    if (dialogid == LS) {
        if (!response) {
            return 1;
        }
        
        // GROVE STREET
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2497.9172,-1666.7535,13.3441);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 91.6666);
                GameTextForPlayer(playerid, "Grove street", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2497.9172,-1666.7535,13.3441);
                SetPlayerFacingAngle(playerid, 91.6666);
                GameTextForPlayer(playerid, "Grove street", 1700, 6);
            }
        }
        
        // VINEWOOD
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1382.6194, -888.5532, 38.0863);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.0000);
                GameTextForPlayer(playerid, "Vinewood", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1382.6194, -888.5532, 38.0863);
                SetPlayerFacingAngle(playerid, 0.0000);
                GameTextForPlayer(playerid, "Vinewood", 1700, 6);
            }
        }
        
        // DOCKS
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2759.9070,-2440.6570,13.5125);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 355.5191);
                GameTextForPlayer(playerid, "Docks", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2759.9070,-2440.6570,13.5125);
                SetPlayerFacingAngle(playerid, 355.5191);
                GameTextForPlayer(playerid, "Docks", 1700, 6);
            }
        }
        
        // JEFFERSON MOTEL
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2222.1292,-1166.6246,25.7331);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 357.8868);
                GameTextForPlayer(playerid, "Jefferson Motel", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2222.1292,-1166.6246,25.7331);
                SetPlayerFacingAngle(playerid, 357.8868);
                GameTextForPlayer(playerid, "Jefferson Motel", 1700, 6);
            }
        }
        
        // 5 TOWERS
        if (listitem == 4) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1668.0607, -1715.1782, 20.4844);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 89.2808);
                GameTextForPlayer(playerid, "Los Santos 5 Towers", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1668.0607, -1715.1782, 20.4844);
                SetPlayerFacingAngle(playerid, 89.2808);
                GameTextForPlayer(playerid, "Los Santos 5 Towers", 1700, 6);
            }
        }
        
        // MOVIESET
        if (listitem == 5) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 929.8060, -1220.9590, 16.9220);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 93.8152);
                GameTextForPlayer(playerid, "Movieset", 1700, 6);
            } else {
                SetPlayerPos(playerid, 929.8060, -1220.9590, 16.9220);
                SetPlayerFacingAngle(playerid, 93.8152);
                GameTextForPlayer(playerid, "Movieset", 1700, 6);
            }
        }
        
        // DUNES
        if (listitem == 6) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2611.1233, -2318.7329, 11.3069);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 59.6021);
                GameTextForPlayer(playerid, "Dunes", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2611.1233, -2318.7329, 11.3069);
                SetPlayerFacingAngle(playerid, 59.6021);
                GameTextForPlayer(playerid, "Dunes", 1700, 6);
            }
        }
        
        // SKATEPARK
        if (listitem == 7) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1928.8911, -1400.7212, 13.5703);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 92.1199);
                GameTextForPlayer(playerid, "LS Skatepark", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1928.8911, -1400.7212, 13.5703);
                SetPlayerFacingAngle(playerid, 92.1199);
                GameTextForPlayer(playerid, "LS Skatepark", 1700, 6);
            }
        }
        
        // CANAL
        if (listitem == 8) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2604.9971, -1477.0031, 16.6674);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 174.9320);
                GameTextForPlayer(playerid, "Los Santos Canal", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2604.9971, -1477.0031, 16.6674);
                SetPlayerFacingAngle(playerid, 174.9320);
                GameTextForPlayer(playerid, "Los Santos Canal", 1700, 6);
            }
        }
        
        // LSPD
        if (listitem == 9) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1536.2205, -1675.2029, 13.3828);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 1.5414);
                GameTextForPlayer(playerid, "LS Police Department", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1536.2205, -1675.2029, 13.3828);
                SetPlayerFacingAngle(playerid, 1.5414);
                GameTextForPlayer(playerid, "LS Police Department", 1700, 6);
            }
        }
        
        // HIPPY FARM
        if (listitem == 10) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1087.7207, -1647.3049, 76.3739);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 268.5476);
                GameTextForPlayer(playerid, "Hippy World", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1087.7207, -1647.3049, 76.3739);
                SetPlayerFacingAngle(playerid, 268.5476);
                GameTextForPlayer(playerid, "Hippy World", 1700, 6);
            }
        }
        
        // MADD DOGG`S CRIB
        if (listitem == 11) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1237.9805,-736.3685,95.6355);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 202.7854);
                GameTextForPlayer(playerid, "Madd Dogg`s Crib", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1237.9805,-736.3685,95.6355);
                SetPlayerFacingAngle(playerid, 202.7854);
                GameTextForPlayer(playerid, "Madd Dogg`s Crib", 1700, 6);
            }
        }
        
        // SANTA MARINA BEACH
        if (listitem == 12) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 426.7906,-1798.3453,5.5469);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 181.1418);
                GameTextForPlayer(playerid, "Santa Marina Beach", 1700, 6);
            } else {
                SetPlayerPos(playerid, 426.7906,-1798.3453,5.5469);
                SetPlayerFacingAngle(playerid, 181.1418);
                GameTextForPlayer(playerid, "Santa Marina Beach", 1700, 6);
            }
        }
    }

	// SAN FIERRO TELEPORTI
    if (dialogid == SF) {
        if (!response) {
            return 1;
        }
        
        // CJ`S DOHERTY GARAGE
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2023.8254,174.4654,28.8359);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.6050);
                GameTextForPlayer(playerid, "Doherty Garage", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2023.8254,174.4654,28.8359);
                SetPlayerFacingAngle(playerid, 270.6050);
                GameTextForPlayer(playerid, "Doherty Garage", 1700, 6);
            }
        }
        
        
        // BAYSIDE
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2261.7222, 2290.5598, 4.8202);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 358.2453);
                GameTextForPlayer(playerid, "Bayside", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2261.7222, 2290.5598, 4.8202);
                SetPlayerFacingAngle(playerid, 358.2453);
                GameTextForPlayer(playerid, "Bayside", 1700, 6);
            }
        }
        
        // FOREST
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -511.9102,-87.1235,62.1672);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 175.7253);
                GameTextForPlayer(playerid, "San Fierro Forest", 1700, 6);
            } else {
                SetPlayerPos(playerid, -511.9102,-87.1235,62.1672);
                SetPlayerFacingAngle(playerid, 175.7253);
                GameTextForPlayer(playerid, "San Fierro Forest", 1700, 6);
            }
        }
        
        // OTTO`S AUTO
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1642.3815, 1214.6411, 7.0391);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 225.8508);
                GameTextForPlayer(playerid, "Otto`s Auto", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1642.3815, 1214.6411, 7.0391);
                SetPlayerFacingAngle(playerid, 225.8508);
                GameTextForPlayer(playerid, "Otto`s Auto", 1700, 6);
            }
        }
        
        // CHILLIAD
        if (listitem == 4) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2308.7378, -1656.6962, 483.6840);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 206.9879);
                GameTextForPlayer(playerid, "Chilliad", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2308.7378, -1656.6962, 483.6840);
                SetPlayerFacingAngle(playerid, 206.9879);
                GameTextForPlayer(playerid, "Chilliad", 1700, 6);
            }
        }
        
        // JUNKYARD
        if (listitem == 5) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1888.8149, -1712.0717, 21.7500);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 338.5562);
                GameTextForPlayer(playerid, "Junkyard", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1888.8149, -1712.0717, 21.7500);
                SetPlayerFacingAngle(playerid, 338.5562);
                GameTextForPlayer(playerid, "Junkyard", 1700, 6);
            }
        }
        
        // HOTEL
        if (listitem == 6) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2727.5608, -309.9989, 7.0391);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 133.5857);
                GameTextForPlayer(playerid, "San Fierro Hotel", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2727.5608, -309.9989, 7.0391);
                SetPlayerFacingAngle(playerid, 133.5857);
                GameTextForPlayer(playerid, "San Fierro Hotel", 1700, 6);
            }
        }
        
        // SFPD
        if (listitem == 7) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1630.0681,664.0426,7.1875);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 262.9265);
                GameTextForPlayer(playerid, "SF Police Department", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1630.0681,664.0426,7.1875);
                SetPlayerFacingAngle(playerid, 262.9265);
                GameTextForPlayer(playerid, "SF Police Department", 1700, 6);
            }
        }
        
        // JIZZY PLEASURE DOME
        if (listitem == 8) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -2613.0125,1398.9583,7.0938);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 208.4489);
                GameTextForPlayer(playerid, "Jizzy Pleasure Dome", 1700, 6);
            } else {
                SetPlayerPos(playerid, -2613.0125,1398.9583,7.0938);
                SetPlayerFacingAngle(playerid, 208.4489);
                GameTextForPlayer(playerid, "Jizzy Pleasure Dome", 1700, 6);
            }
        }
    }

	// LAS VENTURAS TELEPORTI
    if (dialogid == LV) {
        if (!response) {
            return 1;
        }
        
        // AREA 51
        if (listitem == 0) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 214.5073,1913.3160,17.6406);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 177.8107);
                GameTextForPlayer(playerid, "Area 51", 1700, 6);
            } else {
                SetPlayerPos(playerid, 214.5073,1913.3160,17.6406);
                SetPlayerFacingAngle(playerid, 177.8107);
                GameTextForPlayer(playerid, "Area 51", 1700, 6);
            }
        }
        
        // 4 DRAGONS CASINO
        if (listitem == 1) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2032.1162, 1008.2006, 10.8203);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 267.0018);
                GameTextForPlayer(playerid, "4Dragons Casino", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2032.1162, 1008.2006, 10.8203);
                SetPlayerFacingAngle(playerid, 267.0018);
                GameTextForPlayer(playerid, "4Dragons Casino", 1700, 6);
            }
        }
        
        // LVPD
        if (listitem == 2) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2227.7554,2453.9058,10.8701);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 270.0250);
                GameTextForPlayer(playerid, "LV Police Department", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2227.7554,2453.9058,10.8701);
                SetPlayerFacingAngle(playerid, 270.0250);
                GameTextForPlayer(playerid, "LV Police Department", 1700, 6);
            }
        }
        
        // DESERT JUMP
        if (listitem == 3) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -673.3369,2306.3269,134.7616);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 88.0000);
                GameTextForPlayer(playerid, "Desert Jump", 1700, 6);
            } else {
                SetPlayerPos(playerid, -673.3369,2306.3269,134.7616);
                SetPlayerFacingAngle(playerid, 88.0000);
                GameTextForPlayer(playerid, "Desert Jump", 1700, 6);
            }
        }
        
        // BASEBALL STADIUM
        if (listitem == 4) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 1383.5419, 2185.1062, 11.0234);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 130.3693);
                GameTextForPlayer(playerid, "Baseball Stadium", 1700, 6);
            } else {
                SetPlayerPos(playerid, 1383.5419, 2185.1062, 11.0234);
                SetPlayerFacingAngle(playerid, 130.3693);
                GameTextForPlayer(playerid, "Baseball Stadium", 1700, 6);
            }
        }
        
        // RANCH
        if (listitem == 5) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -372.3780, 2187.6462, 42.0334);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 13.8315);
                GameTextForPlayer(playerid, "Ranch In Nowhere", 1700, 6);
            } else {
                SetPlayerPos(playerid, -372.3780, 2187.6462, 42.0334);
                SetPlayerFacingAngle(playerid, 13.8315);
                GameTextForPlayer(playerid, "Ranch In Nowhere", 1700, 6);
            }
        }
        
        // CALIGULAS CASINO
        if (listitem == 6) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 2155.6875,1679.8540,10.6875);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 266.4393);
                GameTextForPlayer(playerid, "Caligula`s Casino", 1700, 6);
            } else {
                SetPlayerPos(playerid, 2155.6875,1679.8540,10.6875);
                SetPlayerFacingAngle(playerid, 266.4393);
                GameTextForPlayer(playerid, "Caligula`s Casino", 1700, 6);
            }
        }
        
		// QUARRY
        if (listitem == 7) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), 820.1353, 846.7553, 10.8806);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 107.9949);
                GameTextForPlayer(playerid, "Quarry", 1700, 6);
            } else {
                SetPlayerPos(playerid, 820.1353, 846.7553, 10.8806);
                SetPlayerFacingAngle(playerid, 107.9949);
                GameTextForPlayer(playerid, "Quarry", 1700, 6);
            }
        }
        
        // MALVADA
        if (listitem == 8) {
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid,COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            if (GetPVarInt(playerid, "Jailed") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties cietumaa teleporteeties nevar.");
            if (IsPlayerInAnyVehicle(playerid)) {
                SetVehiclePos(GetPlayerVehicleID(playerid), -1297.5616, 2496.6252, 86.9875);
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 195.4383);
                GameTextForPlayer(playerid, "Malvada", 1700, 6);
            } else {
                SetPlayerPos(playerid, -1297.5616, 2496.6252, 86.9875);
                SetPlayerFacingAngle(playerid, 195.4383);
                GameTextForPlayer(playerid, "Malvada", 1700, 6);
            }
        }
    }
    return 0;
}
