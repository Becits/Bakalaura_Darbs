#include <a_samp>

// KRAASU DEFINEESAHANA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_RED 0xFF0000AA
#define COLOR_LIGHTGREEN 0x33FF33AA
#define COL_WHITE "{FFFFFF}"
#define COL_GREEN "{33AA33}"

// MAINIIGIE
new answer;
new answered;
new isenable;
new number[4];

public OnFilterScriptInit()
{
	SetTimer("Matematika",100000, true);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
        new cmd[256], idx;
        cmd = strtok(cmdtext, idx);

        if (strcmp("/math", cmd, true) == 0) {
		    new tmp[256], cmdid, string[256], pname[MAX_PLAYER_NAME];
		    tmp = strtok(cmdtext, idx);
		    if (!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "PIELIETOJUMS: /math [atbilde]");
		    cmdid = strval(tmp);
		    // Ja ievadiita nepareiza atbilde
		    if (cmdid < answer || cmdid > answer) {
		        if(answered == 1) {
		        	SendClientMessage(playerid, COLOR_RED, "Par veelu, konkurss jau beidzaas!");
		    	} else {
	-		        SendClientMessage(playerid, COLOR_RED, "Nepareiza atbilde!");
	            }
		    }
		    // Ja atbilde ir pareiza
		    if (cmdid == answer && answered == 0) {
		        GetPlayerName(playerid, pname, sizeof(pname));
		        format(string, sizeof(string), "%s pirmais atbildeeja pareizi uz konkursa jautaajumu un laimeeja $1337! Pareizaa atbilde %d!", pname, cmdid);
		        SendClientMessageToAll(COLOR_LIGHTGREEN, string);
		        GivePlayerMoney(playerid, 1337);
		        answered = 1;
		        return 1;
		    }
		    // Ja kaads cits speeleetaajs jau paspeeja pareizi atbildeet
		    else if (cmdid == answer && answered == 1) {
		        SendClientMessage(playerid, COLOR_RED, "Par veelu, konkurss jau beidzaas!");
		    }
		    return 1;
		}
        return 0;
}

forward Matematika();
public Matematika()
{
	new string[128];
	if(!isenable)
	{
		switch(random(4))
		{
			case 0:
			{
				answer = (number[0]=random(1000)) + (number[1]=random(840));
				format(string, sizeof(string), "KONKURSS: " COL_GREEN "%d" COL_WHITE " + " COL_GREEN "%d" COL_WHITE " = " COL_GREEN "?" COL_WHITE " Lieto /math, lai atbildeetu uz konkursa jautaajumu!", number[0], number[1]);
        		//SendClientMessageToAll(COLOR_YELLOW, string);
			}
			case 1:
			{
				do
				{
					answer = (number[0]=random(500)) - (number[1]=random(500));
				}
				while(number[0] < number[1]);
				format(string, sizeof(string), "KONKURSS: " COL_GREEN "%d" COL_WHITE " - " COL_GREEN "%d" COL_WHITE " = " COL_GREEN "?" COL_WHITE " Lieto /math, lai atbildeetu uz konkursa jautaajumu!", number[0], number[1]);
        		//SendClientMessageToAll(COLOR_YELLOW, string);
			}
			case 2:
			{
				answer = (number[0]=random(100)) * (number[1]=random(80));
				format(string, sizeof(string), "KONKURSS: " COL_GREEN "%d" COL_WHITE " * " COL_GREEN "%d" COL_WHITE " = " COL_GREEN "?" COL_WHITE " Lieto /math, lai atbildeetu uz konkursa jautaajumu!", number[0], number[1]);
        		//SendClientMessageToAll(COLOR_YELLOW, string);
			}
			case 3:
			{
				do
				{
					answer = (number[0]=random(1000)+1) / (number[1]=random(600)+1);
				}
				while(number[0] % number[1]);
				format(string, sizeof(string), "KONKURSS: " COL_GREEN "%d" COL_WHITE " / " COL_GREEN "%d" COL_WHITE " = " COL_GREEN "?" COL_WHITE " Lieto /math, lai atbildeetu uz konkursa jautaajumu!", number[0], number[1]);
        		//SendClientMessageToAll(COLOR_YELLOW, string);
			}
		}
    	SendClientMessageToAll(COLOR_YELLOW, string);
		isenable = true;
    }
    else
	{
		isenable = false;
	}
 	answered = 0;
	return 1;
}

strtok(const string[], &index)
{
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
