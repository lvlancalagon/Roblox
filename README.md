# Invincible Tycoon - Setup Instructions

This repository contains the code for a Roblox Tycoon based on the "Invincible" series. To make the game functional in Roblox Studio, you must set up the physical models as described below.

## 1. Tycoon Plot Setup
Create a `Model` in `Workspace` and name it `Tycoon1` (or anything containing "Tycoon").

### Required Children of the Tycoon Model:
- **ClaimPad**: A `Part` that players touch to claim the tycoon.
- **Collector**: A `Part` where "Ores" (dropped parts) will land to award cash.
- **Ores**: A `Folder` where dropped ores will be parented.
- **Mark's Dumbbell**: A `Model` for the first dropper. Must contain:
    - **DropPoint**: A `Part` (can be invisible) where the ores will spawn.
- **Viltrumite Ore**: A `Model` for the second dropper. Must contain:
    - **DropPoint**: A `Part`.
- **GDA Tech**: A `Model` for the third dropper. Must contain:
    - **DropPoint**: A `Part`.
- **Atom Eve's Energy**: A `Model` for the fourth dropper. Must contain:
    - **DropPoint**: A `Part`.

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
