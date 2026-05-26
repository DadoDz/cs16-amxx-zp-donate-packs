#include <amxmodx>
#include <amxmisc>
#include <zombie_plague/add_commas>
//#include <zombie_plague/zp_packs_system>

#define PLUGIN "[ZP] Donate Packs"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

native zp_get_user_packs(index);
native zp_set_user_packs(index, packs);

new g_playername[33][32];

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    register_clcmd("say", "client_say")
}

public client_putinserver(id) get_user_name(id, g_playername[id], charsmax(g_playername[]));

public client_say(sender)
{
	static szMsg[150];
	read_args(szMsg, sizeof(szMsg));
	remove_quotes(szMsg);

	new szCommand1[32], szCommand2[32];
	argbreak(szMsg, szCommand1, charsmax(szCommand1), szCommand2, charsmax(szCommand2));

	if (equal(szCommand1, "/donate", 7))
	{
		new szReceiver[32], szAmount[32], packs, receiver;
		argbreak(szCommand2, szReceiver, charsmax(szReceiver), szAmount, charsmax(szAmount));

		if (!szReceiver[0] || !szAmount[0])
		{
			client_print_color(sender, print_team_default, "^x04[^x01ZP^x04]^x01 Usage^x03:^x04 /donate^x03 <^x01name^x03> <^x01packs^x03>");
			return PLUGIN_HANDLED;
		}

		receiver = cmd_target(sender, szReceiver);
		if (!is_user_connected(receiver) || receiver == sender)
			return PLUGIN_HANDLED;

		packs = str_to_num(szAmount);
		if (packs <= 0)
		{
			client_print_color(sender, print_team_default, "^x04[^x01ZP^x04]^x01 Invalid value of^x03 packs^x01 to send!");
			return PLUGIN_HANDLED;
		}

		if (zp_get_user_packs(sender) < packs)
		{
			client_print_color(sender, print_team_default, "^x04[^x01ZP^x04]^x01 You are trying to send too many^x03 packs^x01!");
			return PLUGIN_HANDLED;
		}

		zp_set_user_packs(sender, zp_get_user_packs(sender) - packs);
		zp_set_user_packs(receiver, zp_get_user_packs(receiver) + packs);

		client_print_color(0, print_team_default, "^x04[^x01ZP^x04]^x03 %s^x01 donated^x04 %d packs^x01 to^x03 %s", g_playername[sender], packs, g_playername[receiver]);
		return PLUGIN_HANDLED;
	}

	return PLUGIN_CONTINUE;
}
