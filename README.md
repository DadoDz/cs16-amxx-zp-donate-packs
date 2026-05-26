# [ZP] Donate Packs

A simple donation system plugin for **Zombie Plague** servers, designed for **Counter-Strike 1.6**.
The plugin allows players to donate Ammo Packs to other players using a chat command ```(/donate <name> <packs>)```, with full validation and a global chat announcement when a transfer is successful.

## Plugin Information

  - **Name**: [ZP] Donate Packs
  - **Version**: 1.0
  - **Author**: DadoDz
  - **Game**: Counter-Strike 1.6
  - **Mod**: Zombie Plague

## Requirements

- AMX Mod X **1.9+**
- Zombie Plague Mod

## Installation
1. Place ```add_commas.inc``` in: **addons/amxmodx/scripting/include/zombie_plague**
1. Place ```zp_donate_packs.sma``` in: **addons/amxmodx/scripting/**
2. Compile it with your AMXX compiler.
3. Place the compiled .amxx file in: **addons/amxmodx/plugins/**
4. Add this line to your plugins.ini: ```zp_donate_packs.amxx```
5. Restart your server.

## Required Natives
This plugin uses custom natives to get and set ammo packs, you must change these natives based on your zombie plague version.
- ```native zp_get_user_packs(index)```
- ```native zp_set_user_packs(index, packs)```

## Commands
| Command                       | Description        |
|-------------------------------|--------------------|
| `/donate` `<name>` `<amount>` | donate ammo paccks |

## Notice
> Donate ammo packs plugins already exist, this one was originally created for my own server.
