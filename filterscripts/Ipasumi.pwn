#include <a_samp>
//#include <AC_FS>
#include <properties>

// DEFINIICIJAS
#define COLOR_BRIGHTRED 0xFF6C6CFF

public OnFilterScriptInit(){
	UsePropertyTextDraw(0);
	SetMaxPropertiesPerPlayer(3);
	SetPayoutFrequency(300);
	AddProperty("CJ's Garage", -2033.4343,131.5496,28.8359, 5000, 2500, 1000);
	AddProperty("Train Station", -1982.4717,154.3341,27.6875, 10000, 5000, 1500);
	AddProperty("Vang Cars", -1932.2813,275.7627,41.0469, 6000, 3000, 1200);
	AddProperty("Construction Site", -2069.3237,235.2976,36.0414, 15000, 7500, 3000);
	AddProperty("Cluck'n Bell", -1818.8860,616.5896,35.1719, 5000, 2500, 1000);
	AddProperty("Airforce Base", -1524.7406,492.7152,7.1797, 20000, 10000, 4000);
	AddProperty("Victim Shop", -1701.4960,944.1588,24.8906, 10000, 5000, 2000);
	AddProperty("Pizza Shop", -1804.5896,946.6353,24.8906, 10000, 5000, 1500);
	AddProperty("Church", -1988.3112,1117.9098,54.4735, 50000, 25000, 4500);
	AddProperty("Grove St.", 2521.52, -1678.98, 15.44, 5000, 2500, 700);
	AddProperty("Grove St.", 2469.64, -1648.20, 13.47, 5500, 2750, 1000);
	AddProperty("Grove St.", 2489.25, -1646.48, 14.06, 4000, 2000, 500);
	AddProperty("Grove St.", 2498.56, -1644.10, 13.77, 7000, 3500, 1500);
	AddProperty("Grove St.", 2522.61, -1658.78, 15.49, 3000, 1500, 500);
	AddProperty("Binco", 1653.5299,1732.8510,10.3915, 10000, 5000, 1500);
	AddProperty("LV Airport", 1676.7690,1502.4817,10.7703, 200000, 100000, 10000);
	AddProperty("Car park", 1713.2047,1294.6808,10.8203, 15000, 5250, 4000);
	AddProperty("Theater", 1558.0968,1121.9446,10.8203, 30000, 15000, 3000);
	AddProperty("Warehouse", 1659.0900,922.0782,10.8203, 10000, 5000, 2000);
	AddProperty("Drug Warehouse", 1677.7411,1054.9395,10.8203, 80000, 40000, 8000);
	AddProperty("Library", 1859.7219,1072.0924,10.3896, 4000, 2000, 1500);
	AddProperty("4 Dragons", 2024.5209,1000.8708,10.3911, 300000, 150000, 12000);
	AddProperty("Wonderland", 2180.2920,1115.7438,12.2131, 400000, 200000, 14000);
	AddProperty("Museum", 2236.3672,1284.5905,10.3661, 40000, 20000, 5500);
	AddProperty("Car park", 2313.3867,1393.5291,10.5465, 20000, 10000, 2500);
	AddProperty("Sex shop", 2235.1274,1441.1011,10.6194, 5000, 2500, 1500);
	AddProperty("Pervert", 2235.1086,1475.3705,10.6250, 7000, 3500, 2500);
	AddProperty("Casino", 2088.8330,1515.0024,10.3850, 50000, 25000, 5000);
	AddProperty("Casino", 2186.8442,1676.3394,10.6717, 120000, 60000, 9000);
	AddProperty("Casino", 2332.4490,2163.3804,10.3812, 200000, 100000, 15000);
	AddProperty("Fire Dep.", -2025.1544,67.2852,28.4333, 10000, 5000, 2500);
	AddProperty("Labratory", -1910.5242,711.4846,45.4453, 40000, 20000, 6000);
	AddProperty("Shop", -2096.9736,715.6492,69.5625, 2000, 1000, 500);
	AddProperty("Shop", -2096.4629,707.5848,69.5625, 2500, 1250, 600);
	AddProperty("House", -2157.1846,786.2371,69.5478, 6000, 3000, 1500);
	AddProperty("House", 2332.4490,2163.3804,10.3812, 5000, 2500, 1000);
	AddProperty("Chinese stret", -2244.0383,738.8103,49.4453, 20000, 10000, 4000);
	AddProperty("Chinese restourant", -2277.9570,653.9497,49.4453, 5000, 2500, 1500);
	AddProperty("Garden Shop", -2582.3660,315.9102,5.1797, 5000, 2500, 1000);
	AddProperty("House", -2634.6968,274.3798,4.3281, 2000, 1000, 500);
	AddProperty("Cluck'n Bell", -2673.1326,259.2844,4.6328, 10000, 5000, 2500);
	AddProperty("Ammunation", -2627.2410,209.6167,4.5809, 25000, 12500, 5000);
	AddProperty("Mayors House", -2763.4866,375.5267,6.0568, 250000, 125000, 15000);
	AddProperty("Hotel", -2665.7004,-7.7491,6.1328, 15000, 6500, 3500);
	AddProperty("Library", -2491.8784,29.9793,25.6090, 5000, 2500, 1000);
	AddProperty("Casino", 2366.9968,2123.6572,10.8251, 50000, 25000, 6500);
	AddProperty("Casino", 2369.3203,2163.5901,10.8306, 100000, 50000, 8000);
	AddProperty("Shop", 2506.7964,2123.8223,10.8203, 5000, 2500, 1000);
	AddProperty("Gun shop", 2536.8252,2086.6360,10.8203, 12000, 6000, 2500);
	AddProperty("Vice", 2490.1289,2062.8938,10.8203, 10000, 5000, 3500);
	AddProperty("Bar", 2441.1389,2062.6064,10.8203, 5500, 2750, 1000);
	AddProperty("XXX", -2096.9736,715.6492,69.5625, 5000, 2500, 1000);
	AddProperty("XXX", 2410.3516,2017.5524,10.8203, 10000, 5000, 2500);
	AddProperty("Pawn", 2411.0977,1993.1431,10.8203, 8000, 4000, 3000);
	AddProperty("Capel", 2515.9216,2033.0026,10.8203, 8000, 4000, 2000);
	AddProperty("Seven", 2546.4070,1968.5813,10.8203, 10000, 5000, 2000);
	AddProperty("Rocker", 2367.4902,1982.3011,10.8203, 20000, 10000, 5500);
	AddProperty("Car park", 2261.5193,2036.0856,10.8203, 20000, 10000, 4000);
	AddProperty("Exchange", 2087.7122,2054.3752,11.0579, 4000, 2000, 1500);
	AddProperty("Info Centre", 2087.1702,2065.8977,11.0579, 5000, 2500, 1500);
	AddProperty("XXX", 2087.2725,2076.8948,11.0579, 15000, 6500, 3000);
	AddProperty("Tatoo", 2095.3340,2119.7200,10.8203, 10000, 5000, 3500);
	AddProperty("Gay", 2076.5332,2120.3462,10.8125, 5000, 2500, 1000);
	AddProperty("Casino", 2221.7324,1838.0590,10.8203, 100000, 50000, 8000);
	AddProperty("Pirate ship", 2003.5402,1544.2367,13.5908, 50000, 25000, 7000);
	AddProperty("Auto", 2200.3940,1390.9625,10.8203, 40000, 20000, 5000);
	AddProperty("Walk", 1860.5552,1033.7854,10.8203, 20000, 10000, 2500);
	AddProperty("Build", 1713.8455,1264.0291,10.8203, 25000, 12500, 7000);
	AddProperty("LV Air dep.", 1318.6357,1256.2931,10.8203, 80000, 40000, 5000);
	AddProperty("XXX", 1941.6069,-2116.1724,13.6953, 5000, 2500, 1500);
	AddProperty("Tatoo", 1974.1627,-2038.0651,13.5469, 4000, 2000, 1000);
	AddProperty("Mexican", 1951.5458,-1985.1467,13.5469, 8000, 4000, 2500);
	AddProperty("Studio", 1933.1078,-1863.0770,13.5619, 7000, 3500, 2000);
	AddProperty("SF Harbour", -1741.3286,31.2001,3.5547, 50000, 25000, 6000);
	AddProperty("SF Goverment", -1497.7024,920.3591,7.1875, 80000, 40000, 7000);
	AddProperty("LVPD", 2340.2168,2455.9182,14.9688, 30000, 15000, 5000);
	AddProperty("Emerald", 2127.7861,2372.3557,10.8203, 100000, 50000, 10000);
	AddProperty("Binco", 2103.4287,2244.2356,11.0234, 8000, 4000, 2500);
	AddProperty("Motel", 2109.0876,2170.9541,10.8203, 30000, 15000, 7500);
	AddProperty("XXX", 2077.7610,2098.0459,11.0579, 10000, 5000, 3500);
	AddProperty("Exchange", 2053.4294,2097.3958,11.0579, 40000, 20000, 5500);
	AddProperty("Info", 2079.8132,2044.8987,11.0579, 10000, 5000, 3000);
	AddProperty("LV Depo", 1746.7368,2079.4329,10.8203, 40000, 20000, 6000);
	AddProperty("Old garage", -1841.5851,-108.2140,5.6484, 10000, 5000, 3000);
	AddProperty("Factory", -1855.7079,-218.6069,18.3750, 15000, 6750, 3000);
	AddProperty("Driving school", -2029.1497,-100.3924,35.1641, 40000, 20000, 6000);
	AddProperty("Resturaunt", -2174.6853,-89.1917,35.3203, 15000, 6750, 3500);
	AddProperty("Dom's", -2267.5166,-45.4645,35.3203, 25000, 12500, 5000);
	AddProperty("Resturaunt", -2264.7698,30.0762,35.3203, 60000, 30000, 8000);
	AddProperty("Baseball field", -2289.3123,173.6566,35.3056, 10000, 5000, 2500);
	AddProperty("Goverment", -2157.3826,251.6257,35.3203, 20000, 10000, 6000);
	AddProperty("Sky scraper", -1812.8518,582.5779,35.1668, 200000, 100000, 10000);
	AddProperty("Car palace", -1640.7186,1207.5269,7.1797, 50000, 25000, 6000);
	AddProperty("Docks", -1954.8651,1342.7455,7.1875, 50000, 25000, 8000);
	AddProperty("Jizzy's", -2621.2854,1411.3319,7.0938, 300000, 150000, 10000);
	AddProperty("Dounut", -2766.0786,788.9059,52.7813, 15000, 7500, 4500);
	AddProperty("Goverment", -2646.7102,697.5725,27.9437, 140000, 70000, 12000);
	AddProperty("Super Save", -2442.2866,751.6311,35.1786, 10000, 5000, 2000);
	AddProperty("Skate Park", 1880.1741,-1374.9225,13.5709, 10000, 5000, 3500);
	AddProperty("Quarry", 587.3672,871.4146,-42.4973, 20000, 10000, 4500);
	AddProperty("Movie", 911.0557,-1231.9625,16.9766, 15000, 6750, 2500);
	AddProperty("Motel", 2229.0117,-1150.2551,25.8592, 20000, 10000, 5500);
	return 1;
}

