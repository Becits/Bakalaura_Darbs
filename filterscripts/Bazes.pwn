#include <a_samp>

// KRAASU DEFINEESHANA
#define GREY 0xAFAFAFAA
#define GREEN 0x33AA33AA
#define YELLOW 0xFFFF00AA
#define WHITE 0xFFFFFFAA
#define LIGHTBLUE 0x33CCFFAA
#define ORANGE 0xFF9900AA
#define RED 0xAA3333AA

//------------------------------- MAINIIGO SAAKUMS -----------------------------
// VAARTU MAINIIGIE(NOSAUKUMI)
new a1gates;
new a2gates;
new a3gates;
new ssgates;
//new ss2gates;
new bgates;
new tagates;
new lgates;
new l2gates;
new l22gates;
new tlgates;
new mgates;
new becisgates;

// MAINIIGIE VAARTU KUSTINAASHANAI
new GateVariable;
new GateVariable2;
new GateVariable3;
//new GateVariable4;
new GateVariable5;
new GateVariable6;
new GateVariable7;
new GateVariable8;
new GateVariable9;
new GateVariable10;
new GateVariable11;
new GateVariable12;

//----
new AreaCheckTimerVariable;

// BECHA BAAZES AUTOKILL MAINIIGAIS
new Becis_GZ;

// BECHA BAAZES IEROCHU MAINIIGIE
new tec9, uzi, sawnoff, combat, rpg, sniper, ak, m4; 

// TUUNEETO MASHIINU MAINIIGIE
new elegy1, elegy2, jester1, jester2, uranus1, uranus2, sultan1, sultan2, flash1, flash2,
slamvan1, slamvan2, remington1, remington2, savanna1, savanna2, blade1, blade2, tornado1, tornado2;

// PICKUPI RETRO BUNKURAM
new teleport;
new teleport2;

//------------------------------- MAINIIGO BEIGAS ------------------------------

//Forwardi
forward AreaCheckTimer();

