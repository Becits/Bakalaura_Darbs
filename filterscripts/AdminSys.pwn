#include <a_samp>
#include <Dini>

#pragma unused ret_memcpy
#pragma tabsize 0

// Kraasu defineeshana
#define COLOR_BRIGHTRED 0xFF6C6CFF
#define COLOR_RED 0xFF6C6CFF
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIME 0x99FF00AA
#define COLOR_LIGHTBLUE 0x33CCFFAA

// Dialogu ID
#define DIALOG_LOGIN 3
#define DIALOG_REG 4

// DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

enum Player_stats
{
	Admin,
 	Logged,
 	Regged,
	Deaths,
	Kills,
	Money,
	Score,
	Muted,
	MuteWarnings
}
new Player[MAX_PLAYERS][Player_stats];

// Prieksh /veh komandas
new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
	"Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina",
	"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B",
	"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	"Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
	"Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};

// Cik ilgs laiks jaaseezh cietumaa.
new JTime[MAX_PLAYERS];
new JTTimer[MAX_PLAYERS];
// Uztaisa jaunu mainiigo prieksh Text Draw
new Text:JailTextDraw[MAX_PLAYERS];

// Cik ilgs laiks jaaklusee.
new MTime[MAX_PLAYERS];
new MTTimer[MAX_PLAYERS];
// Uztaisa jaunu mainîgo prieksh Text Draw
new Text:MuteTextDraw[MAX_PLAYERS];

