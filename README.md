# Invincible Tycoon - Setup Instructions

This repository contains the code for a Roblox Tycoon based on the "Invincible" series.

**New to Roblox?** Read the [BEGINNER_GUIDE.md](BEGINNER_GUIDE.md) first!

## 1. Automated Installation
The easiest way to set up is using the **One-Click Installer**:
1. Open your Roblox Studio project.
2. Copy the content of `ONE_CLICK_INSTALLER.lua`.
3. Paste it into the **Command Bar** (View -> Command Bar) and press Enter.
4. This will create:
   - Your Tycoon Plot (`Tycoon1`).
   - All necessary folders (Server, Client, Shared).

## 2. Rojo Integration
Use [Rojo](https://rojo.space/) to sync this repository with your Roblox Studio place. The `default.project.json` is already configured to map:
- `src/shared` -> `ReplicatedStorage.Shared`
- `src/server` -> `ServerScriptService.Server`
- `src/client` -> `StarterPlayer.StarterPlayerScripts.Client`
- `RemoteEvents` -> `ReplicatedStorage.Events`

## 3. Game Mechanics
- Players claim a tycoon by touching the **ClaimPad**.
- Once claimed, the first dropper starts spawning ores automatically.
- Ores touching the **Collector** award cash.
- Use the UI shop (bottom right) to purchase more droppers and upgrades.
