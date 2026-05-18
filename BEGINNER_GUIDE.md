# Beginner's Guide to Building your Invincible Tycoon

Since you've never built a Roblox game before, this guide will walk you through creating the "models" (the physical objects) that work with the code I've written.

## Step 1: Install Roblox Studio
1. Go to [roblox.com/create](https://www.roblox.com/create).
2. Click "Start Creating" to download and install Roblox Studio.
3. Open a new "Baseplate" project.

## Step 2: FAST TRACK (Automation)
If you want me to set up the basics for you automatically:
1. In Roblox Studio, go to the **View** tab at the top and click **Command Bar** (it will open a small text box at the bottom).
2. Open the file `src/shared/AutoBuildPlot.lua` in this folder.
3. **Copy** all the code from that file and **Paste** it into the Command Bar in Studio.
4. Press **Enter**.
5. **BOOM!** Your entire tycoon structure is created for you instantly.

## Step 3: Manual Setup (If you want to build yourself)
In Roblox, everything you see is a "Part."
1. **Create the Plot**: Click the "Part" button at the top to spawn a block. Use the "Scale" tool to make it large (this is your floor).
2. **Name it**: In the **Explorer** window (usually on the right), right-click the part and select **Group as Model**. Rename this model to `Tycoon1`.

## Step 4: Create the Essential Parts
Inside your `Tycoon1` model, you need a few specific parts. To make them, spawn a Part, move it into the `Tycoon1` model, and rename it exactly as shown:

- **ClaimPad**: A part on the ground. When you touch it, you own the tycoon.
- **Collector**: A part (like a bin or a pad). This is where the ores will fall to give you money.
- **Ores**: Right-click `Tycoon1` -> Insert Object -> **Folder**. Rename it to `Ores`. This is where the money blocks will appear.

## Step 5: Create your first Dropper ("Mark's Dumbbell")
1. Create a new **Model** inside `Tycoon1` and rename it to `Mark's Dumbbell`.
2. Inside this model, create a Part and name it **DropPoint**.
3. Move the **DropPoint** in the air above your **Collector**.
   - *Tip: Set the DropPoint's Transparency to 1 in the Properties window so it's invisible!*
4. Create another part for the "look" of the dumbbell and put it in the same model.

## Step 6: How to "Create Models" without building
If you don't want to build from scratch:
1. Open the **Toolbox** (View tab -> Toolbox).
2. Search for "Dumbbell" or "Lab."
3. Drag an item into your game.
4. **Important**: Drag that item into your `Tycoon1` model and rename it to match one of the items in `TycoonSettings.lua` (like `GDA Underground Lab`).
5. Ensure it has a part named `DropPoint` inside it if it's a dropper!

## Step 7: Syncing the Code
1. Install the **Rojo** plugin in Roblox Studio from the [Roblox Marketplace](https://www.roblox.com/library/2912443315/Rojo-6).
2. In your code editor (where you have this repository), run `rojo serve`.
3. In Roblox Studio, click the Rojo icon and click **Connect**.
4. Your code will now appear in `ServerScriptService` and `StarterPlayerScripts` automatically!

## Summary of Item Names to Use:
To make the code work, your models must be named exactly:
- `Mark's Dumbbell`
- `Viltrumite Ore`
- `Flaxan Tech Dropper`
- `Mars Rock Dropper`
- `GDA Satellite Feed`
- `Atom Eve's Energy`
- `Grayson Residence`
- `GDA Underground Lab`
- `Second Floor` (Note: This can just be a big part that appears)
- `GDA Medical Wing`
- `Omni-Man's Trophy Room`
- `Third Floor`
- `Invincible's Penthouse`
- `GDA Command Center`

Don't worry about making them look perfect yet—just getting the names right will make the game "work"!