// Vai esi noðâvis savçjo.
new TeamKill[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{

    // Text Draw priekð jail
	JailTextDraw[playerid] = TextDrawCreate(500.0,320.0,"--");
	TextDrawFont(JailTextDraw[playerid],3);
	TextDrawLetterSize(JailTextDraw[playerid],1.5 ,3.5);
	TextDrawSetOutline(JailTextDraw[playerid], 2);
	TextDrawColor(JailTextDraw[playerid],0xffffffff);
	// Text Draw priekð mute
	MuteTextDraw[playerid] = TextDrawCreate(500.0,320.0,"--");
	TextDrawFont(MuteTextDraw[playerid],3);
	TextDrawLetterSize(MuteTextDraw[playerid],1.5 ,3.5);
	TextDrawSetOutline(MuteTextDraw[playerid], 2);
	TextDrawColor(MuteTextDraw[playerid],0xffffffff);
	// Uzliek spçlçtâjam visu pa 0
	Player[playerid][Admin] = 0;
	Player[playerid][Logged] = 0;
	Player[playerid][Regged] = 0;
	Player[playerid][Kills] = 0;
	Player[playerid][Deaths] = 0;
	Player[playerid][Money] = 0;
	Player[playerid][Score] = 0;
	Player[playerid][Muted] = 0;
	Player[playerid][MuteWarnings] = 0;
	// Registrs/Logins
	new pname[MAX_PLAYERS],accFormat[128];
	GetPlayerName(playerid,pname,sizeof pname);
	format(accFormat,sizeof accFormat,"acc/%s.sav",pname);
	if(fexist(accFormat))
	{
		ShowPlayerDialog(playerid,DIALOG_LOGIN,1,"Registrs","Ludzu ielogojies!","Labi","Atcelt");
	}
	else
	{
		ShowPlayerDialog(playerid,DIALOG_REG,1,"Registrs","Ludzu registrejies, lai saglabatu datus!","Labi","Atcelt");
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// Saglabaa speeleetaaja datus
    new pname[MAX_PLAYERS],accFormat[128];
	GetPlayerName(playerid,pname,sizeof pname);
	format(accFormat,sizeof accFormat,"acc/%s.sav",pname);
	if(fexist(accFormat))
	{
	dini_IntSet(accFormat,"Admin",Player[playerid][Admin]);
	Player[playerid][Logged] = 0;
	Player[playerid][Regged] = 1;
	dini_IntSet(accFormat,"Kills",Player[playerid][Kills]);
	dini_IntSet(accFormat,"Deaths",Player[playerid][Deaths]);
	dini_IntSet(accFormat,"Money",GetPlayerMoney(playerid));
	dini_IntSet(accFormat,"Score",GetPlayerScore(playerid));
	dini_IntSet(accFormat,"Muted",Player[playerid][Muted]);
	dini_IntSet(accFormat,"MuteWarnings",Player[playerid][MuteWarnings]);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// Vai spçlçtâju nogalinâja cietumâ
  	if(TeamKill[playerid] == 1)
    {
    SetPlayerPos(playerid,-11.5327,2328.8679,24.1406);
    ResetPlayerWeapons(playerid);
    }
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	Player[killerid][Kills]++;
    Player[playerid][Deaths]++;
    // Vai Speletajs nogalinâja kâdu iekð cietuma
    if(TeamKill[playerid] == 1 && TeamKill[killerid] == 1)
    {
	new KillerName[MAX_PLAYER_NAME], string[128];
	GetPlayerName(killerid, KillerName, MAX_PLAYER_NAME);
 	format(string,sizeof(string),"Speletajs %s tika kikots. Iemesls: Kill in Jail",KillerName);
	SendClientMessageToAll(COLOR_WHITE, string);  print(string);
  	Kick(killerid);
    }
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(Player[playerid][Muted] == 1)
	{
	new string[128];
	Player[playerid][MuteWarnings]++;
	if(Player[playerid][MuteWarnings] < 5) {
	format(string, sizeof(string),"Tu tiki apklusinats. Ja turpinasi runat tiksi kikots. (%d / %d)", Player[playerid][MuteWarnings], 5 );
	SendClientMessage(playerid,COLOR_BRIGHTRED,string);
	} else {
	SendClientMessage(playerid,COLOR_BRIGHTRED,"Tu tiki bridinats. Tagad esi izkikots.");
	format(string, sizeof(string),"%s (ID %d) tika kikots. Iemesls: Neievero bridinajumus.", PlayerName2(playerid), playerid);
	SendClientMessageToAll(COLOR_BRIGHTRED,string);
	Player[playerid][MuteWarnings] = 0;
	Kick(playerid);
	} return 0;
	}
	new string[128], playername[MAX_PLAYER_NAME];
    new PlayerColor = GetPlayerColor(playerid);
    GetPlayerName(playerid, playername, sizeof(playername));
    format(string, sizeof(string), "%s [%d]: {FFFFFF}%s", playername, playerid, text);
    SendClientMessageToAll(PlayerColor, string);
    return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    // Moderatora komandas
    dcmd(a,1,cmdtext);
    dcmd(mute,4,cmdtext);
	dcmd(unmute,6,cmdtext);
    dcmd(kick,4,cmdtext);
	dcmd(jail,4,cmdtext);
	dcmd(unjail,6,cmdtext);
	
	// Administratora komandas
	dcmd(time,4,cmdtext);
	dcmd(info,4,cmdtext);
    dcmd(spec,4,cmdtext);
    dcmd(specoff,7,cmdtext);
	dcmd(weather,7,cmdtext);
	dcmd(ban,3,cmdtext);
	
	// Servera iipashnieka komandas
	dcmd(unban,5,cmdtext);
	dcmd(dec,3,cmdtext);
	dcmd(makeadmin,9,cmdtext);
	dcmd(setscore,8,cmdtext);
	dcmd(goto,4,cmdtext);
	dcmd(get,3,cmdtext);
	dcmd(veh,3,cmdtext);
	dcmd(setcash,7,cmdtext);
	dcmd(resetstats,10,cmdtext);
	
	// Suudziibu komanda, visiem briivi pieejama
	dcmd(report,6,cmdtext);
	
	// Mainiigais
	new string[256];
	
	// Moderatora komandas
	if (strcmp("/level 1", cmdtext, true, 10) == 0)
	{
		if(Player[playerid][Admin] < 1){
			SendClientMessage (playerid,COLOR_RED,"Tev nav autorizacijas lietot so komandu!");
		 	return 1;
		}
		SendClientMessage (playerid,COLOR_LIME,"MODERATORA KOMANDAS");
		SendClientMessage(playerid, COLOR_WHITE, "/a /mute, /unmute, /kick, /jail, /unjail.");
		return 1;
	}
	
	// Administratora komandas
	if (strcmp("/level 2", cmdtext, true, 10) == 0)
	{
		if(Player[playerid][Admin] < 2){
			SendClientMessage (playerid,COLOR_RED,"Tev nav autorizacijas lietot so komandu!");
		 	return 1;
		}
		SendClientMessage (playerid,COLOR_LIME,"ADMINISTRATORA KOMANDAS");
		SendClientMessage(playerid, COLOR_WHITE, "/a /mute, /unmute, /kick, /jail, /unjail, /time, /info, /ban, /weather, /spec, /specoff.");
		return 1;
	}
	
	// Servera iipashnieka komandas
	if (strcmp("/level 3", cmdtext, true, 10) == 0)
	{
		if(Player[playerid][Admin] < 3){
			SendClientMessage (playerid,COLOR_RED,"Tev nav autorizacijas lietot so komandu!");
		 	return 1;
		}
		SendClientMessage (playerid,COLOR_LIME,"SERVERA IPASNIEKA KOMANDAS");
		SendClientMessage(playerid, COLOR_WHITE, "/a /mute, /unmute, /kick, /jail, /unjail, /time, /info, /ban, /weather, /spec, /specoff.");
		SendClientMessage(playerid, COLOR_WHITE, "/v, /makeadmin, /setscore, /setcash, /get, /goto, /resetstats, /dec, /unban.");
		return 1;
	}
	
	// Visiem briivi pieeja apskatiit savus datus
	if (strcmp("/stats", cmdtext, true, 10) == 0)
	{
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		format(string, sizeof(string), "Stati: Nogalinatie: %d | Naves: %d | Starpiba: %0.2f | Nauda: $%d | Limenis: %d",Player[playerid][Kills], Player[playerid][Deaths],Float:Player[playerid][Kills]/Float:Player[playerid][Deaths],GetPlayerMoney(playerid),GetPlayerScore(playerid));
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		return 1;
	}
	return 0;
}

// -------------------------------------------------------ADMINISTRACIJAS SITEMA-----------------------------------------------

dcmd_mute(playerid,params[])
	{
	new Reason[256], pID;
    if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
 	if(sscanf(params,"uds",pID,MTime[pID],Reason)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /mute [ID] [Laiks] [Iemesls]");
	}
	if(!IsPlayerConnected(pID)) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste.");
 	}
	if(Player[playerid][Admin] < Player[pID][Admin]){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Tu nevari apklusinat augstakas pakapes adminu.");
	}
	if(Player[playerid][Muted] == 1) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs jau ir apklusinats.");
 	}
	new
 	name[MAX_PLAYER_NAME],
 	string[256];
	GetPlayerName(pID,name,sizeof(name));
	new Aname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,Aname,sizeof(Aname));
	format(string,sizeof(string),"Admins aizliedza %s sarunaties uz %d sekundçm. [Iemesls: %s]",name,MTime,Reason);
	SendClientMessageToAll(COLOR_WHITE,string);
 	MutedTime(pID);
 	Player[pID][Muted] = 1;
  	return 1;
}