public OnFilterScriptInit() {
    AreaCheckTimerVariable = SetTimer("AreaCheckTimer", 1000, 1);
    //----
    Becis_GZ = GangZoneCreate(-74.913414, -394.928070, 13.086585, -266.928070);
    GangZoneShowForAll(Becis_GZ, -2147418167);
    
    //----------------------------- ARMIJAS BUNKURI ----------------------------
    // Atrashanaas vieta - area51
    //--------------------------------- AGATES ---------------------------------
    CreateObject(1966, 266.798981, 1944.330200, 19.077562, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 266.794281, 1967.128052, 19.002563, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 282.911041, 1970.625488, 19.152561, 0.0000, 0.0000, 0.0000);
    CreateObject(1966, 266.748871, 1978.176270, 18.877565, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 266.790924, 2000.799072, 18.877565, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 266.786102, 2012.279419, 18.652569, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 266.751495, 2034.943848, 18.727568, 0.0000, 0.0000, 90.0000);
    CreateObject(1966, 282.654480, 2038.628906, 18.602570, 0.0000, 0.0000, 180.0000);
    CreateObject(1966, 282.259888, 2004.411133, 18.702568, 0.0000, 0.0000, 0.0000);
    //Agates 1
    a1gates = CreateObject(972, 283.196991, 1953.267944, 16.037516, 0.0000, 0.0000, 0.0000); // vaarti
    AddStaticVehicle(470, 270.1134, 1967.4552, 17.6348, 224.5651, 43, 41); // patriot agates
    AddStaticVehicle(470, 278.2700, 1967.9474, 17.6384, 233.1702, 30, 72); // patriot agates
    AddStaticVehicle(432, 271.8517, 1959.4519, 17.6532, 269.8112, 120, 51); // rhino agates
    AddStaticVehicle(433, 272.1559, 1950.2604, 18.0632, 270.0364, 104, 39); // Barracks agates
    AddStaticVehicle(433, 276.6580, 1944.4797, 18.0773, 291.4562, 104, 39); // Barracks agates
    AddStaticPickup(331, 2, 283.7182, 1968.8118, 17.6406); // braas knuckles a1
    AddStaticPickup(335, 2, 283.7321, 1966.9752, 17.6406); // knife a1
    AddStaticPickup(346, 2, 283.7430, 1964.9474, 17.6406); // pistol a1
    AddStaticPickup(1240, 2, 270.0495, 1954.5304, 17.6406); // armour a1
    AddStaticPickup(1242, 2, 273.5606, 1954.4456, 17.6406); // hp a1
    // Agates 2
    a2gates = CreateObject(972, 283.187775, 1987.659546, 15.987516, 0.0000, 0.0000, 0.0000); // vaarti
    AddStaticVehicle(470, 279.5308, 2001.7866, 17.6343, 231.2090, 55, 58); // patriot a2gates
    AddStaticVehicle(432, 271.8296, 1994.1062, 17.6533, 268.2003, 78, 116); // rhino a2gates
    AddStaticVehicle(432, 271.9694, 1983.9016, 17.6531, 269.4891, 1, 120); // rhino a2gates
    AddStaticVehicle(433, 280.3024, 1978.7847, 18.0773, 307.7899, 104, 39); // Barracks a2gates
    AddStaticPickup(353, 2, 284.3520, 2002.3207, 17.6406); // mp5 a2
    AddStaticPickup(348, 2, 284.4667, 2000.0215, 17.6406); // Deagle a2
    AddStaticPickup(357, 2, 284.5245, 1997.7394, 17.6406); // country rifle a2
    AddStaticPickup(1240, 2, 270.2084, 1988.9066, 17.6406); // hp
    AddStaticPickup(1242, 2, 273.3364, 1988.7714, 17.6406); // armor
    // Agates 3
    a3gates = CreateObject(972, 283.170654, 2021.916992, 15.987516, 0.0000, 0.0000, 0.0000); // vaarti
    AddStaticVehicle(432, 278.3477, 2013.0482, 17.6557, 311.7420, 92, 123); // rhino a3gates
    AddStaticVehicle(432, 271.7120, 2025.6658, 17.6535, 270.9260, 92, 123); // rhino a3gates
    AddStaticVehicle(432, 271.8696, 2017.8579, 17.6535, 269.9002, 92, 123); // rhino a3gates
    AddStaticVehicle(432, 277.7171, 2034.5236, 17.6528, 236.8905, 92, 123); // rhino a3gates
    AddStaticPickup(356, 2, 284.8690, 2036.6625, 17.6406); // m4 a3
    AddStaticPickup(358, 2, 283.8948, 2035.3240, 17.6406); // Deagle a3
    AddStaticPickup(350, 2, 271.2531, 2021.8192, 17.6406); // country rifle a3
    AddStaticPickup(1240, 2, 270.1477, 2022.5087, 17.6406); // hp a3
    AddStaticPickup(1242, 2, 273.2409, 2022.4410, 17.6406); // armor a3

    //--------------------------- SEASPARROW BUNKURS ---------------------------
    // Atrashanaas vieta - pie jizzy club
    //--------------------------------- SSGATES --------------------------------
    CreateObject(16357, -2754.864014, 1224.507446, -41.341614, 0.0000, 90.2408, 42.1124);
    CreateObject(16357, -2764.811279, 1238.221924, -41.441628, 1.7189, 89.3814, 39.5341);
    CreateObject(16357, -2771.751709, 1250.664917, -41.191635, 0.8594, 89.3814, 21.4859);
    CreateObject(16357, -2752.384521, 1268.211670, -41.166702, 180.3777, 90.2408, 274.0564);
    CreateObject(16357, -2735.897705, 1269.955322, -40.978844, 0.8594, 91.1003, 269.7591);
    CreateObject(16357, -2723.313965, 1262.931030, -40.841621, 0.0000, 91.9598, 209.5985);
    CreateObject(16357, -2718.623047, 1247.221802, -40.913719, 0.0000, 90.2409, 194.9882);
    CreateObject(8417, -2750.416748, 1248.758911, 38.798443, 0.0000, 0.0000, 291.6406);
    CreateObject(8417, -2740.547852, 1245.985718, 38.794685, 0.0000, 0.0000, 22.5000);
    CreateObject(972, -2761.908691, 1260.063232, 31.481256, 0.0000, 0.0000, 123.6727);
    CreateObject(972, -2761.880371, 1259.974487, 19.712503, 0.0000, 0.0000, 123.7500);
    CreateObject(972, -2761.920166, 1260.038574, 25.617401, 0.0000, 0.0000, 123.7499);
    CreateObject(972, -2761.698242, 1259.853149, 15.912470, 0.0000, 0.0000, 123.7499);
    CreateObject(8417, -2735.613525, 1222.128174, 38.731300, 0.0000, 0.0000, 0.0000);
    ssgates = CreateObject(972, -2761.717285, 1259.862671, 10.762506, 0.0000, 0.0000, 123.7499); // vaarti
    AddStaticVehicle(447, -2745.5813, 1234.7874, 11.7802, 341.4289, 29, 25); // seasparrow
    AddStaticVehicle(447, -2727.8682, 1247.0114, 11.7830, 86.7274, 48, 43); // seasparrow
    AddStaticVehicle(447, -2737.4314, 1260.1337, 11.7773, 147.8563, 46, 91); // seasparrow
    AddStaticVehicle(447, -2754.4553, 1246.2340, 11.7773, 275.7149, 87, 122); // seasparrow
    AddStaticVehicle(447, -2736.5095, 1240.3274, 11.7803, 29.4089, 91, 66); // seasparrow

    //---------------------------- MOTOCIKLU BUNKURS ---------------------------
    // Atrashanaas vieta - mezhaa, dzelzcela ielokaa virs /grove, zem /town1
    //--------------------------------- BGATES ---------------------------------
    CreateObject(10831, 2297.036621, -579.919067, 134.258530, 2.5783, 0.8594, 78.7500);
    CreateObject(16775, 2284.080078, -575.521912, 132.484192, 1.7189, 0.8594, 78.7500);
    bgates = CreateObject(16775, 2310.456787, -582.684082, 131.235031, 357.4217, 359.1406, 258.7500); // vârti
    AddStaticVehicle(462, 2304.0720, -594.3806, 131.2286, 327.0795, 5, 69); // fag
    AddStaticVehicle(462, 2300.6123, -593.5701, 131.4759, 325.6157, 8, 33); // fag
    AddStaticVehicle(462, 2296.8899, -592.7967, 131.7450, 323.7614, 6, 38); // fag
    AddStaticVehicle(521, 2293.0012, -591.9162, 131.9900, 324.6660, 40, 1); // fcr
    AddStaticVehicle(521, 2289.1660, -591.1108, 132.2696, 321.2757, 98, 53); // fcr
    AddStaticVehicle(521, 2286.1899, -590.5968, 132.4960, 316.5564, 19, 124); // fcr
    AddStaticVehicle(522, 2309.0859, -569.5818, 129.5222, 193.9024, 106, 108); // nrg
    AddStaticVehicle(522, 2305.0933, -568.8533, 129.7290, 196.2478, 38, 119); // nrg
    AddStaticVehicle(522, 2301.6494, -568.3583, 129.9270, 195.5352, 95, 53); // nrg
    AddStaticVehicle(471, 2297.2942, -567.2121, 130.0229, 202.6162, 12, 58); // quad
    AddStaticVehicle(471, 2293.4175, -566.1101, 130.1721, 205.8537, 94, 16); // quad
    AddStaticVehicle(471, 2289.6057, -565.3560, 130.3699, 198.1166, 35, 102); // quad
    AddStaticVehicle(571, 2285.4873, -575.7756, 131.7451, 259.1066, 6, 66); // kart
    AddStaticVehicle(463, 2285.3396, -587.6889, 132.4843, 282.4763, 86, 19); // freeway
    AddStaticVehicle(463, 2286.5056, -582.7303, 132.3339, 286.9195, 70, 40); // freeway
    AddStaticVehicle(463, 2288.1306, -575.5339, 131.7778, 279.1278, 95, 88); // freeway
    AddStaticVehicle(468, 2291.8525, -571.6101, 131.1528, 220.6402, 117, 28); // sanchez
    AddStaticVehicle(468, 2291.0530, -579.2123, 132.0782, 230.9549, 93, 69); // sanchez
    AddStaticVehicle(468, 2289.7498, -585.1133, 132.2501, 226.5650, 118, 14); // sanchez
    AddStaticVehicle(461, 2295.1748, -585.9816, 131.7655, 290.9077, 1, 37); // pcj
    AddStaticVehicle(461, 2295.6411, -582.1588, 131.6843, 287.0696, 114, 103); // pcj
    AddStaticVehicle(461, 2296.6270, -575.2360, 131.1501, 276.0503, 79, 18); // pcj
    AddStaticVehicle(581, 2300.0205, -576.1411, 131.0156, 224.0639, 77, 26); // bj
    AddStaticVehicle(581, 2299.5605, -581.6252, 131.3975, 226.3371, 91, 31); // bf-400
    AddStaticVehicle(581, 2300.6687, -588.5482, 131.4043, 282.4621, 79, 5); // bf

    //------------------------ TUNED ARCH CARS BUNKURS -------------------------
    // Atrashanaas vieta - /bigjump
    //-------------------------------- TAGATES ---------------------------------
    tagates = CreateObject(972, -793.539124, 2417.428223, 154.275421, 0.0000, 0.0000, 258.7500); // vârti
    CreateObject(8251, -789.630615, 2426.748779, 159.710800, 0.0000, 0.0000, 258.7500);

    elegy1 = AddStaticVehicle(562, -797.5298, 2437.8892, 156.7486, 200.2221, 1, 1); // elegy
    {
        AddVehicleComponent(elegy1, 1034);
        AddVehicleComponent(elegy1, 1035);
        AddVehicleComponent(elegy1, 1036);
        AddVehicleComponent(elegy1, 1040);
        AddVehicleComponent(elegy1, 1147);
        AddVehicleComponent(elegy1, 1149);
        AddVehicleComponent(elegy1, 1171);
        AddVehicleComponent(elegy1, 1073);
        ChangeVehiclePaintjob(elegy1, 1);
    }
    elegy2 = AddStaticVehicle(562, -778.1519, 2433.8691, 156.7540, 134.7787, 1, 1); // elegy2
    {
        AddVehicleComponent(elegy2, 1037);
        AddVehicleComponent(elegy2, 1038);
        AddVehicleComponent(elegy2, 1039);
        AddVehicleComponent(elegy2, 1041);
        AddVehicleComponent(elegy2, 1146);
        AddVehicleComponent(elegy2, 1148);
        AddVehicleComponent(elegy2, 1172);
        AddVehicleComponent(elegy2, 1079);
        ChangeVehiclePaintjob(elegy2, 2);
    }
    uranus1 = AddStaticVehicle(558, -779.5252, 2427.6035, 156.7623, 122.1293, 1, 1); // uranus
    {
        AddVehicleComponent(uranus1, 1088);
        AddVehicleComponent(uranus1, 1089);
        AddVehicleComponent(uranus1, 1090);
        AddVehicleComponent(uranus1, 1094);
        AddVehicleComponent(uranus1, 1164);
        AddVehicleComponent(uranus1, 1167);
        AddVehicleComponent(uranus1, 1168);
        AddVehicleComponent(uranus1, 1073);
        ChangeVehiclePaintjob(uranus1, 1);
    }
    uranus2 = AddStaticVehicle(558, -798.6187, 2431.6201, 156.7208, 212.5935, 1, 1); // uranus2
    {
        AddVehicleComponent(uranus2, 1165);
        AddVehicleComponent(uranus2, 1166);
        AddVehicleComponent(uranus2, 1163);
        AddVehicleComponent(uranus2, 1095);
        AddVehicleComponent(uranus2, 1093);
        AddVehicleComponent(uranus2, 1092);
        AddVehicleComponent(uranus2, 1091);
        AddVehicleComponent(uranus2, 1079);
        ChangeVehiclePaintjob(uranus2, 2);
    }
    sultan1 = AddStaticVehicle(560, -790.2969, 2436.6377, 156.8105, 167.8426, 1, 1); // sultan
    {
        AddVehicleComponent(sultan1, 1026);
        AddVehicleComponent(sultan1, 1027);
        AddVehicleComponent(sultan1, 1028);
        AddVehicleComponent(sultan1, 1031);
        AddVehicleComponent(sultan1, 1032);
        AddVehicleComponent(sultan1, 1138);
        AddVehicleComponent(sultan1, 1141);
        AddVehicleComponent(sultan1, 1169);
        AddVehicleComponent(sultan1, 1073);
        ChangeVehiclePaintjob(sultan1, 1);
    }
    sultan2 = AddStaticVehicle(560, -785.7185, 2435.8015, 156.8129, 167.6956, 1, 1); // sultan
    {
        AddVehicleComponent(sultan2, 1029);
        AddVehicleComponent(sultan2, 1030);
        AddVehicleComponent(sultan2, 1033);
        AddVehicleComponent(sultan2, 1139);
        AddVehicleComponent(sultan2, 1140);
        AddVehicleComponent(sultan2, 1170);
        AddVehicleComponent(sultan2, 1031);
        AddVehicleComponent(sultan2, 1079);
        ChangeVehiclePaintjob(sultan2, 2);
    }
    flash1 = AddStaticVehicle(565, -781.5444, 2416.2168, 156.7464, 116.6649, 1, 1); // flash
    {
        AddVehicleComponent(flash1, 1046);
        AddVehicleComponent(flash1, 1047);
        AddVehicleComponent(flash1, 1051);
        AddVehicleComponent(flash1, 1049);
        AddVehicleComponent(flash1, 1054);
        AddVehicleComponent(flash1, 1150);
        AddVehicleComponent(flash1, 1153);
        AddVehicleComponent(flash1, 1073);
        ChangeVehiclePaintjob(flash1, 1);
    }
    flash2 = AddStaticVehicle(565, -801.2792, 2420.1484, 156.5583, 216.6254, 1, 1); // flash
    {
        AddVehicleComponent(flash2, 1045);
        AddVehicleComponent(flash2, 1048);
        AddVehicleComponent(flash2, 1050);
        AddVehicleComponent(flash2, 1052);
        AddVehicleComponent(flash2, 1053);
        AddVehicleComponent(flash2, 1151);
        AddVehicleComponent(flash2, 1152);
        AddVehicleComponent(flash2, 1079);
        ChangeVehiclePaintjob(flash2, 2);
    }
    jester1 = AddStaticVehicle(559, -799.9503, 2425.5928, 156.7231, 215.1326, 1, 1); // jester
    {
        AddVehicleComponent(jester1, 1065);
        AddVehicleComponent(jester1, 1067);
        AddVehicleComponent(jester1, 1069);
        AddVehicleComponent(jester1, 1071);
        AddVehicleComponent(jester1, 1160);
        AddVehicleComponent(jester1, 1162);
        AddVehicleComponent(jester1, 1073);
        ChangeVehiclePaintjob(jester1, 1);
    }
    jester2 = AddStaticVehicle(559, -780.6354, 2421.7954, 156.7928, 124.8111, 1, 1); // jester
    {
        AddVehicleComponent(jester2, 1066);
        AddVehicleComponent(jester2, 1068);
        AddVehicleComponent(jester2, 1070);
        AddVehicleComponent(jester2, 1072);
        AddVehicleComponent(jester2, 1161);
        AddVehicleComponent(jester2, 1158);
        AddVehicleComponent(jester2, 1079);
        ChangeVehiclePaintjob(jester2, 2);
    }

    //------------------------------ LAIVU BUNKURS -----------------------------
    // Atrashanaas vieta - /canal taisni uz priekshu
    //--------------------------------- LGATES ---------------------------------
    lgates = CreateObject(10828, 2572.590576, -2120.212891, 8.043551, 0.0000, 0.0000, 0.0000); // vaarti
    l2gates = CreateObject(10828, 2566.000000, -2247.470703, 7.611582, 0.0000, 0.0000, 0.0000); // vaarti -->
    l22gates = CreateObject(10828, 2601.000000, -2247.450195, 7.570127, 0.0000, 0.0000, 180.0000); // vaarti <--
    CreateObject(8378, 2590.289063, -2130.213867, 11.748035, 269.7591, 0.0000, 0.0000);
    CreateObject(8378, 2565.795898, -2130.225342, 11.790688, 269.7591, 0.0000, 0.0000);
    CreateObject(11496, 2554.343262, -2238.417236, 0.121669, 0.0000, 0.0000, 0.0000);
    CreateObject(11496, 2554.343262, -2222.427002, -0.235376, 357.4217, 0.0000, 0.0000);
    CreateObject(11496, 2554.343262, -2206.491699, -1.075626, 356.5623, 0.0000, 0.0000);
    CreateObject(11496, 2613.948975, -2246.412109, 0.136170, 0.0000, 0.0000, 180.0000);
    CreateObject(11496, 2613.942383, -2230.529053, -0.216343, 2.5783, 0.0000, 180.0000);
    CreateObject(11496, 2613.923096, -2214.555176, -1.055216, 3.4377, 0.0000, 180.0000);
    CreateObject(11496, 2582.232422, -2213.692383, -1.024524, 356.5623, 0.0000, 0.0000);
    CreateObject(11496, 2582.254639, -2229.670166, -0.289846, 358.2811, 0.0000, 0.0000);
    AddStaticVehicle(595, 2588.2502, -2229.5024, -0.0996, 179.0678, 68, 26); // boat
    AddStaticVehicle(472, 2607.8726, -2232.2019, -0.2765, 177.1403, 63, 6); // boat
    AddStaticVehicle(473, 2583.2769, -2240.3787, -0.3443, 179.8321, 104, 16); // dinghy
    AddStaticVehicle(452, 2577.8889, -2234.0017, -0.6992, 179.0651, 49, 1); // speeder
    AddStaticVehicle(493, 2561.4104, -2236.0874, 0.1747, 180.8608, 3, 4); // jetmax
    AddStaticVehicle(539, 2599.4177, -2216.1577, -0.6338, 180.8718, 1, 3); // vortex
    AddStaticVehicle(539, 2569.0845, -2216.1501, -0.7142, 175.8029, 1, 20); // vortex

    //------------------------ TUNED LOCOLOW CAR BUNKURS -----------------------
    // Atrashanaas vieta - uz 4dragons
    //--------------------------------- TLGATES --------------------------------
    tlgates = CreateObject(972, 1925.708496, 1032.925171, 20.847254, 0.0000, 0.0000, 90.0000); // vaarti ^
    CreateObject(5340, 1909.964478, 1036.279175, 24.625994, 89.3814, 0.0000, 269.7591);
    CreateObject(5340, 1910.000732, 1036.283203, 19.995115, 91.1003, 0.0000, 270.0000);
    CreateObject(5340, 1937.210449, 1036.283203, 24.647808, 90.2409, 0.0000, 270.0000);
    CreateObject(5340, 1937.196777, 1036.283813, 19.701023, 89.3814, 0.0000, 270.0000);
    CreateObject(8417, 1923.095215, 1016.355896, 27.985786, 180.4818, 0.0000, 0.0000);
    CreateObject(5816, 1988.3908691406, 1069.8341064453, 17.345560073853, 0, 0, 0); // Trepes uz bunkuru

    slamvan1 = AddStaticVehicle(535, 1921.2953, 1008.9773, 21.6135, 359.4614, 1, 1); // slamvan
    {
        AddVehicleComponent(slamvan1, 1113); //Exaust
        AddVehicleComponent(slamvan1, 1115); //Frontbullbars
        AddVehicleComponent(slamvan1, 1109); //Rearbullbars
        AddVehicleComponent(slamvan1, 1118); //Sideskirt
        AddVehicleComponent(slamvan1, 1120); //Sideskirt
        AddVehicleComponent(slamvan1, 1078); //Wheels
        ChangeVehiclePaintjob(slamvan1, 0);
    }
    slamvan2 = AddStaticVehicle(535, 1925.8312, 1008.7039, 21.6158, 0.0096, 1, 1); // slamvan2
    {
        AddVehicleComponent(slamvan2, 1110); //Rearbullbars
        AddVehicleComponent(slamvan2, 1114); //Exaust
        AddVehicleComponent(slamvan2, 1116); //Frontbullbars
        AddVehicleComponent(slamvan2, 1119); //Sideskirt
        AddVehicleComponent(slamvan2, 1121); //Sideskirt
        AddVehicleComponent(slamvan2, 1077); //Wheels
        ChangeVehiclePaintjob(slamvan2, 1);
    }
    remington1 = AddStaticVehicle(534, 1912.7892, 1009.3600, 21.5747, 323.8312, 1, 1); // remington
    {
        AddVehicleComponent(remington1, 1122); //Sideskirt
        AddVehicleComponent(remington1, 1101); //Sideskirt
        AddVehicleComponent(remington1, 1125); //Lights
        AddVehicleComponent(remington1, 1126); //Exaust
        AddVehicleComponent(remington1, 1078); //Wheels
        AddVehicleComponent(remington1, 1179); //Rearbumper
        AddVehicleComponent(remington1, 1180); //Frontbumper
        AddVehicleComponent(remington1, 1100); //Bullbar
        ChangeVehiclePaintjob(remington1, 1);
    }
    remington2 = AddStaticVehicle(534, 1934.3306, 1009.1959, 21.5750, 35.6210, 1, 1); // remington2
    {
        AddVehicleComponent(remington2, 1106); //Sideskirt
        AddVehicleComponent(remington2, 1124); //Sideskirt
        AddVehicleComponent(remington2, 1127); //Exaust
        AddVehicleComponent(remington2, 1178); //Rearbumper
        AddVehicleComponent(remington2, 1185); //Frontbumper
        AddVehicleComponent(remington2, 1125); //Bullbar
        AddVehicleComponent(remington2, 1077); //Wheels
        ChangeVehiclePaintjob(remington2, 2);
    }
    savanna1 = AddStaticVehicle(567, 1912.9196, 1017.5772, 21.7194, 323.0363, 1, 1); // savanna
    {
        AddVehicleComponent(savanna1, 1102); //Sideskirt
        AddVehicleComponent(savanna1, 1133); //Sideskirt
        AddVehicleComponent(savanna1, 1129); //Exaust
        AddVehicleComponent(savanna1, 1130); //Roof
        AddVehicleComponent(savanna1, 1187); //Frontbumper
        AddVehicleComponent(savanna1, 1189); //Rearbumper
        AddVehicleComponent(savanna1, 1078); //Wheels
        ChangeVehiclePaintjob(savanna1, 2);
    }
    savanna2 = AddStaticVehicle(567, 1934.0610, 1018.0478, 21.7200, 37.4079, 1, 1); // savanna2
    {
        AddVehicleComponent(savanna2, 1102); //Sideskirt
        AddVehicleComponent(savanna2, 1133); //Sideskirt
        AddVehicleComponent(savanna2, 1132); //Exaust
        AddVehicleComponent(savanna2, 1186); //Rearbumper
        AddVehicleComponent(savanna2, 1188); //Frontbumper
        AddVehicleComponent(savanna2, 1131); //Roof
        AddVehicleComponent(savanna2, 1077); //Wheels
        ChangeVehiclePaintjob(savanna2, 1);
    }
    blade1 = AddStaticVehicle(536, 1912.9374, 1023.9265, 21.5880, 319.8397, 1, 1); // blade
    {
        AddVehicleComponent(blade1, 1104); //Exaust
        AddVehicleComponent(blade1, 1182); //Frontbumper
        AddVehicleComponent(blade1, 1184); //Rearbumper
        AddVehicleComponent(blade1, 1107); //Sideskirt
        AddVehicleComponent(blade1, 1108); //Sideskirt
        AddVehicleComponent(blade1, 1128); //Roof
        AddVehicleComponent(blade1, 1078); //Wheels
        ChangeVehiclePaintjob(blade1, 1);
    }
    blade2 = AddStaticVehicle(536, 1934.1765, 1024.6582, 21.5879, 42.8236, 1, 1); // blade2
    {
        AddVehicleComponent(blade2, 1103); //Roof
        AddVehicleComponent(blade2, 1105); //Exaust
        AddVehicleComponent(blade2, 1181); //Frontbumper
        AddVehicleComponent(blade2, 1183); //Rearbumper
        AddVehicleComponent(blade2, 1107); //Sideskirt
        AddVehicleComponent(blade2, 1108); //Sideskirt
        AddVehicleComponent(blade2, 1077); //Wheels
        ChangeVehiclePaintjob(blade2, 2);
    }
    tornado1 = AddStaticVehicle(576, 1913.0117, 1030.3517, 21.4951, 320.0155, 1, 1); // tornado
    {
        AddVehicleComponent(tornado1, 1134); //Sideskirt
        AddVehicleComponent(tornado1, 1137); //Sideskirt
        AddVehicleComponent(tornado1, 1136); //Exaust
        AddVehicleComponent(tornado1, 1190); //Rearbumper
        AddVehicleComponent(tornado1, 1192); //Frontbumper
        AddVehicleComponent(tornado1, 1078); //Wheels
        ChangeVehiclePaintjob(tornado1, 1);
    }
    tornado2 = AddStaticVehicle(576, 1934.1575, 1030.2329, 21.4579, 44.3417, 1, 1); // tornado2
    {
        AddVehicleComponent(tornado2, 1134); //Sideskirt
        AddVehicleComponent(tornado2, 1137); //Sideskirt
        AddVehicleComponent(tornado2, 1135); //Exaust
        AddVehicleComponent(tornado2, 1191); //Rearbumper
        AddVehicleComponent(tornado2, 1193); //Frontbumper
        AddVehicleComponent(tornado2, 1077); //Wheels
        ChangeVehiclePaintjob(tornado2, 2);
    }

    //----------------------------- MONSTER BUNKURS ----------------------------
    // Atrashanaas vieta - las venturas no /inn pa kreisi un uz augshu
    //---------------------------------- MGATES --------------------------------
    mgates = CreateObject(16773, 1917.373047, 2135.522705, 12.244518, 0.0000, 0.0000, 90.0000); // vaarti
    CreateObject(3749, 1917.344482, 2136.255859, 15.628728, 0.0000, 0.0000, 90.0000);
    CreateObject(8417, 1897.097900, 2110.860352, 11.530695, 90.2408, 0.0000, 179.6223);
    CreateObject(8417, 1897.081421, 2162.811523, 11.555676, 89.3814, 0.0000, 0.0000);
    CreateObject(8417, 1877.852173, 2142.645996, 11.549719, 272.3375, 1.7189, 273.1969);
    CreateObject(8417, 1875.782349, 2131.510742, 11.542408, 268.8997, 0.0000, 271.4780);
    CreateObject(8378, 1916.971558, 2120.308105, -2.260532, 0.0000, 90.2408, 90.0000);
    CreateObject(8378, 1917.053467, 2153.512207, -2.291312, 0.0000, 90.2409, 270.0000);
    CreateObject(16773, 1917.508301, 2136.828613, 24.865063, 0.0000, 0.0000, 89.1405);
    CreateObject(16773, 1917.463013, 2137.153076, 27.428801, 0.0000, 0.0000, 89.1405);
    CreateObject(8417, 1897.103394, 2143.055176, 31.525528, 0.0000, 0.0000, 0.0000);
    CreateObject(8417, 1897.100098, 2130.765137, 31.521847, 0.0000, 0.0000, 0.0000);
    AddStaticVehicle(444, 1884.4056, 2142.1680, 11.1916, 268.5277, 55, 99); // monnster
    AddStaticVehicle(444, 1883.9012, 2149.6934, 11.1916, 270.2925, 116, 124); // monster
    AddStaticVehicle(444, 1884.3982, 2158.0144, 11.1916, 270.5805, 84, 121); // monster
    AddStaticVehicle(444, 1897.1104, 2158.5400, 11.1916, 180.7890, 29, 7); // monster
    AddStaticVehicle(444, 1905.4271, 2157.8252, 11.1916, 180.6829, 76, 101); // monster
    AddStaticVehicle(444, 1911.6595, 2158.4045, 11.1916, 177.3755, 55, 107); // monster
    AddStaticVehicle(444, 1891.0673, 2157.8691, 11.1916, 181.1397, 105, 14); // monster
    AddStaticVehicle(444, 1884.2196, 2134.1934, 11.1916, 269.5980, 98, 13); // monster
    AddStaticVehicle(444, 1883.3732, 2125.6414, 11.1916, 270.1545, 95, 42); // monster
    AddStaticVehicle(444, 1883.3702, 2116.4832, 11.1916, 269.1353, 31, 17); // monster
    AddStaticVehicle(444, 1898.1437, 2115.3850, 11.1916, 359.8628, 123, 60); // monster
    AddStaticVehicle(444, 1903.0526, 2115.7466, 11.1916, 0.7192, 77, 30); // monster
    AddStaticVehicle(444, 1908.6045, 2115.6548, 11.1916, 0.7553, 51, 82); // monster
    AddStaticVehicle(444, 1890.5903, 2116.1650, 11.1860, 358.8129, 123, 60); // monstrs

    //------------------------------- BECHA BAAZE ------------------------------
    becisgates = CreateObject(972, -72.359589, -350.731628, -1.429544, 0.0000, 0.0000, 180.0000); //Vaarti
    CreateObject(8151, -21.538872, -364.717804, 13.196334, 0.0000, 0.0000, 270.0000);
    CreateObject(8151, -44.447536, -356.541870, 10.166843, 0.0000, 0.0000, 180.0000);
    CreateObject(8150, 18.325035, -330.160736, 11.938452, 0.0000, 0.0000, 90.3777);
    CreateObject(8210, -76.032028, -295.540161, 8.766937, 0.0000, 0.0000, 90.0000);
    CreateObject(973, -75.690132, -380.072571, 5.469908, 0.0000, 0.0000, 90.0000);
    CreateObject(973, -75.671860, -379.995758, 4.572395, 0.0000, 0.0000, 90.0000);
    CreateObject(973, -75.680473, -328.908752, 5.444908, 0.0000, 0.0000, 90.0000);
    CreateObject(973, -75.684074, -329.291229, 4.543776, 0.0000, 0.0000, 90.0000);
    CreateObject(987, 5.733738, -268.719360, 14.389009, 0.0000, 0.0000, 0.0000);
    CreateObject(987, -5.892472, -268.704407, 14.414009, 0.0000, 0.0000, 0.0000);
    CreateObject(987, -11.903482, -268.670715, 14.414009, 0.0000, 0.0000, 0.0000);
    CreateObject(3461, -45.149300, -292.355927, 7.128147, 0.0000, 0.0000, 0.0000);
    CreateObject(3461, -55.008076, -291.929962, 6.953577, 0.0000, 0.0000, 0.0000);
    CreateObject(3461, -44.275291, -282.304596, 7.056870, 0.0000, 0.0000, 0.0000);
    CreateObject(3461, -55.816792, -281.860260, 6.953577, 0.0000, 0.0000, 0.0000);
    CreateObject(3525, -76.082016, -361.650818, 4.032435, 0.0000, 0.0000, 270.0000);
    CreateObject(3525, -76.029694, -344.309998, 3.955101, 0.0000, 0.0000, 270.0000);
    CreateObject(11480, -67.271835, -272.678925, 7.622274, 0.0000, 0.0000, 270.0000);
    CreateObject(11480, -72.497513, -272.666107, 7.622274, 0.0000, 0.0000, 270.0000);
    CreateObject(5043, -64.160507, -274.127197, 6.428564, 0.0000, 0.0000, 179.5182);
    CreateObject(5340, -75.539970, -272.642944, 6.379204, 0.0000, 0.0000, 0.0000);
    CreateObject(1491, -64.151070, -272.148651, 5.341676, 0.0000, 0.0000, 90.0000);
    CreateObject(1491, -64.170525, -269.125183, 5.338301, 0.0000, 0.0000, 270.0000);
    CreateObject(9241, -12.312038, -283.183258, 6.138580, 0.0000, 0.0000, 270.0000);
    CreateObject(3279, 12.425287, -390.289856, 5.404175, 0.0000, 0.0000, 180.0000);
    CreateObject(3279, 12.521040, -274.104095, 5.429175, 0.0000, 0.0000, 270.0000);
    CreateObject(3279, -70.585533, -390.254974, 5.504175, 0.0000, 0.0000, 90.0000);
    CreateObject(972, -2.636124, -265.297577, 3.826568, 0.0000, 0.0000, 270.0000);
    // PAARVIETOSHANAAS LIIDZEKLI AR MAINIITAAM NUMURA ZIIMEEM
    SetVehicleNumberPlate(AddStaticVehicle(522, -55.4190, -300.1990, 4.9900, 207.0424, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(522, -57.4190, -300.1990, 4.9900, 207.0424, 1, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(521, -59.5000, -300.3675, 4.9900, 205.1529, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(462, -61.5000, -300.1343, 4.9900, 199.7788, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(581, -63.6000, -300.1327, 4.9900, 209.5489, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(481, -53.6415, -297.0032, 4.9460, 198.4302, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(510, -45.9565, -296.2705, 5.0380, 162.6732, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(429, -63.1899, -311.0086, 5.1094, 268.7783, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(451, -63.4311, -314.3721, 5.1363, 269.3178, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(434, -63.9025, -317.9123, 5.3940, 271.4503, 128, 42), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(463, -43.8717, -300.2683, 4.9700, 211.2550, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(468, -40.6335, -300.1487, 5.0988, 215.6519, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(471, -38.2963, -300.1264, 4.9113, 203.2619, 1, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(477, -63.0115, -321.4589, 5.1853, 270.4916, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(502, -62.8956, -324.9379, 5.3216, 269.2503, 1, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(495, -63.5887, -342.4699, 5.7817, 271.3227, 1, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(579, -63.0915, -333.1378, 5.3656, 273.7203, 128, 36), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(496, -63.2345, -379.0875, 5.1457, 0.0982, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(506, -59.8617, -378.8047, 5.1342, 0.4525, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(504, -56.5550, -378.2699, 5.2222, 359.3587, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(535, -53.1954, -378.7180, 5.1932, 359.5687, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(541, -49.8326, -379.0579, 5.0547, 0.0310, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(559, -46.4337, -378.7814, 5.0860, 359.9327, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(560, -43.1580, -378.7803, 5.1349, 0.5065, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(558, -39.7293, -378.7376, 5.0591, 0.6330, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(562, -36.4578, -378.8193, 5.0897, 359.5610, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(589, -33.1358, -378.8780, 5.0878, 359.6674, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(603, -29.7971, -378.5211, 5.2681, 359.6027, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(411, -26.4314, -378.6451, 5.1568, 358.8330, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(555, -23.0460, -378.7446, 5.1140, 359.8555, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(415, -19.8617, -378.7725, 5.2006, 1.1395, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(533, -13.0734, -378.5670, 5.1411, 359.6809, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(444, -1.2726, -377.7431, 5.8260, 0.2299, 0, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(580, -16.3956, -378.1903, 5.2258, 359.4108, 128, 128), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(490, -7.7062, -377.9904, 5.5573, 0.1693, 0, 0), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(489, -63.2484, -337.7699, 5.5283, 271.4714, 128, 1), "Becis");
    SetVehicleNumberPlate(AddStaticVehicle(555, 2.3502, -292.7235, 5.1141, 180.6302, 128, 128), "Becis");
    AddStaticVehicle(487, -12.3513, -284.5051, 8.1865, 180.2820, 128, 1); // Maverick
    // IEROCHI UN CITI PICKUP`I
    CreatePickup(1240, 2, -74.5032, -269.9061, 6.4286); // armour
    CreatePickup(1242, 2, -72.8249, -269.9473, 6.4286); // hp
    CreatePickup(321, 2, -74.2993, -271.6070, 6.4286); // dildo
    CreatePickup(335, 2, -72.7924, -271.7937, 6.4286); // knife
    ak = CreatePickup(355, 2, -67.5249, -272.6190, 6.4286); // ak
    m4 = CreatePickup(356, 2, -67.4917, -274.3544, 6.4286); // m4
    rpg = CreatePickup(359, 2, -73.4399, -274.2348, 6.4286); // rpg
    sniper = CreatePickup(358, 2, -71.5573, -274.2691, 6.4286); // sniper
    tec9 = CreatePickup(351, 2, -69.2554, -273.4498, 6.4286); // tec
    uzi = CreatePickup(350, 2, -69.2285, -275.1472, 6.4286); // uzi
    sawnoff = CreatePickup(352, 2, -65.2879, -275.0306, 6.4286); // sawn
    combat = CreatePickup(372, 2, -65.2370, -273.5442, 6.4286); // combat

    //------------------------------ RETRO BUNKURS -----------------------------
    // Atrashanaas vieta - mezhaa zem /town4
    CreateObject(8251, 204.787247, -826.393677, 22.854168, 0.0000, 0.0000, 202.5000);
    CreateObject(8251, 180.119568, -836.604797, 22.853130, 0.0000, 0.0000, 22.5000);
    CreateObject(8251, 180.121643, -836.649109, 15.385752, 180.4820, 0.0000, 22.5000);
    CreateObject(8251, 204.771835, -826.365723, 15.190407, 180.4818, 0.0000, 202.5000);
    AddStaticVehicle(533, 205.2926, -816.1379, 19.0844, 203.9652, 114, 108); // felt
    AddStaticVehicle(445, 202.6205, -817.5192, 19.3744, 201.0064, 114, 114); // admiral
    AddStaticVehicle(555, 198.7915, -818.3067, 19.4048, 202.8422, 114, 114); // windsor
    AddStaticVehicle(480, 194.6520, -820.3477, 19.6847, 198.8096, 114, 114); // comet
    AddStaticVehicle(439, 189.5072, -824.0946, 20.0076, 202.0564, 114, 114); //
    AddStaticVehicle(438, 185.0905, -825.2387, 20.3341, 200.9643, 6, 6); // cabbie
    AddStaticVehicle(404, 180.3524, -826.7303, 20.2632, 201.3978, 114, 114); //
    AddStaticVehicle(419, 177.2625, -828.9359, 20.4238, 200.5769, 114, 114); // espe
    AddStaticVehicle(580, 171.8769, -829.9562, 20.6131, 199.3823, 114, 114); // staff
    AddStaticVehicle(533, 213.1439, -832.8021, 18.4933, 23.9436, 114, 107); // feltzer
    AddStaticVehicle(445, 209.2560, -833.9266, 18.8568, 19.3015, 114, 33); // admiral
    AddStaticVehicle(555, 205.7523, -836.0059, 18.8479, 21.6690, 114, 34); // windsor
    AddStaticVehicle(480, 200.7052, -838.0598, 19.1954, 20.1507, 114, 49); // comet
    AddStaticVehicle(439, 195.2727, -838.9049, 19.4889, 19.1578, 114, 55); // stallion
    AddStaticVehicle(438, 191.1645, -841.9446, 19.3042, 21.6848, 6, 43); // cabbie
    AddStaticVehicle(404, 187.6170, -843.2464, 18.8855, 24.0364, 114, 114); // pereniel
    AddStaticVehicle(419, 182.8949, -844.6879, 18.7925, 19.2471, 114, 12); // esperanto
    AddStaticVehicle(580, 177.8604, -847.0963, 18.6402, 25.2835, 114, 29); // stafford
    AddStaticVehicle(549, 170.6512, -838.7607, 20.0187, 290.8566, 114, 77); // tampa
    AddStaticVehicle(549, 172.6322, -843.1808, 19.3647, 291.1451, 114, 77); // tampa
    AddStaticVehicle(421, 213.9928, -824.6315, 18.5921, 114.7924, 114, 33); // washington
    AddStaticVehicle(421, 212.1019, -820.6243, 18.6836, 111.6767, 114, 33); // washington
    // Pickupi
    teleport = CreatePickup(1254, 2, 192.8072, -820.3426, 20.0290, -1);
    teleport2 = CreatePickup(1254, 2, 191.0609, -815.9884, 20.2266, -1);
    return 1;
}

public OnFilterScriptExit() {
    KillTimer(AreaCheckTimerVariable);
    for (new i = 0; i < MAX_VEHICLES; i++) {
        DestroyVehicle(i);
    }
    for (new i = 0; i < MAX_OBJECTS; i++) {
        DestroyObject(i);
    }
    return 1;
}
main() {}

public OnPlayerConnect(playerid) {
    GangZoneShowForPlayer(playerid, Becis_GZ, -2147418167);
    return 1;
}

// SPAWNOSHANAAS
public OnPlayerSpawn(playerid) {
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, sizeof(pname));
    if ((strfind(pname, "Becis", true) != -1) || (strfind(pname, "Black_Star", true) != -1)) {
        SetPlayerPos(playerid, -49.9768, -270.5205, 6.6332);
        SetPlayerFacingAngle(playerid, 182.1529);
    }
    return 1;
}

public OnVehicleSpawn(vehicleid) {
    // ARCH CARS
    AddVehicleComponent(elegy1, 1034);
    AddVehicleComponent(elegy1, 1035);
    AddVehicleComponent(elegy1, 1036);
    AddVehicleComponent(elegy1, 1040);
    AddVehicleComponent(elegy1, 1147);
    AddVehicleComponent(elegy1, 1149);
    AddVehicleComponent(elegy1, 1171);
    AddVehicleComponent(elegy1, 1073);
    ChangeVehiclePaintjob(elegy1, 1);
    AddVehicleComponent(elegy2, 1037);
    AddVehicleComponent(elegy2, 1038);
    AddVehicleComponent(elegy2, 1039);
    AddVehicleComponent(elegy2, 1041);
    AddVehicleComponent(elegy2, 1146);
    AddVehicleComponent(elegy2, 1148);
    AddVehicleComponent(elegy2, 1172);
    AddVehicleComponent(elegy2, 1079);
    ChangeVehiclePaintjob(elegy2, 2);
    AddVehicleComponent(uranus1, 1088);
    AddVehicleComponent(uranus1, 1089);
    AddVehicleComponent(uranus1, 1090);
    AddVehicleComponent(uranus1, 1094);
    AddVehicleComponent(uranus1, 1164);
    AddVehicleComponent(uranus1, 1167);
    AddVehicleComponent(uranus1, 1168);
    AddVehicleComponent(uranus1, 1073);
    ChangeVehiclePaintjob(uranus1, 1);
    AddVehicleComponent(uranus2, 1165);
    AddVehicleComponent(uranus2, 1166);
    AddVehicleComponent(uranus2, 1163);
    AddVehicleComponent(uranus2, 1095);
    AddVehicleComponent(uranus2, 1093);
    AddVehicleComponent(uranus2, 1092);
    AddVehicleComponent(uranus2, 1091);
    AddVehicleComponent(uranus2, 1079);
    ChangeVehiclePaintjob(uranus2, 2);
    AddVehicleComponent(sultan1, 1026);
    AddVehicleComponent(sultan1, 1027);
    AddVehicleComponent(sultan1, 1028);
    AddVehicleComponent(sultan1, 1031);
    AddVehicleComponent(sultan1, 1032);
    AddVehicleComponent(sultan1, 1138);
    AddVehicleComponent(sultan1, 1141);
    AddVehicleComponent(sultan1, 1169);
    AddVehicleComponent(sultan1, 1073);
    ChangeVehiclePaintjob(sultan1, 1);
    AddVehicleComponent(sultan2, 1029);
    AddVehicleComponent(sultan2, 1030);
    AddVehicleComponent(sultan2, 1033);
    AddVehicleComponent(sultan2, 1139);
    AddVehicleComponent(sultan2, 1140);
    AddVehicleComponent(sultan2, 1170);
    AddVehicleComponent(sultan2, 1031);
    AddVehicleComponent(sultan2, 1079);
    ChangeVehiclePaintjob(sultan2, 2);
    AddVehicleComponent(flash1, 1046);
    AddVehicleComponent(flash1, 1047);
    AddVehicleComponent(flash1, 1051);
    AddVehicleComponent(flash1, 1049);
    AddVehicleComponent(flash1, 1054);
    AddVehicleComponent(flash1, 1150);
    AddVehicleComponent(flash1, 1153);
    AddVehicleComponent(flash1, 1073);
    ChangeVehiclePaintjob(flash1, 1);
    AddVehicleComponent(flash2, 1045);
    AddVehicleComponent(flash2, 1048);
    AddVehicleComponent(flash2, 1050);
    AddVehicleComponent(flash2, 1052);
    AddVehicleComponent(flash2, 1053);
    AddVehicleComponent(flash2, 1151);
    AddVehicleComponent(flash2, 1152);
    AddVehicleComponent(flash2, 1079);
    ChangeVehiclePaintjob(flash2, 2);
    // LOW RIDERS
    AddVehicleComponent(slamvan1, 1113); //Exaust
    AddVehicleComponent(slamvan1, 1115); //Frontbullbars
    AddVehicleComponent(slamvan1, 1109); //Rearbullbars
    AddVehicleComponent(slamvan1, 1118); //Sideskirt
    AddVehicleComponent(slamvan1, 1120); //Sideskirt
    AddVehicleComponent(slamvan1, 1078); //Wheels
    ChangeVehiclePaintjob(slamvan1, 0);
    AddVehicleComponent(slamvan2, 1110); //Rearbullbars
    AddVehicleComponent(slamvan2, 1114); //Exaust
    AddVehicleComponent(slamvan2, 1116); //Frontbullbars
    AddVehicleComponent(slamvan2, 1119); //Sideskirt
    AddVehicleComponent(slamvan2, 1121); //Sideskirt
    AddVehicleComponent(slamvan2, 1077); //Wheels
    ChangeVehiclePaintjob(slamvan2, 1);
    AddVehicleComponent(remington1, 1122); //Sideskirt
    AddVehicleComponent(remington1, 1101); //Sideskirt
    AddVehicleComponent(remington1, 1125); //Lights
    AddVehicleComponent(remington1, 1126); //Exaust
    AddVehicleComponent(remington1, 1078); //Wheels
    AddVehicleComponent(remington1, 1179); //Rearbumper
    AddVehicleComponent(remington1, 1180); //Frontbumper
    AddVehicleComponent(remington1, 1100); //Bullbar
    ChangeVehiclePaintjob(remington1, 1);
    AddVehicleComponent(remington2, 1106); //Sideskirt
    AddVehicleComponent(remington2, 1124); //Sideskirt
    AddVehicleComponent(remington2, 1127); //Exaust
    AddVehicleComponent(remington2, 1178); //Rearbumper
    AddVehicleComponent(remington2, 1185); //Frontbumper
    AddVehicleComponent(remington2, 1125); //Bullbar
    AddVehicleComponent(remington2, 1077); //Wheels
    ChangeVehiclePaintjob(remington2, 2);
    AddVehicleComponent(savanna1, 1102); //Sideskirt
    AddVehicleComponent(savanna1, 1133); //Sideskirt
    AddVehicleComponent(savanna1, 1129); //Exaust
    AddVehicleComponent(savanna1, 1130); //Roof
    AddVehicleComponent(savanna1, 1187); //Frontbumper
    AddVehicleComponent(savanna1, 1189); //Rearbumper
    AddVehicleComponent(savanna1, 1078); //Wheels
    ChangeVehiclePaintjob(savanna1, 2);
    AddVehicleComponent(savanna2, 1102); //Sideskirt
    AddVehicleComponent(savanna2, 1133); //Sideskirt
    AddVehicleComponent(savanna2, 1132); //Exaust
    AddVehicleComponent(savanna2, 1186); //Rearbumper
    AddVehicleComponent(savanna2, 1188); //Frontbumper
    AddVehicleComponent(savanna2, 1131); //Roof
    AddVehicleComponent(savanna2, 1077); //Wheels
    ChangeVehiclePaintjob(savanna2, 1);
    AddVehicleComponent(blade1, 1104); //Exaust
    AddVehicleComponent(blade1, 1182); //Frontbumper
    AddVehicleComponent(blade1, 1184); //Rearbumper
    AddVehicleComponent(blade1, 1107); //Sideskirt
    AddVehicleComponent(blade1, 1108); //Sideskirt
    AddVehicleComponent(blade1, 1128); //Roof
    AddVehicleComponent(blade1, 1078); //Wheels
    ChangeVehiclePaintjob(blade1, 1);
    AddVehicleComponent(blade2, 1103); //Roof
    AddVehicleComponent(blade2, 1105); //Exaust
    AddVehicleComponent(blade2, 1181); //Frontbumper
    AddVehicleComponent(blade2, 1183); //Rearbumper
    AddVehicleComponent(blade2, 1107); //Sideskirt
    AddVehicleComponent(blade2, 1108); //Sideskirt
    AddVehicleComponent(blade2, 1077); //Wheels
    ChangeVehiclePaintjob(blade2, 2);
    AddVehicleComponent(tornado1, 1134); //Sideskirt
    AddVehicleComponent(tornado1, 1137); //Sideskirt
    AddVehicleComponent(tornado1, 1136); //Exaust
    AddVehicleComponent(tornado1, 1190); //Rearbumper
    AddVehicleComponent(tornado1, 1192); //Frontbumper
    AddVehicleComponent(tornado1, 1078); //Wheels
    ChangeVehiclePaintjob(tornado1, 1);
    AddVehicleComponent(tornado2, 1134); //Sideskirt
    AddVehicleComponent(tornado2, 1137); //Sideskirt
    AddVehicleComponent(tornado2, 1135); //Exaust
    AddVehicleComponent(tornado2, 1191); //Rearbumper
    AddVehicleComponent(tornado2, 1193); //Frontbumper
    AddVehicleComponent(tornado2, 1077); //Wheels
    ChangeVehiclePaintjob(tornado2, 2);
    return 1;
}

// LIETOTAAJU IZSAUKTAAS DARBIIBAS
public OnPlayerCommandText(playerid, cmdtext[]) {

    // tele uz armijas bunkuru agates
    if (strcmp(cmdtext, "/telagates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 305.7658, 1988.1725, 17.6406);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 83.8152);
            GameTextForPlayer(playerid, "Armijas bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 305.7658, 1988.1725, 17.6406);
            SetPlayerFacingAngle(playerid, 83.8152);
            GameTextForPlayer(playerid, "Armijas bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz seasparrow bunkuru ssgates
    if (strcmp(cmdtext, "/telssgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -2775.2283, 1282.9146, 5.9689);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 209.9059);
            GameTextForPlayer(playerid, "Seasparrow bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, -2775.2283, 1282.9146, 5.9689);
            SetPlayerFacingAngle(playerid, 209.9059);
            GameTextForPlayer(playerid, "Seasparrow bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz tuned arch bunkuru tagates
    if (strcmp(cmdtext, "/teltagates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), -804.1862, 2397.5056, 155.1280);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 321.4783);
            GameTextForPlayer(playerid, "Tuned Arch bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, -804.1862, 2397.5056, 155.1280);
            SetPlayerFacingAngle(playerid, 321.4783);
            GameTextForPlayer(playerid, "Tuned Arch bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz laivu bunkuru lgates
    if (strcmp(cmdtext, "/tellgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2582.3564, -2093.8271, 2.2949);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 176.1738);
            GameTextForPlayer(playerid, "Laivu bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2582.3564, -2093.8271, 2.2949);
            SetPlayerFacingAngle(playerid, 176.1738);
            GameTextForPlayer(playerid, "Laivu bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz tuned locolow bunkuru tlgates
    if (strcmp(cmdtext, "/teltlgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1925.9647, 1050.7545, 21.8504);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 176.3859);
            GameTextForPlayer(playerid, "Tuned Locolow bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1925.9647, 1050.7545, 21.8504);
            SetPlayerFacingAngle(playerid, 176.3859);
            GameTextForPlayer(playerid, "Tuned Locolow bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz monster bunkuru mgates
    if (strcmp(cmdtext, "/telmgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 1931.3142, 2133.5757, 10.6719);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 81.1481);
            GameTextForPlayer(playerid, "Monster bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 1931.3142, 2133.5757, 10.6719);
            SetPlayerFacingAngle(playerid, 81.1481);
            GameTextForPlayer(playerid, "Monster bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz bike bunkuru bgates
    if (strcmp(cmdtext, "/telbgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 2340.3892, -582.4629, 128.6936);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 83.1769);
            GameTextForPlayer(playerid, "Bike bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 2340.3892, -582.4629, 128.6936);
            SetPlayerFacingAngle(playerid, 83.1769);
            GameTextForPlayer(playerid, "Bike bunkurs", 1700, 6);
        }
        return 1;
    }

    // tele uz retro bunkuru
    if (strcmp(cmdtext, "/telrgates", true) == 0) {
        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehiclePos(GetPlayerVehicleID(playerid), 188.1263, -809.4577, 21.2194);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), 196.8169);
            GameTextForPlayer(playerid, "Retro bunkurs", 1700, 6);
        } else {
            SetPlayerPos(playerid, 188.1263, -809.4577, 21.2194);
            SetPlayerFacingAngle(playerid, 196.8169);
            GameTextForPlayer(playerid, "Retro bunkurs", 1700, 6);
        }
        return 1;
    }

    // Armijas 1. bunkura vaarti
    if (strcmp("/a1gates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 6) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 6. lîmeòa.");
        if (GateVariable == 0) {
            MoveObject(a1gates, 283.196991, 1953.267944, 22.987516, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: 1. Armijas bunkura vaarti atveerti!");
            GateVariable = 1;
        } else if (GateVariable == 1) {
            MoveObject(a1gates, 283.196991, 1953.267944, 15.987516, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: 1. Armijas bunkura vaarti aizveerti!");
            GateVariable = 0;
        }
        return 1;
    }
    // Armijas 2. bunkura vaarti
    if (strcmp("/a2gates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 20) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 20. lîmeòa.");
        if (GateVariable2 == 0) {
            MoveObject(a2gates, 283.187775, 1987.659546, 22.987516, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: 2. Armijas bunkura vaarti atveerti!");
            GateVariable2 = 1;
        } else if (GateVariable2 == 1) {
            MoveObject(a2gates, 283.187775, 1987.659546, 15.987516, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: 2. Armijas bunkura vaarti aizveerti!");
            GateVariable2 = 0;
        }
        return 1;
    }
    // Armijas 3. bunkura vaarti
    if (strcmp("/a3gates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 28) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 28. lîmeòa.");
        if (GateVariable3 == 0) {
            MoveObject(a3gates, 283.170654, 2021.916992, 22.987516, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: 3. Armijas bunkura vaarti atveerti!");
            GateVariable3 = 1;
        } else if (GateVariable3 == 1) {
            MoveObject(a3gates, 283.170654, 2021.916992, 15.987516, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: 3. Armijas bunkura vaarti aizveerti!");
            GateVariable3 = 0;
        }
        return 1;
    }
    // Laivu bunkura ieejas vaarti
    if (strcmp("/lgates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 17) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 17. lîmeòa.");
        if (GateVariable8 == 0) {
            MoveObject(lgates, 2572.590576, -2120.212891, -4.043551, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Laivu bunkura ieejas vaarti atveerti!");
            GateVariable8 = 1;
        } else if (GateVariable8 == 1) {
            MoveObject(lgates, 2572.590576, -2120.212891, 8.043551, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Laivu bunkura ieejas vaarti aizveerti!");
            GateVariable8 = 0;
        }
        return 1;
    }
    // Laivu bunkura vaarti
    if (strcmp("/l2gates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 17) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 17. lîmeòa.");
        if (GateVariable9 == 0) {
            MoveObject(l2gates, 2539.000000, -2247.470703, 7.611582, 3); //vala
            MoveObject(l22gates, 2628.000000, -2247.450195, 7.570127, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Laivu bunkura lielie vaarti atveerti!");
            GateVariable9 = 1;
        } else if (GateVariable9 == 1) {
            MoveObject(l2gates, 2566.000000, -2247.470703, 7.611582, 3); //ciet
            MoveObject(l22gates, 2601.000000, -2247.450195, 7.570127, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Laivu bunkura lielie vaarti aizveerti!");
            GateVariable9 = 0;
        }
        return 1;
    }
    // Monster bunkura vaarti
    if (strcmp("/mgates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 13) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 13. lîmeòa.");
        if (GateVariable10 == 0) {
            MoveObject(mgates, 1917.373047, 2135.522705, 4.244518, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Monster bunkura vaarti atveerti!");
            GateVariable10 = 1;
        } else if (GateVariable10 == 1) {
            MoveObject(mgates, 1917.373047, 2135.522705, 12.244518, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Monster bunkura vaarti aizveerti!");
            GateVariable10 = 0;
        }
        return 1;
    }
    // Tuned Arch cars bunkura vaarti
    if (strcmp("/tagates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 8) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 8. lîmeòa.");
        if (GateVariable7 == 0) {
            MoveObject(tagates, -793.539124, 2417.428223, 148.275421, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Tuned arch bunkura vaarti atveerti!");
            GateVariable7 = 1;
        } else if (GateVariable7 == 1) {
            MoveObject(tagates, -793.539124, 2417.428223, 154.275421, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Tuned arch bunkura vaarti aizveerti!");
            GateVariable7 = 0;
        }
        return 1;
    }
    // Bike bunkura vaarti
    if (strcmp("/bgates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 15) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 15. lîmeòa.");
        if (GateVariable6 == 0) {
            MoveObject(bgates, 2310.156787, -582.684082, 125.235031, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Bike bunkura vaarti atveerti!");
            GateVariable6 = 1;
        } else if (GateVariable6 == 1) {
            MoveObject(bgates, 2310.456787, -582.684082, 131.235031, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Bike bunkura vaarti aizveerti!");
            GateVariable6 = 0;
        }
        return 1;
    }
    // Tuned Locolow cars bunkura vaarti
    if (strcmp("/tlgates", cmdtext, true, 10) == 0) {
        //if(GetPlayerScore(playerid) < 9) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 9. lîmeòa.");
        if (GateVariable11 == 0) {
            MoveObject(tlgates, 1925.708496, 1032.925171, 27.847254, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Tuned Locolow bunkura vaarti atveerti!");
            GateVariable11 = 1;
        } else if (GateVariable11 == 1) {
            MoveObject(tlgates, 1925.708496, 1032.925171, 20.847254, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Tuned Locolow bunkura vaarti aizveerti!");
            GateVariable11 = 0;
        }
        return 1;
    }
    // Seasparrow bunkura ieejas vaarti
    if (strcmp(cmdtext, "/ssgates", true) == 0) {
        //if(GetPlayerScore(playerid) < 11) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 11. lîmeòa.");
        if (GateVariable5 == 0) {
            MoveObject(ssgates, -2761.717285, 1259.862671, 15.762506, 3); //vala
            SendClientMessage(playerid, GREEN, "INFO: Seasparrow bunkura ieejas vaarti atveerti!");
            GateVariable5 = 1;
        } else if (GateVariable5 == 1) {
            MoveObject(ssgates, -2761.717285, 1259.862671, 10.762506, 3); //ciet
            SendClientMessage(playerid, RED, "INFO: Seasparrow bunkura ieejas vaarti aizveerti!");
            GateVariable5 = 0;
        }
        return 1;
    }
    /*// Seasparrow bunkura augsheejie vaarti
	if(strcmp(cmdtext, "/ss2gates", true)==0)
	{
	//if(GetPlayerScore(playerid) < 11) return SendClientMessage(playerid, GREY, "Ðo kommandu var izmantot tikai no 11. lîmeòa.");
   	if(GateVariable4 == 0){
   	MoveObject(ss2gates, -1201.1335449219, -1194.5522460938, 151.36357116699, 3); //vala
   	SendClientMessage(playerid, GREEN, "Seasparrow bunkura augsheejie vaarti atveerti!");
   	GateVariable4 = 1;
   	}
 	else if(GateVariable4 == 1)
 	{
   	MoveObject(ss2gates, -1161.2991943359, -1194.5401611328, 151.43855285645, 3); //ciet
   	SendClientMessage(playerid, RED, "Seasparrow bunkura augsheejie vaarti aizveerti!");
   	GateVariable4 = 0;
    }
 	return 1;
	}*/
    //----
    if (strcmp("/becis", cmdtext, true, 10) == 0) {
        new pname[MAX_PLAYER_NAME];
        GetPlayerName(playerid, pname, sizeof(pname));
        if (strfind(pname, "Becis", false) == -1 && strfind(pname, "Black_Star", false) == -1) return SendClientMessage(playerid, GREY, "ERROR: Tev nav pieeja Becha baazei.");
        if (GateVariable12 == 0) {
            SendClientMessage(playerid, GREEN, "INFO: Becha baazes vaarti atveerti!");
            MoveObject(becisgates, -72.359589, -350.731628, -7.429544, 3); //vala
            GateVariable12 = 1;
        } else if (GateVariable12 == 1) {
            SendClientMessage(playerid, RED, "INFO: Becha baazes vaarti aizveerti!");
            MoveObject(becisgates, -72.359589, -350.731628, -1.429544, 3); //ciet
            GateVariable12 = 0;
        }
        return 1;
    }
    return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid) {
    // Ierochu pickups Becha baazee
    if (pickupid == tec9) {
        GivePlayerWeapon(playerid, 32, 1000);
    } else if (pickupid == ak) {
        GivePlayerWeapon(playerid, 30, 500);
    } else if (pickupid == combat) {
        GivePlayerWeapon(playerid, 27, 500);
    } else if (pickupid == m4) {
        GivePlayerWeapon(playerid, 31, 1000);
    } else if (pickupid == rpg) {
        GivePlayerWeapon(playerid, 35, 100);
    } else if (pickupid == sawnoff) {
        GivePlayerWeapon(playerid, 26, 400);
    } else if (pickupid == sniper) {
        GivePlayerWeapon(playerid, 34, 500);
    } else if (pickupid == uzi) {
        GivePlayerWeapon(playerid, 28, 1000);
    }
    // Retro bunkura pikups
    if (pickupid == teleport) {
        SetPlayerPos(playerid, 191.0609, -811.9884, 20.2266);
    } else if (pickupid == (teleport2)) {
        SetPlayerPos(playerid, 192.8072, -824.3426, 20.0290);
        return 1;
    }
    return 0;
}

IsPlayerInArea(playerid, Float: MinX, Float: MinY, Float: MaxX, Float: MaxY, Float: MinZ, Float: MaxZ) {
    new Float: X, Float: Y, Float: Z;
    GetPlayerPos(playerid, X, Y, Z);
    if (X >= MinX && X <= MaxX && Y >= MinY && Y <= MaxY && Z >= MinZ && Z <= MaxZ) {
        return 1;
    }
    return 0;
}

public AreaCheckTimer() {
    new Nick[MAX_PLAYER_NAME];
    for (new i; i < MAX_PLAYERS; i++) {
        if (IsPlayerInArea(i, -74.913414, -394.928070, 13.086585, -266.928070, -10, 22)) {
            GetPlayerName(i, Nick, sizeof(Nick));
            if ((strfind(Nick, "Becis", true) != -1) || (strfind(Nick, "Black_Star", true) != -1)) return 1;
            SendClientMessage(i, GREY, "ERROR: Tev nav atïauts atrasties Becha baazee!");
            SetPlayerHealth(i, 0);
        }
    }
    return 1;
}
