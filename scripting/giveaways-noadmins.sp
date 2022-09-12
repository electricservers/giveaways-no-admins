#include <sourcemod>
#include <sdktools>
#include <giveaways>

#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = {
	name = "Giveaways No Admins",
	author = "ampere",
	description = "Prevents admins from joining giveaways",
	version = PLUGIN_VERSION,
	url = "Your website URL/AlliedModders profile URL"
};

public void OnPluginStart() {
	LoadTranslations("giveaways-noadmins.phrases");
}

public Action Giveaways_OnClientEnter(int client) {
	if (GetAdminFlag(GetUserAdmin(client), Admin_Generic)) {
		PrintToChat(client, "%t", "Rejected");
		return Plugin_Stop;
	}
	return Plugin_Continue;
}