dcmd_unmute(playerid,params[])
	{
	new pID;
    if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /unmute [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	if(Player[playerid][Muted] == 0){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs nav apklusinats.");
	}
	new string[256], name[MAX_PLAYERS];
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu atïâvi %s sarunâties.",name);
	SendClientMessageToAll(COLOR_WHITE,string);
	Player[pID][Muted] = 0;
 	MTime[pID] = 0;
	KillTimer(MTTimer[pID]);
	TextDrawHideForPlayer(pID, MuteTextDraw[playerid]);
  	return 1;
}

dcmd_spec(playerid,params[])
	{
	new pID;
    if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /spec [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	TogglePlayerSpectating(playerid, 1);
    PlayerSpectatePlayer(playerid, pID);
  	return 1;
}

dcmd_specoff(playerid,params[])
	{
 	#pragma unused params
    if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	TogglePlayerSpectating(playerid, 0);
  	return 1;
}

dcmd_resetstats(playerid,params[])
	{
	new pID;
    if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /resetstats [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	Player[pID][Kills] = 0;
	Player[pID][Deaths] = 0;
	Player[pID][Money] = 0;
	Player[pID][Score] = 0;
	ResetPlayerMoney(pID);
	SetPlayerScore(pID,0);
	new string[256], name[MAX_PLAYERS];
	GetPlayerName(pID,name,sizeof(name));
	format(string, sizeof(string), "Tu restarteji %s datus.",name);
	SendClientMessage(playerid, COLOR_WHITE, string);
  	return 1;
}

dcmd_info(playerid,params[])
	{
	new pID;
    if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /info [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new string[256], name[MAX_PLAYERS];
	GetPlayerName(pID,name,sizeof(name));
	format(string, sizeof(string), "%s stati: Nogalinatie: %d | Naves: %d | Starpiba: %0.2f | Nauda: $%d | Limenis: %d",name,Player[pID][Kills], Player[pID][Deaths],Float:Player[pID][Kills]/Float:Player[pID][Deaths],GetPlayerMoney(pID),GetPlayerScore(pID));
	SendClientMessage(playerid, COLOR_WHITE, string);
  	return 1;
}

dcmd_report(playerid,params[])
	{
	new pID, sReason[128];
	if(sscanf(params,"ds",pID,sReason)) {
	return  SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /report [ID] [Iemesls]");
	}
	if(!IsPlayerConnected(pID)) {
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new Tplayer[MAX_PLAYER_NAME],string[128];
	GetPlayerName(pID,Tplayer,sizeof(Tplayer));
	format(string,sizeof(string),"Sudziba: %s nosudzeja [ID %d]. [Iemesls: %s]",Tplayer,pID,sReason[0] ? sReason : "<Nav iemesla>");
	SendAdminMessage(COLOR_YELLOW,string);
	return 1;
}

dcmd_kick(playerid,params[])
	{
	new Reason[256], pID;
    if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"us",pID,Reason)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /kick [ID] [Iemesls]");
	}
	if(!IsPlayerConnected(pID)) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
  	}
	if(Player[playerid][Admin] < Player[pID][Admin]){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Tu nevari izkikot augstakas pakapes administratoru.");
	}
	new name[MAX_PLAYER_NAME],string[256];
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Admins izkikoja %s. [Iemesls: %s]",name,Reason);
	SendClientMessageToAll(COLOR_WHITE,string);
 	Kick(pID);
  	return 1;
}

dcmd_jail(playerid,params[])
	{
	new Reason[256], pID;
    if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
 	if(sscanf(params,"uds",pID,JTime[pID],Reason)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /jail [ID] [Laiks] [Iemesls]");
	}
	if(!IsPlayerConnected(pID)) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
 	}
	if(Player[playerid][Admin] < Player[pID][Admin]){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Tu nevari ielikt augstakas pakapes adminu cietuma.");
	}
	if(TeamKill[pID] == 1) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs jau atrodas cietuma.");
 	}
	new
 	name[MAX_PLAYER_NAME],
 	string[256];
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Admins ielika %s cietuma uz %d sekundem. [Iemesls: %s]",name,JTime,Reason);
	SendClientMessageToAll(COLOR_WHITE,string);
	TeamKill[pID] = 1;
	JailTime(pID);
	SetPlayerPos(pID,-11.5327,2328.8679,24.1406);
 	TextDrawShowForPlayer(pID, JailTextDraw[pID]);
  	return 1;
}

