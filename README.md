# Chest Analyzer

Visualize and auto-open chests with rarity indicators in FiveM.

## Features

- Visualize chests with rarity indicators (Common, Gold, Diamond, Void)
- Auto-open chests within a certain distance

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources directory.
3. Import the `database.sql` file into your MySQL database.
4. Add `start chestanalyzersystem` to your server.cfg file.

## Usage

### Commands

| Command          | Description                     |
|------------------|---------------------------------|
| `/toggleautoopen` | Toggle auto-open functionality |

### Permissions

No specific permissions are required to use this script.

## Configuration

The script can be configured in the `config.lua` file. You can adjust the ESP settings, auto-open settings, and chest types.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=chest-analyzer&utm_content=bottom) — describe it in one sentence and get the full source code.
