#include <a_samp>
#include <Dini>
#include <sscanf>
// DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

#pragma unused ret_memcpy
#pragma tabsize 0

// Pogu defineeshana
#define KEY_ENTER 16
#define HOLDING(%0) \
    ((newkeys & (%0)) == (%0))

#define RELEASED(%0) \
    (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

// Kraasu defineeshana
#define COLOR_BRIGHTRED 0xFF6C6CFF
#define COLOR_RED 0xAA3333AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIME 0x99FF00AA
#define COL_WHITE "{FFFFFF}"

// Prieksh Car komandas mainiigie(kustinaat mashiinas gabariitus)
//#define CAR 4
new objectie[MAX_PLAYERS];
new engine[MAX_PLAYERS];
new lights[MAX_PLAYERS];
new alarm[MAX_PLAYERS];
new doors[MAX_PLAYERS];
new bonnet[MAX_PLAYERS];
new boot[MAX_PLAYERS];
new vehid;

// Prieksh poptires mainiigie
//#define TIRES 20
new panels;
new tires;

// Anti-Fall mainiigais
new VehicleAntifall[MAX_PLAYERS];

// Dazhaadi mainiigie
new IsDriver[MAX_PLAYERS];
new IsPassenger[MAX_PLAYERS];
new IsOnfoot[MAX_PLAYERS];
new OnBike[MAX_PLAYERS];
new OnBoat[MAX_PLAYERS];
new OnAirplane[MAX_PLAYERS];
new OnHeli[MAX_PLAYERS];
new INos[MAX_PLAYERS];
new LevelDialog[1512];

// Ramps
new Pers[MAX_PLAYERS];
new Enabled[MAX_PLAYERS];
new Act[MAX_PLAYERS];
new bool:CreatedRamp[MAX_PLAYERS];
new Ramp[MAX_PLAYERS];
new RampReset[MAX_PLAYERS];
new ramp[MAX_PLAYERS];
new change[MAX_PLAYERS];


// Count
forward CountDown();
new Count = 5;
new CountText[5][5] ={
"~r~1",
"~r~2",
"~r~3",
"~b~4",
"~b~5"
};

// Savepos, Gotopos
static Float:posx[MAX_PLAYERS] = 0.0;
static Float:posy[MAX_PLAYERS] = 0.0;
static Float:posz[MAX_PLAYERS] = 0.0;
static Float:zangle[MAX_PLAYERS] = 0.0;

// Paarbauda vai transportliidzeklis ir aizsleegts
new locked[MAX_PLAYERS];
new carid[MAX_PLAYERS];

// Auto Repair mainiigie
new af_timer;
new AFix[MAX_PLAYERS];
forward Repair();

//-------------------------- MAINIIGIE PRIEKSH BUNKURIEM -----------------------
// VAARTU MAINIIGIE(NOSAUKUMI)
new a1gates;
new a2gates;
new a3gates;
new ssgates;
new bgates;
new tagates;
new lgates;
new l2gates;
new l22gates;
new tlgates;
new mgates;

// MAINIIGIE VAARTU KUSTINAASHANAI
new GateVariable;
new GateVariable2;
new GateVariable3;
new GateVariable5;
new GateVariable6;
new GateVariable7;
new GateVariable8;
new GateVariable9;
new GateVariable10;
new GateVariable11;


// TUUNEETO MASHIINU MAINIIGIE
new elegy1, elegy2, jester1, jester2, uranus1, uranus2, sultan1, sultan2, flash1, flash2,
slamvan1, slamvan2, remington1, remington2, savanna1, savanna2, blade1, blade2, tornado1, tornado2;

//--------------------------- BUNKURU MAINIIGO BEIGAS --------------------------

public OnFilterScriptInit() {

	// Prieksh liimenu saraksta dialoga logaa
    DialogText();
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

    return 1;
}

public OnPlayerSpawn(playerid)
{
	// Level 12 - Iedod brunas pie spawn
	if(GetPlayerScore(playerid) >= 15)
	{
		SetPlayerArmour(playerid,100);
	}
	// Level 16
	INos[playerid] = 0;
	// Level 20 Auto fix timer
	AFix[playerid] = 0;
	af_timer = SetTimer("Repair", 500, true);
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    // Atsleedz mashiinu un nonem /mycar
    new i;
    for (i = 0; i < MAX_PLAYERS; i++) {
        if (i != playerid) carid[playerid] = SetVehicleParamsForPlayer(carid[playerid], i, 0, 0);
    }
    locked[playerid] = 0;
    carid[playerid] = 0;
    // Auto fix timer beigas
    KillTimer(af_timer);
    return 1;
}

// Izsleedz neonu pie mashiinas atdzimshanas
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

	// Neoni
    DestroyObject(GetPVarInt(vehicleid, "neon"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon1"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon2"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon3"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon4"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon5"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon6"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon7"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon8"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon9"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon10"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon13"));
    return 1;
}

// Izsleedz Neonu pie mashiinas izniicinaashanas
public OnVehicleDeath(vehicleid, killerid) {
    DestroyObject(GetPVarInt(vehicleid, "neon"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon1"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon2"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon3"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon4"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon5"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon6"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon7"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon8"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon9"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon10"));
    DeletePVar(vehicleid, "Status");
    DestroyObject(GetPVarInt(vehicleid, "neon13"));
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]) {

    new cmd[256];
	new	idx;
	cmd = strtok(cmdtext, idx);

    // Liimenu saraksts chataa
    if (strcmp("/levels", cmdtext, true, 10) == 0) {
    	SendClientMessage(playerid, COLOR_LIME, "LIMENI");
        SendClientMessage(playerid, COLOR_WHITE, "Level 1 - $100.000 - /flip          ||  Level 11 - $1.000.000 - /poptires    ||  Level 21 - $1.900.000 - /mgates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 2 - $200.000 - /nos         ||  Level 12 - $1.000.000 - /lgates       ||  Level 22 - $2.000.000 - /mycar");
        SendClientMessage(playerid, COLOR_WHITE, "Level 3 - $300.000 - /count     ||  Level 13 - $1.100.000 - /savepos    ||  Level 23 - $2.100.000 - /a2gates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 4 - $400.000 - /eject       ||  Level 14 - $1.200.000 - /neon         ||  Level 24 - $2.200.000 - /ssgates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 5 - $500.000 - /lock        ||  Level 15 - $1.300.000 - Armor        ||  Level 25 - $2.300.000 - /a3gates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 6 - $600.000 - /ramps    ||  Level 16 - $1.400.000 - /inos");
        SendClientMessage(playerid, COLOR_WHITE, "Level 7 - $700.000 - /af           ||  Level 17 - $1.500.000 - /tlgates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 8 - $800.000 - /car         ||  Level 18 - $1.600.000 - /afix");
        SendClientMessage(playerid, COLOR_WHITE, "Level 9 - $900.000 - /bgates    ||  Level 19 - $1.700.000 - /tagates");
        SendClientMessage(playerid, COLOR_WHITE, "Level 10 - $1.000.000 - /rims   ||  Level 20 - $1.800.000 - /a1gates");
        return 1;
    }
    
    // Liimenu saraksts dialoga kastee
    if (strcmp("/dlevels", cmdtext, true, 10) == 0)
	{
		ShowPlayerDialog(playerid,14,DIALOG_STYLE_MSGBOX,"Limenis - Cena - Komanda",LevelDialog,"Labi","");
	 	return 1;
 	}
    
    // Liimenu iegaades komanda
	if (strcmp(cmdtext, "/buylevel", true) == 0) {
	    if (GetPlayerMoney(playerid) >= 100 && GetPlayerScore(playerid) == 0) {
	        SetPlayerScore(playerid, 1);
	        GivePlayerMoney(playerid, -100);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 1. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 100 && GetPlayerScore(playerid) == 0) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 1000 && GetPlayerScore(playerid) == 1) {
	        SetPlayerScore(playerid, 2);
	        GivePlayerMoney(playerid, -1000);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 2. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 1000 && GetPlayerScore(playerid) == 1) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 10000 && GetPlayerScore(playerid) == 2) {
	        SetPlayerScore(playerid, 3);
	        GivePlayerMoney(playerid, -10000);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 3. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 10000 && GetPlayerScore(playerid) == 2) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 100000 && GetPlayerScore(playerid) == 3) {
	        SetPlayerScore(playerid, 4);
	        GivePlayerMoney(playerid, -100000);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 4. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 100000 && GetPlayerScore(playerid) == 3) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 1000000 && GetPlayerScore(playerid) == 4) {
	        SetPlayerScore(playerid, 5);
	        GivePlayerMoney(playerid, -1000000);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 5. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 1000000 && GetPlayerScore(playerid) == 4) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 5) {
	        SetPlayerScore(playerid, 6);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 6. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 5) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 6) {
	        SetPlayerScore(playerid, 7);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 7. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 6) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 7) {
	        SetPlayerScore(playerid, 8);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 8. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 7) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 8) {
	        SetPlayerScore(playerid, 9);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 9. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 8) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 9) {
	        SetPlayerScore(playerid, 10);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 10. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 9) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 10) {
	        SetPlayerScore(playerid, 11);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 11. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 10) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 11) {
	        SetPlayerScore(playerid, 12);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 12. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 11) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 12) {
	        SetPlayerScore(playerid, 13);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 13. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 12) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 13) {
	        SetPlayerScore(playerid, 14);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 14. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 13) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 14) {
	        SetPlayerScore(playerid, 15);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 15. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 14) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 15) {
	        SetPlayerScore(playerid, 16);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 16. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 15) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 16) {
	        SetPlayerScore(playerid, 17);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 17. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 16) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 17) {
	        SetPlayerScore(playerid, 18);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 18. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 17) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 18) {
	        SetPlayerScore(playerid, 19);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 19. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 18) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 19) {
	        SetPlayerScore(playerid, 20);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 20. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 19) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 20) {
	        SetPlayerScore(playerid, 21);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 21. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 20) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 21) {
	        SetPlayerScore(playerid, 22);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 22. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 21) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
        if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 22) {
	        SetPlayerScore(playerid, 23);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 23. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 22) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 23) {
	        SetPlayerScore(playerid, 24);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 24. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 23) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if (GetPlayerMoney(playerid) >= 0 && GetPlayerScore(playerid) == 24) {
	        SetPlayerScore(playerid, 25);
	        GivePlayerMoney(playerid, -0);
	        SendClientMessage(playerid, COLOR_GREEN, "Apsveicam! Tu iegaadaajies 25. liimeni!");
	        return 1;
	    } else {
	        if (GetPlayerMoney(playerid) < 0 && GetPlayerScore(playerid) == 24) {
	            SendClientMessage(playerid, COLOR_BRIGHTRED, "Tev nav pietiekami daudz naudas!");
	            return 1;
	        }
	    }
	    if(GetPlayerScore(playerid) == 25)
		{
			SendClientMessage(playerid, COLOR_GREEN,"INFO: Tu jau esi sasniedzis maksimaalo liimeni!");
			return 1;
		}
	    return 1;
	}

    // Level 1
    if (strcmp(cmdtext, "/flip", true) == 0) {
        if (GetPlayerScore(playerid) >= 1) {
        if (IsPlayerInAnyVehicle(playerid)) {
            new Float: ZAngle;
            GetVehicleZAngle(GetPlayerVehicleID(playerid), ZAngle);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), ZAngle);
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Tu apmeti savu transportliidzekli uz ratiem!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 1. liimena!");
        }
        return 1;
    }
    
    // Level 2
    if (strcmp(cmdtext, "/nos", true) == 0) {
        if (GetPlayerScore(playerid) >= 2) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1010); //nos
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs transportliidzeklis tika apriikots ar NOS!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 2. liimena!");
    	}
        return 1;
    }

    // Level 3
    if (strcmp(cmdtext, "/count", true) == 0) {
        if (GetPlayerScore(playerid) >= 3) {
        if (Count >= 5) {
            SendClientMessageToAll(COLOR_GREEN, "INFO: Laika atskaite saakta!");
            CountDown();
            return 1;
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Laika atskaite jau ir iesaakta!");
            return 1;
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 3. liimena!");
        }
        return 1;
    }

    // Level 4
	if	(strcmp(cmd,"/eject", true) == 0){
	    if(GetPlayerScore(playerid) < 4) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 4. liimena!");
		new string[256];
		new vehicleid;
		new pid;
		new playerstate = GetPlayerState(playerid);
		cmd = strtok(cmdtext,idx);
		if	(!IsPlayerInAnyVehicle(playerid))
			{
			SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
			return 1;
			}
		if	(playerstate == PLAYER_STATE_PASSENGER)
			{
			SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
			return 1;
			}
		vehicleid = GetPlayerVehicleID(playerid);
		if	(!strlen(cmd))
			{
			SendClientMessage(playerid,COLOR_YELLOW,"PIELIETOJUMS:" COL_WHITE " /eject [ID]");
			SendClientMessage(playerid,COLOR_WHITE,"                 Lieto /ejectall, lai izmestu visus!");
			return 1;
			}
		pid = strval(cmd);
		//cmd = strtok(cmdtext,idx);
		if	(playerid == pid)
			{
			SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari sevi izmest no transportliidzekla.");
			return 1;
			}
		if	(!IsPlayerConnected(pid))
			{
			format(string, sizeof(string), "Speeleetaajs ar ID:%d nav piesleedzies.", pid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			//SendClientMessage(playerid, COLOR_BRIGHTRED, "Speeleetaajs ar taadu ID nav piesleedzies.");
			return 1;
			}
		if	(!IsPlayerInVehicle(pid,vehicleid))
			{
			format(string, sizeof(string), "Speeleetaajs ar ID:%d neatrodas tavaa transportliidzeklii.", pid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			//SendClientMessage(playerid, COLOR_RED, "Speeleetaajs ar taadu ID neatrodas tavaa transportliidzeklii.");
			return 1;
			}
		else
			{
			RemovePlayerFromVehicle(pid);
			GameTextForPlayer(pid,"~r~TU TIKI IZMESTS!",3000,5);
			return 1;
			}
		}
	// Level 4
    if	(strcmp(cmd,"/ejectall", true) == 0){
        if(GetPlayerScore(playerid) < 4) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 4. liimena!");
        new pid;
		new vehicleid;
		new playerstate = GetPlayerState(playerid);
		if	(!IsPlayerInAnyVehicle(playerid))
			{
			SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
			return 1;
		}
		if	(playerstate == PLAYER_STATE_PASSENGER)
			{
			SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
			return 1;
		}
		vehicleid = GetPlayerVehicleID(playerid);
		pid = strval(cmd);
		for (new i=0;i<MAX_PLAYERS;i++)
		    {
		    if	(playerid == pid)
			{
			SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari sevi izmest no transportliidzekla.");
			return 1;
			}
			if	((IsPlayerConnected(i))&&(IsPlayerInVehicle(i,vehicleid)))
				{
				RemovePlayerFromVehicle(i);
				GameTextForPlayer(i,"~r~TU TIKI IZMESTS!",3000,5);
				return 1;
			}
		}
	}
	
	// Level 5
	if (strcmp(cmdtext, "/lock", true) == 0) {
	    if (GetPlayerScore(playerid) >= 5) {
		    if (IsPlayerInAnyVehicle(playerid))
		        if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
				{
		            if (locked[playerid] == 0)
					{
		                locked[playerid] = 1;
		                GameTextForPlayer(playerid, "~r~Aizslegta", 1500, 1);
		                carid[playerid] = GetPlayerVehicleID(playerid);
		                new i;
		                for (i = 0; i < MAX_PLAYERS; i++)
						{
		                    if (i != playerid) SetVehicleParamsForPlayer(carid[playerid], i, 0, 1);
		                }
		                return 1;
		            } else
					{
		                SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari aizsleegt vairaak par vienu mashiinu!");
		                return 1;
					}
					/*if (locked[playerid] == 1)
					{
						SendClientMessage(playerid, COLOR_BRIGHTRED, "INFO: Mashiina jau ir aizsleegta!");
						return 1;
					}*/

				} else
				{
	                SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
	                return 1;
				}
			else {
				SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
	   			return 1;
			}
		} else {
	 		SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 5. liimena!");
		}
	return 1;
	}

	if (!strcmp(cmdtext, "/unlock", true, 7)) {
 	if (GetPlayerScore(playerid) >= 5) {
	    if (IsPlayerInAnyVehicle(playerid))
	        if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	            if (GetPlayerVehicleID(playerid) == carid[playerid])
	                if (locked[playerid] == 1) {
	                    locked[playerid] = 0;
	                    carid[playerid] = GetPlayerVehicleID(playerid);
	                    GameTextForPlayer(playerid, "~y~Atslegta", 1500, 1);
	                    new i;
	                    for (i = 0; i < MAX_PLAYERS; i++) {
	                        if (i != playerid) SetVehicleParamsForPlayer(carid[playerid], i, 0, 0);
	                    }
	                    return 1;
	                } else
					{
	        			SendClientMessage(playerid, COLOR_GREY, "ERROR: Transportliidzeklis nav aizsleegts!");
	        			return 1;
					}
	    		else {
			        SendClientMessage(playerid, COLOR_GREY, "ERROR: Atsleedz mashiinu, kuru jau ieprieksh aizsleedzi!");
			        return 1;
				}
		    else {
		        SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
		        return 1;
			}
	    else {
	        SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
	        return 1;
	    }
    } else {
 		SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 5. liimena!");
	}
	return 1;
	}
	
	// Level 6
    if (strcmp(cmdtext, "/ramps", true) == 0) {
        if (GetPlayerScore(playerid) >= 6) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
        		if (Enabled[playerid] == 1) {
       				SendClientMessage(playerid, COLOR_RED, "INFO: Rampas izslegtas!");
		            Enabled[playerid] = 0;
        		    Pers[playerid] = 0;
		            return 1;
        		}
		        if (Enabled[playerid] == 0) {
        		    SendClientMessage(playerid, COLOR_GREEN, "INFO: Rampas iesleegtas!");
		            SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " Spied (CTRL), lai uzliktu rampu!");
		            Enabled[playerid] = 1;
    		    	ramp[playerid] = 1;
    		    	change[playerid] = 1;
        		    Pers[playerid] = 1655;
		            return 1;
        		}
	        }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 6. liimena!");
        }
        return 1;
    }
    
    // Level 7
    if (strcmp(cmdtext, "/af", true) == 0) {
        if (GetPlayerScore(playerid) >= 7) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1) {
					if (Act[playerid] == 1) {
       					SendClientMessage(playerid, COLOR_RED, "INFO: Anti-Fall izsleegts!");
		            	Act[playerid] = 0;
        		    	Enabled[playerid] = 0;
		            	return 1;
        			}
					if (Act[playerid] == 0) {
        		    	SendClientMessage(playerid, COLOR_GREEN, "INFO: Anti-Fall iesleegts!");
        		    	Act[playerid] = 1;
        		    	Enabled[playerid] = 1;
        		    	VehicleAntifall[playerid] = GetPlayerVehicleID(playerid);

        		    	return 1;
        			}
				}
			 	else {
                    SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho komandu var izmantot tikai uz motocikla!");
                }
            }
			else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 7. liimena!");
        }
  	return 1;
    }
    
    // Level 8
    if (strcmp(cmdtext, "/car", true) == 0) {
        if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /engine, /bonnet, /trunk, /alarm, /lights, lai kontroleetu mashiinu!");
							return 1;
						}
            		}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }

    // Level 8 - Motors
    if (strcmp(cmdtext, "/engine", true) == 0) {
        if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
					        vehid = GetPlayerVehicleID(playerid);
					        if (engine[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Motors izsleegts!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            engine[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Motors iesleegts!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        engine[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						    }
						}
            		}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }

    // Level 8 - Motora paarsegs
    if (strcmp(cmdtext, "/bonnet", true) == 0) {
    	if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
					        vehid = GetPlayerVehicleID(playerid);
					        if (bonnet[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Motora paarsegs aizveerts!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            bonnet[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Motora paarsegs atveerts!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        bonnet[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						    }
						}
            		}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }

    // Level 8 - Bagaazhnieks
    if (strcmp(cmdtext, "/trunk", true) == 0) {
        if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
					        if (boot[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Bagaazhnieks aizveerts!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            boot[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Bagaazhnieks atveerts!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        boot[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						    }
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }
    /*
    // Level 8 - Durvis
    if (strcmp(cmdtext, "/doors", true) == 0) {
        //if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
					        if (doors[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Durvis aizveertas!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            doors[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Durvis atveertas!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        doors[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						    }
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }*/

    // Level 8 - Gaismas
    if (strcmp(cmdtext, "/lights", true) == 0) {
        if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
					        if (lights[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Lampas izsleegtas!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            lights[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Lampas iesleegtas!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        lights[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						    }
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }

    // Level 8 - Signalizaacija
    if (strcmp(cmdtext, "/alarm", true) == 0) {
        if (GetPlayerScore(playerid) >= 8) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
					        if (vehid != GetPlayerVehicleID(playerid)) {
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					        }
					        if (alarm[playerid] == 1) {
					            SendClientMessage(playerid, COLOR_RED, "INFO: Signalizaacija izsleegta!");
					            GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            alarm[playerid] = 0;
					            SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					            return 1;
					        } else {
						        SendClientMessage(playerid, COLOR_GREEN, "INFO: Signalizaacija iesleegta!");
						        GetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
						        alarm[playerid] = 1;
						        SetVehicleParamsEx(vehid, engine[playerid], lights[playerid], alarm[playerid], doors[playerid], bonnet[playerid], boot[playerid], objectie[playerid]);
					    	}
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 8. liimena!");
    	}
        return 1;
    }
    // Level 10
    if (strcmp(cmdtext, "/rims", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /rims [1-10]");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 1", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1073); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 2", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1074); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
       	} else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 3", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1076); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 4", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1082); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 5", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1097); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 6", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1077); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 7", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1078); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 8", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1084); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 9", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1085); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/rims 10", true) == 0) {
        if (GetPlayerScore(playerid) >= 10) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                    AddVehicleComponent(GetPlayerVehicleID(playerid), 1075); //rims
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Tavs auto tika apriikots ar jauniem diskiem!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 10. liimena!");
        }
        return 1;
    }

    // Level 11
    if (strcmp(cmdtext, "/poptires", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /flt, /frt, /rlt, /rrt, /bft, /brt, /at, lai paardurtu mashiinas riepas!");
							SendClientMessage(playerid, COLOR_WHITE, "                          /fixt, lai salabotu paardurtaas mashiinas riepas!");
							return 1;
						}
            		}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Front Left Tire
    if (strcmp(cmdtext, "/flt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 8);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Front Right Tire
    if (strcmp(cmdtext, "/frt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 2);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Rear Left Tire
    if (strcmp(cmdtext, "/rlt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 4);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Rear Right Tire
    if (strcmp(cmdtext, "/rrt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 1);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Both Front Tires
    if (strcmp(cmdtext, "/bft", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 10);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }


    // Level 11 - Both Rear Tires
    if (strcmp(cmdtext, "/brt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 5);
						}
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - All Tires
    if (strcmp(cmdtext, "/at", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 15);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }

    // Level 11 - Fix All Tires
    if (strcmp(cmdtext, "/fixt", true) == 0) {
        if (GetPlayerScore(playerid) >= 11) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	            if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    } else {
							vehid = GetPlayerVehicleID(playerid);
							GetVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], tires);
							UpdateVehicleDamageStatus(vehid, panels, doors[playerid], lights[playerid], 0);
			            }
					}
	        else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }
    
    //Level 13
    if (strcmp(cmdtext, "/savepos", true) == 0){
    /*{
	    if (TeamKill[playerid] == 1) {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "Nogaidi kad tiec izlaists no cietuma!");
	        return 1;
	    }*/
    if(GetPlayerScore(playerid) >= 13){
        SendClientMessage(playerid, COLOR_GREEN, "INFO: Poziicija saglabaata. Lieto /gotopos, lai atgrieztos uz sho saglabaato vietu!");
        if (IsPlayerInAnyVehicle(playerid)) {
            new VehicleID;
            VehicleID = GetPlayerVehicleID(playerid);
            GetVehiclePos(VehicleID, posx[playerid], posy[playerid], posz[playerid]);
            GetVehicleZAngle(VehicleID, zangle[playerid]);
        } else {
            GetPlayerPos(playerid, posx[playerid], posy[playerid], posz[playerid]);
            GetPlayerFacingAngle(playerid, zangle[playerid]);
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 13. liimena!");
        }
        return 1;
    }
    if (strcmp(cmdtext, "/gotopos", true) == 0){
    /*{
	    if (TeamKill[playerid] == 1) {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "Nogaidi kad tiec izlaists no cietuma!");
	        return 1;
	    }*/
    if(GetPlayerScore(playerid) >= 13){
        if (IsPlayerInAnyVehicle(playerid)) {
            new VehicleID = GetPlayerVehicleID(playerid);
            if (GetPVarInt(playerid, "ExportableCar") == 1) return SendClientMessage(playerid, COLOR_GREY, "ERROR: Atrodoties eksporteejamaa mashiinaa, teleporteeties nav atlauts!");
            SetVehiclePos(VehicleID, posx[playerid], posy[playerid], posz[playerid]);
            SetVehicleZAngle(VehicleID, zangle[playerid]);
        } else {
            SetPlayerPos(playerid, posx[playerid], posy[playerid], posz[playerid]);
            SetPlayerFacingAngle(playerid, zangle[playerid]);
        }
        SendClientMessage(playerid, COLOR_GREEN, "INFO: Tu atgriezies uz savu ieprieksh saglabaato poziiciju!");
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 13. liimena!");
        }
        return 1;
    }

    // Level 14
    if (strcmp(cmdtext, "/neon", true) == 0) {
        if (GetPlayerScore(playerid) >= 14){
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    SendClientMessage(playerid, COLOR_YELLOW, "PIELIETOJUMS:" COL_WHITE " /neon [1-5]");
                    SendClientMessage(playerid, COLOR_WHITE, "                          Lieto /delneon, lai izsleegtu neonu!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }
    
	// Zils neons
    if (strcmp(cmdtext, "/neon 1", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                    DeletePVar(playerid, "Status");
                    SetPVarInt(playerid, "Status", 1);
                    SetPVarInt(playerid, "neon", CreateObject(18648, 0, 0, 0, 0, 0, 0));
                    SetPVarInt(playerid, "neon1", CreateObject(18648, 0, 0, 0, 0, 0, 0));
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Zils neons uzstaadiits!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }
    
    // Dzeltens neons
    if (strcmp(cmdtext, "/neon 2", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {

                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                    DeletePVar(playerid, "Status");
                    SetPVarInt(playerid, "Status", 1);
                    SetPVarInt(playerid, "neon10", CreateObject(18650, 0, 0, 0, 0, 0, 0));
                    SetPVarInt(playerid, "neon11", CreateObject(18650, 0, 0, 0, 0, 0, 0));
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon10"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon11"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Dzeltens neons uzstaadiits!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }
    
    // Zalsh neons
    if (strcmp(cmdtext, "/neon 3", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                    DeletePVar(playerid, "Status");
                    SetPVarInt(playerid, "Status", 1);
                    SetPVarInt(playerid, "neon4", CreateObject(18649, 0, 0, 0, 0, 0, 0));
                    SetPVarInt(playerid, "neon5", CreateObject(18649, 0, 0, 0, 0, 0, 0));
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon4"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon5"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Zalsh neons uzstaadiits!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }
    
    // Balts neons
    if (strcmp(cmdtext, "/neon 4", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                    DeletePVar(playerid, "Status");
                    SetPVarInt(playerid, "Status", 1);
                    SetPVarInt(playerid, "neon6", CreateObject(18652, 0, 0, 0, 0, 0, 0));
                    SetPVarInt(playerid, "neon7", CreateObject(18652, 0, 0, 0, 0, 0, 0));
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon6"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon7"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Balts neons uzstaadiits!");
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }
    
    // Rozaa neons
    if (strcmp(cmdtext, "/neon 5", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                    DeletePVar(playerid, "Status");
                    SetPVarInt(playerid, "Status", 1);
                    SetPVarInt(playerid, "neon8", CreateObject(18651, 0, 0, 0, 0, 0, 0));
                    SetPVarInt(playerid, "neon9", CreateObject(18651, 0, 0, 0, 0, 0, 0));
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon8"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachObjectToVehicle(GetPVarInt(playerid, "neon9"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    SendClientMessage(playerid, COLOR_GREEN, "INFO: Rozaa neons uzstaadiits!");
                }
            }
       	else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }

	// Likvideet neonu
    if (strcmp(cmdtext, "/delneon", true) == 0) {
        if (GetPlayerScore(playerid) >= 14) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                } else {
                    SendClientMessage(playerid, COLOR_RED, "INFO: Neons nonemts!");
                    DestroyObject(GetPVarInt(playerid, "neon"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon1"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon2"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon3"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon4"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon5"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon6"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon7"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon8"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon9"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon10"));
                    DeletePVar(playerid, "Status");
                    DestroyObject(GetPVarInt(playerid, "neon13"));
                }
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 14. liimena!");
        }
        return 1;
    }

 	// Level 16
    if (strcmp(cmdtext, "/inos", true) == 0) {
        if (GetPlayerScore(playerid) >= 16) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nevari lietot sho komandu shim transportliidzeklim!");
                    } else {
             		    if (INos[playerid] == 1) {
	                        if (IsDriver[playerid] == 1) {
		       					INos[playerid] = 0;
	   							//KillTimer(INosTimer[playerid]);
							 	//RemoveVehicleComponent(GetPlayerVehicleID(playerid), 1010);
							    SendClientMessage(playerid, COLOR_RED, "INFO: Infinite NOS izsleegts!");
							    return 1;
		  					}
	        			}
						if (INos[playerid] == 0) {
	                        if (IsDriver[playerid] == 1) {
		       					INos[playerid] = 1;
								//INosTimer[playerid] = SetTimerEx("INosTimers", 2000, true, "d", playerid);
	   							//AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
	   							SendClientMessage(playerid, COLOR_GREEN, "INFO: Infinite NOS iesleegts!");
							    return 1;
		  					}
	        			}
					}
			} else {
 				SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
   			}
		else {
 			SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
   		}
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 16. liimena!");
    	}
        return 1;
    }
    
    // Level 18
    if (strcmp(cmdtext, "/afix", true) == 0) {
        if (GetPlayerScore(playerid) >= 20) {
        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (AFix[playerid]) {
	                        IsDriver[playerid] = 1;
       						AFix[playerid] = 0;
				    		SendClientMessage(playerid, COLOR_RED, "INFO: Auto fix izsleegts!");
					    	return 1;
	        			} else {
	                        IsDriver[playerid] = 1;
 							AFix[playerid] = 1;
 							SendClientMessage(playerid, COLOR_GREEN, "INFO: Auto fix iesleegts!");
				    		return 1;
		  					}
            }
        else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 20. liimena!");
    	}
        return 1;
    }
	
	// Level 22
	if (strcmp("/mycar", cmdtext, true, 10) == 0) {
	    if (GetPlayerScore(playerid) >= 22) {
	    	if (locked[playerid] == 0)
			{
	        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Aizsleedz kaadu mashiinu un tad izmanto sho komandu!");
		        return 1;
		    }
	    	if (IsPlayerInAnyVehicle(playerid))
			{
  				SendClientMessage(playerid, COLOR_GREY, "ERROR: Tu nedriiksti atrasties transportliidzeklii izmantojot sho komandu!");
   				return 1;
   			}
	    	if (locked[playerid] == 1)
			{
	   		    new Float: X, Float: Y, Float: Z, Float: Angle, int1;
	   			GetPlayerPos(playerid, X, Y, Z);
				GetPlayerFacingAngle(playerid, Angle);
				int1 = GetPlayerInterior(playerid);
				SetVehiclePos(carid[playerid], X, Y, Z);
				LinkVehicleToInterior(carid[playerid], int1);
				SetVehicleZAngle(carid[playerid], Angle);
	   			PutPlayerInVehicle(playerid, carid[playerid], 0);
	   			return 1;
 			}
  		} else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 22. liimena!");
        }
  		return 1;
	}
	
/*
	// Level x
    if (strcmp(cmd, "/plate", true) == 0) {
        if (GetPlayerScore(playerid) >= 0) {
        new plate[128], Index;
        plate = strtok(cmdtext, Index);
        new nplate[MAX_PLAYERS];
        new Vehicle = GetPlayerVehicleID(playerid);
        new Float:X,Float:Y,Float:Z,Float:Za; //Float:Za;
        //new Vehicle, plate[MAX_PLAYERS];
    	//new tmp[256], Index;
	    //tmp = strtok(cmdtext,Index);

		format(nplate[playerid],128,"%s",plate);

        if (IsPlayerInAnyVehicle(playerid))
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
                    SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari lietot sho komandu shim transportliidzeklim!");
                    return 1;
                }
					if(strlen(plate))
					{
                        SendClientMessage(playerid, COLOR_WHITE, "PIELIETOJUMS: /plate [Teksts]");
                        GetVehiclePos(Vehicle,Float:X,Float:Y,Float:Z);
                        GetVehicleZAngle(Vehicle,Float:Za);
                        SetVehicleNumberPlate(Vehicle,plate);
                        SetVehicleToRespawn(Vehicle);
                        SetVehiclePos(Vehicle,Float:X,Float:Y,Float:Z);
                        SetVehicleZAngle(Vehicle,Float:Za);
						PutPlayerInVehicle(playerid,Vehicle,0);
                        format(nplate,128,"INFO: Tavam transportliidzeklim tika nomainiits registraacijas numurs uz '%s'!",plate);
						SendClientMessage(playerid, COLOR_GREEN, plate);
					}
	        } else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
        } else {
            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }
*/
/*
    	// Level x
    if (strcmp(cmd, "/plate", true) == 0) {
        if (GetPlayerScore(playerid) >= 0) {
	        if (IsPlayerInAnyVehicle(playerid))
	            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	                if (OnBike[playerid] == 1 || OnBoat[playerid] == 1 || OnAirplane[playerid] == 1 || OnHeli[playerid] == 1) {
	                    SendClientMessage(playerid, COLOR_BRIGHTRED, "Tu nevari lietot sho komandu shim transportliidzeklim!");
	                    return 1;
	                }
					new Vehicle, Plate[16], Float:Health, Float:X, Float:Y, Float:Z, Float:ZA;
					if(sscanf("s", Plate)) return SendClientMessage(playerid, COLOR_GREY, "ERROR: /plate [Teksts]");
					Vehicle = GetPlayerVehicleID(playerid);
					GetVehicleHealth(Vehicle, Health);
					GetVehiclePos(Vehicle, X, Y, Z);
					GetVehicleZAngle(Vehicle, ZA);
					SetVehicleNumberPlate(Vehicle,Plate);
					SetVehicleToRespawn(Vehicle);
					SetVehiclePos(Vehicle, X, Y, Z);
					SetVehicleHealth(Vehicle, Health);
					PutPlayerInVehicle(playerid,Vehicle,0);
					SetVehicleZAngle(Vehicle, ZA);
					SendClientMessage(playerid, COLOR_GREEN, "INFO: Tu nomainiji savas mashias registracijas numuru uz '%s'!");

		        } else {
		            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaabuut transportliidzekla vadiitaajam, lai izmantotu sho komandu!");
	        } else {
	            SendClientMessage(playerid, COLOR_GREY, "ERROR: Tev jaatrodas transportliidzeklii, lai izmantotu sho kommandu!");
	        }
        } else {
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 11. liimena!");
    	}
        return 1;
    }
*/
	
    // -------------------------------- BUNKURI --------------------------------
    
    // Level 9
    // Bike bunkura vaarti
    if (strcmp(cmdtext, "/bgates", true) == 0) {
        if(GetPlayerScore(playerid) < 9) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 9. liimena!");
        if (GateVariable6 == 0) {
            MoveObject(bgates, 2310.156787, -582.684082, 125.235031, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Bike bunkura vaarti atveerti!");
            GateVariable6 = 1;
        } else if (GateVariable6 == 1) {
            MoveObject(bgates, 2310.456787, -582.684082, 131.235031, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Bike bunkura vaarti aizveerti!");
            GateVariable6 = 0;
        }
        return 1;
    }
    
    // Level 12
    // Laivu bunkura ieejas vaarti
    if (strcmp(cmdtext, "/lgates", true) == 0) {
        if(GetPlayerScore(playerid) < 12) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 12. liimena!");
        if (GateVariable8 == 0) {
            MoveObject(lgates, 2572.590576, -2120.212891, -4.043551, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Laivu bunkura ieejas vaarti atveerti! Lieto /l2gates, lai atveertu lielos laivu bunkura vaartus!");
            GateVariable8 = 1;
        } else if (GateVariable8 == 1) {
            MoveObject(lgates, 2572.590576, -2120.212891, 8.043551, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Laivu bunkura ieejas vaarti aizveerti!");
            GateVariable8 = 0;
        }
        return 1;
    }
    
    // Laivu bunkura lielie vaarti
    if (strcmp(cmdtext, "/l2gates", true) == 0) {
        if(GetPlayerScore(playerid) < 12) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 12. liimena!");
        if (GateVariable9 == 0) {
            MoveObject(l2gates, 2539.000000, -2247.470703, 7.611582, 3); //vala
            MoveObject(l22gates, 2628.000000, -2247.450195, 7.570127, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Laivu bunkura lielie vaarti atveerti!");
            GateVariable9 = 1;
        } else if (GateVariable9 == 1) {
            MoveObject(l2gates, 2566.000000, -2247.470703, 7.611582, 3); //ciet
            MoveObject(l22gates, 2601.000000, -2247.450195, 7.570127, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Laivu bunkura lielie vaarti aizveerti!");
            GateVariable9 = 0;
        }
        return 1;
    }
    
    // Level 17
    // Tuned Locolow cars bunkura vaarti
    if (strcmp(cmdtext, "/tlgates", true) == 0) {
        if(GetPlayerScore(playerid) < 17) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 17. liimena!");
        if (GateVariable11 == 0) {
            MoveObject(tlgates, 1925.708496, 1032.925171, 27.847254, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Tuned Locolow bunkura vaarti atveerti!");
            GateVariable11 = 1;
        } else if (GateVariable11 == 1) {
            MoveObject(tlgates, 1925.708496, 1032.925171, 20.847254, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Tuned Locolow bunkura vaarti aizveerti!");
            GateVariable11 = 0;
        }
        return 1;
    }

    // Level 19
    // Tuned Arch cars bunkura vaarti
    if (strcmp(cmdtext, "/tagates", true) == 0) {
        if(GetPlayerScore(playerid) < 19) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 19. liimena!");
        if (GateVariable7 == 0) {
            MoveObject(tagates, -793.539124, 2417.428223, 148.275421, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Tuned arch bunkura vaarti atveerti!");
            GateVariable7 = 1;
        } else if (GateVariable7 == 1) {
            MoveObject(tagates, -793.539124, 2417.428223, 154.275421, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Tuned arch bunkura vaarti aizveerti!");
            GateVariable7 = 0;
        }
        return 1;
    }

    // Level 20
    // Armijas 1. bunkura vaarti
    if (strcmp(cmdtext, "/a1gates", true) == 0) {
        if(GetPlayerScore(playerid) < 20) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 20. liimena!");
        if (GateVariable == 0) {
            MoveObject(a1gates, 283.196991, 1953.267944, 22.987516, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: 1. Armijas bunkura vaarti atveerti!");
            GateVariable = 1;
        } else if (GateVariable == 1) {
            MoveObject(a1gates, 283.196991, 1953.267944, 15.987516, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: 1. Armijas bunkura vaarti aizveerti!");
            GateVariable = 0;
        }
        return 1;
    }
    
    // Level 21
    // Monster bunkura vaarti
    if (strcmp(cmdtext, "/mgates", true) == 0) {
        if(GetPlayerScore(playerid) < 21) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 21. liimena!");
        if (GateVariable10 == 0) {
            MoveObject(mgates, 1917.373047, 2135.522705, 4.244518, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Monster bunkura vaarti atveerti!");
            GateVariable10 = 1;
        } else if (GateVariable10 == 1) {
            MoveObject(mgates, 1917.373047, 2135.522705, 12.244518, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Monster bunkura vaarti aizveerti!");
            GateVariable10 = 0;
        }
        return 1;
    }
    
    // Level 23
    // Armijas 2. bunkura vaarti
    if (strcmp(cmdtext, "/a2gates", true) == 0) {
        if(GetPlayerScore(playerid) < 23) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 23. liimena!");
        if (GateVariable2 == 0) {
            MoveObject(a2gates, 283.187775, 1987.659546, 22.987516, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: 2. Armijas bunkura vaarti atveerti!");
            GateVariable2 = 1;
        } else if (GateVariable2 == 1) {
            MoveObject(a2gates, 283.187775, 1987.659546, 15.987516, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: 2. Armijas bunkura vaarti aizveerti!");
            GateVariable2 = 0;
        }
        return 1;
    }
    
    // Level 24
    // Seasparrow bunkura ieejas vaarti
    if (strcmp(cmdtext, "/ssgates", true) == 0) {
        if(GetPlayerScore(playerid) < 24) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 24. liimena!");
        if (GateVariable5 == 0) {
            MoveObject(ssgates, -2761.717285, 1259.862671, 15.762506, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: Seasparrow bunkura ieejas vaarti atveerti!");
            GateVariable5 = 1;
        } else if (GateVariable5 == 1) {
            MoveObject(ssgates, -2761.717285, 1259.862671, 10.762506, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: Seasparrow bunkura ieejas vaarti aizveerti!");
            GateVariable5 = 0;
        }
        return 1;
    }
    
    // Level 25
    // Armijas 3. bunkura vaarti
    if (strcmp(cmdtext, "/a3gates", true) == 0) {
        if(GetPlayerScore(playerid) < 25) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Sho kommandu var izmantot tikai no 25. liimena!");
        if (GateVariable3 == 0) {
            MoveObject(a3gates, 283.170654, 2021.916992, 22.987516, 3); //vala
            SendClientMessage(playerid, COLOR_GREEN, "INFO: 3. Armijas bunkura vaarti atveerti!");
            GateVariable3 = 1;
        } else if (GateVariable3 == 1) {
            MoveObject(a3gates, 283.170654, 2021.916992, 15.987516, 3); //ciet
            SendClientMessage(playerid, COLOR_RED, "INFO: 3. Armijas bunkura vaarti aizveerti!");
            GateVariable3 = 0;
        }
        return 1;
    }
    return 0;
}

public CountDown() {
    if (Count > 0) {
        GameTextForAll(CountText[Count - 1], 2500, 3);
        Count--;
        SetTimer("CountDown", 1000, 0);
    } else {
        GameTextForAll("~g~Go Go Go!", 2500, 3);
        Count = 5;
    }
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (INos[playerid] == 1) {
	    if ( HOLDING( KEY_FIRE ) && GetPlayerState( playerid ) == PLAYER_STATE_DRIVER )
	    {
	          AddVehicleComponent( GetPlayerVehicleID( playerid ), 1010 );
	    }

	    if (  RELEASED( KEY_FIRE ) && GetPlayerState( playerid ) == PLAYER_STATE_DRIVER )
	    {
	          RemoveVehicleComponent( GetPlayerVehicleID( playerid ), 1010 );
	    }
	}

	if (newkeys == KEY_ENTER && IsPlayerInAnyVehicle(playerid) && Act[playerid] == 1) {
	    Enabled[playerid] = 0;
	    Act[playerid] = 0;
	    SendClientMessage(playerid, COLOR_RED, "INFO: Anti-Fall izsleegts!");
	}

	if (newkeys == KEY_ACTION) {
	    if (change[playerid] == 1) {
	        if (IsPlayerInAnyVehicle(playerid)) {
	            if (CreatedRamp[playerid] == true) DestroyObject(Ramp[playerid]), CreatedRamp[playerid] = false;
	            new Float: pX, Float: pY, Float: pZ, Float: vA, Arabam = GetPlayerVehicleID(playerid);
	            KillTimer(RampReset[playerid]);
	            GetVehiclePos(Arabam, pX, pY, pZ);
	            GetVehicleZAngle(Arabam, vA);
	            GetVehiclePos(Arabam, pX, pY, pZ);
	            GetVehicleZAngle(Arabam, vA);
	            if (ramp[playerid] == 1) {
	                Ramp[playerid] = CreateObject(Pers[playerid], pX + (20.0 * floatsin(-vA, degrees)), pY + (20.0 * floatcos(-vA, degrees)), pZ + 0.3, 0, 0, vA);
	            }
	            CreatedRamp[playerid] = true;
	            RampReset[playerid] = SetTimerEx("destroy", 3000, 0, "d", playerid);
	        }
	    }
	}
	return 1;
}

forward destroy(playerid);
public destroy(playerid)
{
	if(CreatedRamp[playerid] == true)
	{
	return DestroyObject(Ramp[playerid]),CreatedRamp[playerid] = false;
	}
	else
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
    new Vid = GetVehicleModel(GetPlayerVehicleID(playerid));
    if (newstate == PLAYER_STATE_DRIVER) {
        if (Vid == 509 || Vid == 481 || Vid == 510 || Vid == 462 || Vid == 448 || Vid == 581 || Vid == 522 || Vid == 461 || Vid == 521 || Vid == 523 || Vid == 463 || Vid == 586 || Vid == 468 || Vid == 471) {
            OnBike[playerid] = 1;
        }
        if (Vid == 472 || Vid == 473 || Vid == 493 || Vid == 595 || Vid == 484 || Vid == 430 || Vid == 453 || Vid == 452 || Vid == 446 || Vid == 454) {
            OnBoat[playerid] = 1;
        }
        if (Vid == 592 || Vid == 577 || Vid == 511 || Vid == 512 || Vid == 593 || Vid == 520 || Vid == 553 || Vid == 476 || Vid == 519 || Vid == 460 || Vid == 513) {
            OnAirplane[playerid] = 1;
        }
        if (Vid == 548 || Vid == 425 || Vid == 417 || Vid == 487 || Vid == 488 || Vid == 497 || Vid == 563 || Vid == 447 || Vid == 469) {
            OnHeli[playerid] = 1;
        }
        //InCarINos[playerid] = 1;
        IsPassenger[playerid] = 0;
        IsDriver[playerid] = 1;
        IsOnfoot[playerid] = 0;
    }
    if (newstate == PLAYER_STATE_PASSENGER) {
        //InCarINos[playerid] = 0;
        IsDriver[playerid] = 0;
        IsPassenger[playerid] = 1;
        IsOnfoot[playerid] = 0;
    }
    if (newstate == PLAYER_STATE_ONFOOT) {
        //InCarINos[playerid] = 0;
        OnBoat[playerid] = 0;
        OnBike[playerid] = 0;
        OnAirplane[playerid] = 0;
        OnHeli[playerid] = 0;
        IsDriver[playerid] = 0;
        IsPassenger[playerid] = 0;
        IsOnfoot[playerid] = 1;
    }
    if (Act[playerid] == 1) {
        if (oldstate == PLAYER_STATE_DRIVER) {
            if (newstate == PLAYER_STATE_ONFOOT) {
                PutPlayerInVehicle(playerid, VehicleAntifall[playerid], 0);
            }
        }
    }
    if (Act[playerid] == 1) {
        if (oldstate == PLAYER_STATE_PASSENGER) {
            if (newstate == PLAYER_STATE_ONFOOT) {
                PutPlayerInVehicle(playerid, VehicleAntifall[playerid], 2);
            }
        }
    }
    return 1;
}

public Repair()
{
    for( new playerid=0; playerid < MAX_PLAYERS; playerid++ )
    {
    if (IsPlayerInAnyVehicle(playerid))
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    		if(!AFix[playerid]) return 0;{
    			RepairVehicle(GetPlayerVehicleID(playerid));
			}
		}
    }
    return 1;
}

DialogText()
{
    LevelDialog = "{B7FF00}Level 1 {FFFFFF}- $100.000 - /flip \n";
    strcat(LevelDialog, "{B7FF00}Level 2 {FFFFFF}- $200.000 - /nos\n");
    strcat(LevelDialog, "{B7FF00}Level 3 {FFFFFF}- $300.000 - /count\n");
    strcat(LevelDialog, "{B7FF00}Level 4 {FFFFFF}- $400.000 - /eject\n");
    strcat(LevelDialog, "{B7FF00}Level 5 {FFFFFF}- $500.000 - /lock\n");
    strcat(LevelDialog, "{B7FF00}Level 6 {FFFFFF}- $600.000 - /ramps\n");
    strcat(LevelDialog, "{B7FF00}Level 7 {FFFFFF}- $700.000 - /af\n");
    strcat(LevelDialog, "{B7FF00}Level 8 {FFFFFF}- $800.000 - /car\n");
    strcat(LevelDialog, "{B7FF00}Level 9 {FFFFFF}- $900.000 - /bgates\n");
    strcat(LevelDialog, "{B7FF00}Level 10 {FFFFFF}- $1.000.000 - /rims\n");
    strcat(LevelDialog, "{B7FF00}Level 11 {FFFFFF}- $1.100.000 - /poptires\n");
    strcat(LevelDialog, "{B7FF00}Level 12 {FFFFFF}- $1.200.000 - /lgates\n");
    strcat(LevelDialog, "{B7FF00}Level 13 {FFFFFF}- $1.300.000 - /savepos\n");
    strcat(LevelDialog, "{B7FF00}Level 14 {FFFFFF}- $1.400.000 - /neon\n");
    strcat(LevelDialog, "{B7FF00}Level 15 {FFFFFF}- $1.500.000 - Armor\n");
    strcat(LevelDialog, "{B7FF00}Level 16 {FFFFFF}- $1.600.000 - /inos\n");
    strcat(LevelDialog, "{B7FF00}Level 17 {FFFFFF}- $1.700.000 - /tlgates\n");
    strcat(LevelDialog, "{B7FF00}Level 18 {FFFFFF}- $1.800.000 - /afix\n");
    strcat(LevelDialog, "{B7FF00}Level 19 {FFFFFF}- $1.900.000 - /tagates\n");
    strcat(LevelDialog, "{B7FF00}Level 20 {FFFFFF}- $2.000.000 - /a1gates\n");
    strcat(LevelDialog, "{B7FF00}Level 21 {FFFFFF}- $2.100.000 - /mgates\n");
    strcat(LevelDialog, "{B7FF00}Level 22 {FFFFFF}- $2.200.000 - /mycar\n");
    strcat(LevelDialog, "{B7FF00}Level 23 {FFFFFF}- $2.300.000 - /a2gates\n");
    strcat(LevelDialog, "{B7FF00}Level 24 {FFFFFF}- $2.400.000 - /ssgates\n");
    strcat(LevelDialog, "{B7FF00}Level 25 {FFFFFF}- $2.500.000 - /a3gates\n");
    return 1;
}