dcmd_unjail(playerid,params[])
	{
	new pID;
    if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /unjail [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	if(TeamKill[pID] == 0){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs neatrodas cietuma.");
	}
	TeamKill[pID] = 0;
	JTime[pID] = 0;
	KillTimer(JTTimer[pID]);
	SpawnPlayer(pID);
	TextDrawHideForPlayer(pID, JailTextDraw[pID]);
  	return 1;
}

dcmd_ban(playerid,params[])
	{
	new Reason[256], pID;
	if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"us",pID,Reason)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /ban [ID] [Iemesls]");
	}
	if(!IsPlayerConnected(pID)) {
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
  	}
	if(Player[playerid][Admin] < Player[pID][Admin]){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Tu nevari nobanot augstakas pakapes administratoru.");
	}
	new name[MAX_PLAYER_NAME],string[256];
	GetPlayerName(pID,name,sizeof(name));
	new Aname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,Aname,sizeof(Aname));
	format(string,sizeof(string),"Admins nobanoja %s. [Iemesls: %s]",name,Reason);
	SendClientMessageToAll(COLOR_WHITE,string);
 	Ban(pID);
  	return 1;
}

dcmd_unban(playerid,params[])
	{
	new tmp[256];
    if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",tmp)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /unban [IP]");
	}
	new stringIP[128];
	format(stringIP,sizeof(stringIP),"unbanip %s",tmp);
	SendRconCommand(stringIP);
	format(stringIP,sizeof(stringIP),"IP %s vairs nav banots.",tmp);
	SendClientMessage(playerid,COLOR_WHITE,stringIP);
	SendRconCommand("reloadbans");
  	return 1;
}

