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
   - A new **Addons** folder in `ReplicatedStorage` for your custom uploads.

## 2. Using the Addons Folder
When you want to add new content (like models or scripts) that you've uploaded to Roblox:
- Place them inside `ReplicatedStorage.Addons`.
- Label them clearly so you can find them later.

## 3. Animated Images (Image Switcher)
You can now create parts that alternate between two images every 1.5 seconds, just like in the series' title card or news broadcasts.

### How to set up an Animated Image:
1. Select any **Part** in your tycoon.
2. Open the **Tags** editor (View -> Tag Editor) and add the tag `AnimatedImage` to the part.
3. In the **Attributes** section of the part (bottom of the Properties window), add two new attributes:
   - `Image1` (Type: String): The first Asset ID (e.g., `rbxassetid://12345678`).
   - `Image2` (Type: String): The second Asset ID (e.g., `rbxassetid://87654321`).
4. The part will now automatically swap between these two images while the game is running!

## 4. Rojo Integration (Advanced)
The `default.project.json` is configured to map:
- `src/shared` -> `ReplicatedStorage.Shared`
- `src/server` -> `ServerScriptService.Server`
- `src/client` -> `StarterPlayer.StarterPlayerScripts.Client`
- `ReplicatedStorage.Addons` -> (New folder for your custom assets)

## 5. Game Mechanics
- Players claim a tycoon by touching the **ClaimPad**.
- Once claimed, the first dropper starts spawning ores automatically.
- Ores touching the **Collector** award cash.
- Use the UI shop (bottom right) to purchase more droppers and upgrades.