public OnFilterScriptExit() {
    DestroyAllPropertyPickups();
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    ResetPlayerPropertyInfo(playerid);
    return 1;
}
public OnPlayerCommandText(playerid, cmdtext[]) {
    new cmd[256];
    new idx;
    cmd = strtok(cmdtext, idx);

    //===========================================================
    if (strcmp("/propertyinfo", cmd, true) == 0) {
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USE: /propertyinfo [PropertyID]");
            return 1;
        }
        new prop = strval(tmp);
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        new Float: X, Float: Y, Float: Z;
        new Price, Earning, SellValue, Name[64], Owner[MAX_PLAYER_NAME], Status[16];
        GetPropertyInfo(prop, X, Y, Z, Price, SellValue, Earning);
        format(Name, 64, "%s", GetPropertyName(prop));
        format(Owner, MAX_PLAYER_NAME, "%s", GetPropertyOwner(prop));
        format(Status, 16, "%s", GetPropertyStatus(prop));
        new str[128];
        format(str, 128, "nosaukums: %s ** X: %.1f  Y:%.1f ** Z:%.1f", Name, X, Y, Z);
        SendClientMessage(playerid, 0xFFFFFFAA, str);
        format(str, 128, "q: $%d ** Pardod: $%d ** Ienakumi: $%d", Price, SellValue, Earning);
        SendClientMessage(playerid, 0xFFFFFFAA, str);
        format(str, 128, "Ipasnieks: %s", Owner);
        SendClientMessage(playerid, 0xFFFFFFAA, str);
        format(str, 128, "Status: %s", Status);
        SendClientMessage(playerid, 0xFFFFFFAA, str);
        return 1;
    }

    //===========================================================
    if (strcmp("/disableproperty", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        new prop = strval(tmp);
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        ToggleProperty(prop, 0);
        return 1;
    }

    //===========================================================
    if (strcmp("/enableproperty", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        new prop = strval(tmp);
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        ToggleProperty(prop, 1);
        return 1;
    }

    //===========================================================
    if (strcmp("/myproperties", cmdtext, true) == 0) {
        GetPlayerProperties(playerid);
        return 1;
    }

    //===========================================================
    if (strcmp("/buyproperty", cmdtext, true) == 0) {
        BuyPropertyForPlayer(playerid);
        return 1;
    }

    //===========================================================
    if (strcmp("/sellproperty", cmdtext, true) == 0) {
        SellPropertyForPlayer(playerid);
        return 1;
    }

    //===========================================================
    if (strcmp("/locateproperty", cmd, true) == 0) {
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "PIELIETOJUMS: /locateproperty [PropertyID]");
            return 1;
        }
        new prop = strval(tmp);
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        LocatePropertyForPlayer(prop, playerid);
        return 1;
    }

    //===========================================================
    if (strcmp("/SetPropertyPrice", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyPrice [PropertyID] [Price]");
            return 1;
        }
        new prop = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyPrice [PropertyID] [Price]");
            return 1;
        }
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        new str[128];
        new price = strval(tmp);
        SetPropertyPrice(prop, price);
        format(str, 128, "You've set the price of \"%s\" (ID: %d) to $%d", PropInfo[prop][PropName], prop, price);
        SendClientMessage(playerid, 0x00FF00AA, str);
        return 1;
    }

    //===========================================================
    if (strcmp("/SetPropertyValue", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyValue [PropertyID] [Value]");
            return 1;
        }
        new prop = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyValue [PropertyID] [Value]");
            return 1;
        }
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        new str[128];
        new value = strval(tmp);
        SetPropertySellValue(prop, value);
        format(str, 128, "You've set the value of \"%s\" (ID: %d) to $%d", PropInfo[prop][PropName], prop, value);
        SendClientMessage(playerid, 0x00FF00AA, str);
        return 1;
    }

    //===========================================================
    if (strcmp("/SetPropertyEarning", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new tmp[256];
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyEarning [PropertyID] [Earning]");
            return 1;
        }
        new prop = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if (!strlen(tmp)) {
            SendClientMessage(playerid, 0xFF0000AA, "USAGE: /SetPropertyEarning [PropertyID] [Earning]");
            return 1;
        }
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        new str[128];
        new earning = strval(tmp);
        SetPropertyEarning(prop, earning);
        format(str, 128, "You've set the earning of \"%s\" (ID: %d) to $%d", PropInfo[prop][PropName], prop, earning);
        SendClientMessage(playerid, 0x00FF00AA, str);
        return 1;
    }

    //===========================================================
    if (strcmp("/disablecp", cmdtext, true) == 0) {
        DisablePlayerCheckpoint(playerid);
        return 1;
    }

    //==========================================================
    if (strcmp("/GetPropertyID", cmdtext, true) == 0) {
        new ID = IsPlayerNearProperty(playerid);
        if (ID == -1) return SendClientMessage(playerid, 0xFF0000AA, "Tu esi par tâlu no îpaðuma!");
        new str[128];
        format(str, 128, "Tu esi blakus îpaðumam ar ID '%d': \"%s\"", ID, PropInfo[ID][PropName]);
        SendClientMessage(playerid, 0x00FFFFAA, str);
        return 1;
    }

    //===========================================================
    if (strcmp("/SaveProperty", cmd, true) == 0) {
        if (!IsPlayerAdmin(playerid)) return 0;
        new prop = IsPlayerNearProperty(playerid);
        if (prop == -1) return SendClientMessage(playerid, 0xFF0000AA, "Tu nçsi pietiekami tuvu îpaðumam");
        if (!DoesPropertyExists(prop)) return SendClientMessage(playerid, 0xFF0000AA, "Ðâds îpaðums neeksistç!");
        SaveProperty(prop, cmdtext[13]);
        SendClientMessage(playerid, 0x00FF00AA, "Ipasums saglabats");
        return 1;
    }
    return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid) {
    OnPropertyPickupPickup(playerid, pickupid);
    return 1;
}
strtok(const string[], & index) {
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' ')) {
        index++;
    }

    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1))) {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}