dcmd_a(playerid,params[])
	{
	if(Player[playerid][Admin] < 1){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	new atext[128];
	if(sscanf(params,"s",atext)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /a [Zina]");
	}
	new name[MAX_PLAYER_NAME];
	new string[128];
	GetPlayerName(playerid,name,sizeof(name));
	format(string,sizeof(string),"Admins [%s] raksta: %s" ,name,atext);
	SendAdminMessage(COLOR_YELLOW,string);
	return 1;
}
dcmd_dec(playerid,params[])
	{
 	new dtext[128];
 	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"s",dtext)){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /dec [Zina]");
	}
 	GameTextForAll(dtext,3*1000,3);
	return 1;
}
dcmd_makeadmin(playerid,params[])
	{
	new pID;
	if(Player[playerid][Admin] < 3) {
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
	return 1;
	}
 	if(Player[playerid][Admin] == 3 || IsPlayerAdmin(playerid)) {}
	new alevel;
	if(sscanf(params,"ud",pID,alevel)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /makeadmin [ID] [Levels]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new string[128],string2[128],aname[MAX_PLAYER_NAME],name[MAX_PLAYER_NAME];
	Player[pID][Admin] = alevel;
	GetPlayerName(playerid,aname,sizeof(aname));
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu uzstadiji %s admina limeni uz %d.",name,alevel);
 	format(string2,sizeof(string2),"Admins %s uzstadija tavu admina limeni uz %d.",aname,alevel);
 	SendClientMessage(playerid,COLOR_WHITE,string);
 	SendClientMessage(pID,COLOR_WHITE,string2);
	return 1;
}

dcmd_setscore(playerid,params[])
	{
	new pID;
	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	new scores;
	if(sscanf(params,"ud",pID,scores)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /setscore [ID] [Punkti]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new string[128],string2[128],aname[MAX_PLAYER_NAME],name[MAX_PLAYER_NAME];
	SetPlayerScore(pID,scores);
	GetPlayerName(playerid,aname,sizeof(aname));
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu uzstadiji %s limeni uz %d.",name,scores);
    format(string2,sizeof(string2),"Admins %s uzstadija tavu limeni uz %d.",aname,scores);
    SendClientMessage(playerid,COLOR_WHITE,string);
    SendClientMessage(pID,COLOR_WHITE,string2);
	return 1;
}

dcmd_goto(playerid,params[])
	{
	new pID;
	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /goto [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
   	new string[128],name[MAX_PLAYER_NAME];
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu tiki teleportets pie %s.",name);
	new veh = GetPlayerVehicleID(playerid);
	new Float:x,Float:y,Float:z;
	GetPlayerPos(pID,x,y,z);
	SetVehiclePos(veh,x,y,z);
    SendClientMessage(playerid,COLOR_WHITE,string);
    return 1;
    }
    else
    {
	new string[128],name[MAX_PLAYER_NAME];
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu tiki teleportets pie %s.",name);
	new Float:x,Float:y,Float:z;
	GetPlayerPos(pID,x,y,z);
	SetPlayerPos(playerid,x,y,z);
    SendClientMessage(playerid,COLOR_WHITE,string);
	return 1;
	}
}
dcmd_get(playerid,params[])
	{
	new pID;
	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	if(sscanf(params,"u",pID)){
	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Pielietojums: /get [ID]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage (playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new string[128],string2[128],aname[MAX_PLAYER_NAME],name[MAX_PLAYER_NAME];
	GetPlayerName(pID,name,sizeof(name));
    GetPlayerName(playerid,aname,sizeof(aname));
	if (GetPlayerState(pID) == PLAYER_STATE_DRIVER)
    {
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu tiki teleportets pie %s.",name);
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	SetVehiclePos(pID,x,y,z);
    SendClientMessage(playerid,COLOR_WHITE,string);
    return 1;
    }
    else
    {
	format(string,sizeof(string),"Admins %s tevi atteleportçja pie sevim.",aname);
    format(string2,sizeof(string2),"Tu atteleporteji %s pie sevim.",name);
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	SetPlayerPos(pID,x,y,z);
    SendClientMessage(pID,COLOR_WHITE,string);
    SendClientMessage(playerid,COLOR_WHITE,string2);
	return 1;
	}
}

dcmd_time(playerid,params[])
{
	if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	new hour;
	if(sscanf(params,"d",hour)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /time [0-24]");
	}
	if(hour < 0){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Nepareizi ievadita stunda. [0-24]");
	}
	if(hour > 24){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Nepareizi ievadita stunda. [0-24]");
	}
	new string2[128],aname[MAX_PLAYER_NAME];
	SetWorldTime(hour);
	GetPlayerName(playerid,aname,sizeof(aname));
    format(string2,sizeof(string2),"Admins uzstadija servera laiku uz %d",hour);
    SendClientMessageToAll(COLOR_WHITE,string2);
	return 1;
}

dcmd_weather(playerid,params[])
{
	if(Player[playerid][Admin] < 2){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	new weather;
	if(sscanf(params,"d",weather)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /weather [0-50]");
	}
	if(weather < 0){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Nepareizi ievadits laikapstaklis. [0-50]");
	}
	if(weather > 50){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Nepareizi ievadits laikapstaklis. [0-50]");
	}
	SetWeather(weather);
	new string2[128],aname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,aname,sizeof(aname));
    format(string2,sizeof(string2),"Admins uzstadija servera laikapstaklus uz %d",weather);
    SendClientMessageToAll(COLOR_WHITE,string2);
	return 1;
}

dcmd_veh(playerid,params[])
	{
	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
	return 1;
	}
	if(Player[playerid][Admin] >= 3) {
	new aname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,aname,sizeof(aname));
 	new tmp[256], tmp2[256], tmp3[256], Index; tmp = strtok(params,Index), tmp2 = strtok(params,Index); tmp3 = strtok(params,Index);
 	if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_BRIGHTRED, "Pielietojums: /veh [Modelis] [Krasa 1] [Krasa 2]");
	new veh, colour1, colour2, string[128];
	if(!IsNumeric(tmp)) veh = GetVehicleModelIDFromName(tmp); else veh = strval(tmp);
	if(veh < 400 || veh > 611) return  SendClientMessage(playerid, COLOR_BRIGHTRED, "Nezinams maasinas modelis.");
	if(!strlen(tmp2)) colour1 = random(126); else colour1 = strval(tmp2);
	if(!strlen(tmp3)) colour2 = random(126); else colour2 = strval(tmp3);
	new LVehicleID,Float:X,Float:Y,Float:Z, Float:Angle,int1;	GetPlayerPos(playerid, X,Y,Z);	GetPlayerFacingAngle(playerid,Angle);   int1 = GetPlayerInterior(playerid);
	LVehicleID = CreateVehicle(veh, X+3,Y,Z, Angle, colour1, colour2, -1); LinkVehicleToInterior(LVehicleID,int1);
	format(string, sizeof(string), "Tu uzspawnoji \"%s\" (Modelis:%d) (Krasas:%d, %d).", VehicleNames[veh-400], veh, colour1, colour2);
	return SendClientMessage(playerid,COLOR_WHITE, string);
	}
	return 0;
}

dcmd_setcash(playerid,params[])
	{
	new pID;
	if(Player[playerid][Admin] < 3){
	SendClientMessage (playerid,COLOR_BRIGHTRED,"Tev nav autorizacijas lietot so komandu.");
 	return 1;
	}
	new cash;
	if(sscanf(params,"ud",pID,cash)){
	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Pielietojums: /setcash [ID] [Summa]");
	}
	if(!IsPlayerConnected(pID)){
 	return SendClientMessage(playerid,COLOR_BRIGHTRED,"Speletajs ar sadu ID neeksiste!");
	}
	new string[128],string2[128],aname[MAX_PLAYER_NAME],name[MAX_PLAYER_NAME];
	ResetPlayerMoney(pID);
    GivePlayerMoney(pID,cash);
	GetPlayerName(playerid,aname,sizeof(aname));
	GetPlayerName(pID,name,sizeof(name));
	format(string,sizeof(string),"Tu uzstadiji speletaja %s naudu uz $%d.",name,cash);
    format(string2,sizeof(string2),"Admins %s uzstadija tavu naudu uz $%d.",aname,cash);
    SendClientMessage(playerid,COLOR_GREEN,string);
    SendClientMessage(pID,COLOR_WHITE,string2);
	return 1;
}



public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new pname[MAX_PLAYERS], accFormat[128];
	GetPlayerName(playerid, pname, sizeof pname);
	format(accFormat, sizeof accFormat, "acc/%s.sav", pname);
	if (response) {
	    switch (dialogid) {
	        case DIALOG_LOGIN: // ID Login
	            {
	                if (!strlen(inputtext)) {
	                    ShowPlayerDialog(playerid, DIALOG_LOGIN, 1, "Registrs", "Ievadi savu paroli!", "Labi", "Atcelt");
	                    return 1;
	                }
	                if (strcmp(inputtext, dini_Get(accFormat, "Password")) == 0) {
	                    Player[playerid][Admin] = dini_Int(accFormat, "Admin");
	                    Player[playerid][Regged] = dini_Int(accFormat, "Regged");
	                    Player[playerid][Logged] = dini_Int(accFormat, "Logged");
	                    Player[playerid][Kills] = dini_Int(accFormat, "Kills");
	                    Player[playerid][Deaths] = dini_Int(accFormat, "Deaths");
	                    GivePlayerMoney(playerid, dini_Int(accFormat, "Money"));
	                    SetPlayerScore(playerid, dini_Int(accFormat, "Score"));
	                    Player[playerid][Muted] = dini_Int(accFormat, "Muted");
	                    Player[playerid][MuteWarnings] = dini_Int(accFormat, "MuteWarnings");
	                    Player[playerid][Logged] = 1;
	                    SendClientMessage(playerid, 0xFFFFFFFF, "Veiksmigi esi ielogojies!");
	                } else {
	                    ShowPlayerDialog(playerid, DIALOG_LOGIN, 1, "Registrs", "Parole nepareiza, megini velreiz!", "Labi", "Atcelt");
	                }
	            }
	        case DIALOG_REG:
	            {
	                if (!strlen(inputtext)) {
	                    ShowPlayerDialog(playerid, DIALOG_REG, 1, "Registrs", "Parole ir parak isa!", "Labi", "Atcelt");
	                    return 1;
	                }
	                dini_Create(accFormat);
	                dini_Set(accFormat, "Password", inputtext);
	                Player[playerid][Admin] = dini_Int(accFormat, "Admin");
	                Player[playerid][Regged] = dini_Int(accFormat, "Regged");
	                Player[playerid][Logged] = dini_Int(accFormat, "Logged");
	                Player[playerid][Kills] = dini_Int(accFormat, "Kills");
	                Player[playerid][Deaths] = dini_Int(accFormat, "Deaths");
	                GivePlayerMoney(playerid, dini_Int(accFormat, "Money"));
	                SetPlayerScore(playerid, dini_Int(accFormat, "Score"));
	                Player[playerid][Muted] = dini_Int(accFormat, "Muted");
	                Player[playerid][MuteWarnings] = dini_Int(accFormat, "MuteWarnings");
	                Player[playerid][Regged] = 1;
	                ShowPlayerDialog(playerid, DIALOG_LOGIN, 1, "Registrs", "Registracija pabeigta, atliek vien ielogoties!", "Labi", "Atcelt");
	            }
	    }
	} else {
	    switch (dialogid) {
	        case DIALOG_LOGIN:
	            ShowPlayerDialog(playerid, DIALOG_LOGIN, 1, "Registrs", "Ludzu ielogojies!", "Labi", "Atcelt");
	        case DIALOG_REG:
	            ShowPlayerDialog(playerid, DIALOG_REG, 1, "Registrs", "Ludzu registrejies, lai saglabatu datus!", "Labi", "Atcelt");
	    }
	    if (!response) {
	        switch (dialogid) {
	            case DIALOG_LOGIN:
	                {
	                    Kick(playerid);
	                }
	        }
	    }
	    if (!response) {
	        switch (dialogid) {
	            case DIALOG_REG:
	                {
	                    Kick(playerid);
	                }
	        }
	    }
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

forward JailTime(playerid);
public JailTime(playerid)
{
	if (JTime[playerid] == 0) {
	    TeamKill[playerid] = 0;
	    JTime[playerid] = 0;
	    SpawnPlayer(playerid);
	    KillTimer(JTTimer[playerid]);
	    TextDrawHideForPlayer(playerid, JailTextDraw[playerid]);
	    return 1;
	}
	JTTimer[playerid] = SetTimer("JailTime", 1000, 0);
	new string[50];
	TextDrawShowForPlayer(playerid, JailTextDraw[playerid]);
	format(string, sizeof string, "~r~%i", JTime[playerid] - 1);
	TextDrawSetString(JailTextDraw[playerid], string);
	JTime[playerid]--;
	return 1;
}

forward MutedTime(playerid);
public MutedTime(playerid)
{
	if (MTime[playerid] == 0)
	{
	Player[playerid][Muted] = 0;
 	MTime[playerid] = 0;
	KillTimer(MTTimer[playerid]);
	TextDrawHideForPlayer(playerid, MuteTextDraw[playerid]);
	return 1;
	}
	MTTimer[playerid] = SetTimer("MutedTime", 1000, 0);
	new stringM[50];
	Player[playerid][Muted] = 1;
	TextDrawShowForPlayer(playerid, MuteTextDraw[playerid]);
	format(stringM, sizeof stringM, "~r~%i", MTime[playerid]-1);
	TextDrawSetString(MuteTextDraw[playerid], stringM);
	MTime[playerid]--;
	return 1;
}

stock SendAdminMessage(farbe,msg[])
{
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(Player[i][Admin] >= 1)
{
SendClientMessage(i,farbe,msg);
}
}
}

// Prieksh /veh komandas
GetVehicleModelIDFromName(vname[])
{
	for(new i = 0; i < 211; i++)
	{
		if ( strfind(VehicleNames[i], vname, true) != -1 )
			return i + 400;
	}
	return -1;
}

// Prieksh /veh komandas
stock IsNumeric(string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

// Prieksh registraacijas
stock strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}


stock PlayerName2(playerid) {
  new name[MAX_PLAYER_NAME];
  GetPlayerName(playerid, name, sizeof(name));
  return name;
}

stock sscanf(string[], format[], {Float,_}:...)
{
	#if defined isnull
		if (isnull(string))
	#else
		if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (string[stringPos] && string[stringPos] <= ' ')
	{
		stringPos++;
	}
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					num = 0,
					ch = string[stringPos];
				do
				{
					stringPos++;
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{

				new changestr[16], changepos = 0, strpos = stringPos;
				while(changepos < 16 && string[strpos] && string[strpos] != delim)
				{
					changestr[changepos++] = string[strpos++];
    				}
				changestr[changepos] = '\0';
				setarg(paramPos,0,_:floatstr(changestr));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringPos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringPos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = string[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					string[end] = '\0';
					num = false;
					new
						name[MAX_PLAYER_NAME];
					id = end - stringPos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, string[stringPos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					string[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringPos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
		{
			stringPos++;
		}
		while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
		{
			stringPos++;
		}
		paramPos++;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}
