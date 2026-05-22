-- INSTRUCTIONS: Copy and paste this ENTIRE script into the Roblox Studio Command Bar
-- (View Tab -> Command Bar) and press Enter on your keyboard.
-- DO NOT click the "Run" button in the top menu; use the Command Bar at the bottom.

local function createTycoonPlot()
	print("🚀 Starting Invincible Tycoon Auto-Build...")

	local tycoon = Instance.new("Model")
	tycoon.Name = "Tycoon1"
	tycoon.Parent = workspace

	-- 1. Baseplate
	local base = Instance.new("Part")
	base.Name = "Base"
	base.Size = Vector3.new(100, 1, 100)
	base.Position = Vector3.new(0, 0, 0)
	base.Anchored = true
	base.Color = Color3.fromRGB(50, 50, 50)
	base.Parent = tycoon

	-- 2. ClaimPad
	local claim = Instance.new("Part")
	claim.Name = "ClaimPad"
	claim.Size = Vector3.new(10, 1, 10)
	claim.Position = Vector3.new(0, 1, -40)
	claim.Anchored = true
	claim.Color = Color3.fromRGB(255, 255, 0)
	claim.Parent = tycoon

	-- 3. Collector
	local collector = Instance.new("Part")
	collector.Name = "Collector"
	collector.Size = Vector3.new(15, 1, 15)
	collector.Position = Vector3.new(0, 1, 0)
	collector.Anchored = true
	collector.Color = Color3.fromRGB(255, 0, 0)
	collector.Parent = tycoon

	-- 4. Ores Folder
	local ores = Instance.new("Folder")
	ores.Name = "Ores"
	ores.Parent = tycoon

	-- 5. NEW: Animated Screen Demonstration
	local screen = Instance.new("Part")
	screen.Name = "AnimatedScreen"
	screen.Size = Vector3.new(12, 8, 1)
	screen.Position = Vector3.new(0, 10, 45)
	screen.Anchored = true
	screen.Color = Color3.fromRGB(0, 0, 0)
	screen.Parent = tycoon

	-- Add Tags and Attributes for the ImageSwitcher
	local cs = game:GetService("CollectionService")
	cs:AddTag(screen, "AnimatedImage")
	screen:SetAttribute("Image1", "rbxassetid://12345678") -- Placeholder
	screen:SetAttribute("Image2", "rbxassetid://87654321") -- Placeholder

	print("📺 Created Animated Screen demonstration.")

	-- 6. Metadata
	local metadata = {
		Droppers = {
			["Mark's Dumbbell"] = {Color = Color3.fromRGB(150, 150, 150), Material = Enum.Material.Metal, Floor = 1},
			["Viltrumite Ore"] = {Color = Color3.fromRGB(180, 0, 0), Material = Enum.Material.Granite, Floor = 1},
			["Flaxan Tech Dropper"] = {Color = Color3.fromRGB(0, 255, 100), Material = Enum.Material.Neon, Floor = 2},
			["Mars Rock Dropper"] = {Color = Color3.fromRGB(255, 100, 0), Material = Enum.Material.Slate, Floor = 2},
			["GDA Satellite Feed"] = {Color = Color3.fromRGB(0, 100, 255), Material = Enum.Material.Metal, Floor = 3},
			["Atom Eve's Energy"] = {Color = Color3.fromRGB(255, 100, 200), Material = Enum.Material.Neon, Floor = 3}
		},
		Upgrades = {
			["Grayson Residence"] = {Color = Color3.fromRGB(240, 220, 180), Material = Enum.Material.Wood, Floor = 1},
			["GDA Underground Lab"] = {Color = Color3.fromRGB(100, 100, 110), Material = Enum.Material.Concrete, Floor = 1},
			["Second Floor"] = {Color = Color3.fromRGB(200, 200, 200), Material = Enum.Material.SmoothPlastic, Floor = 1},
			["GDA Medical Wing"] = {Color = Color3.fromRGB(255, 255, 255), Material = Enum.Material.Glass, Floor = 2},
			["Omni-Man's Trophy Room"] = {Color = Color3.fromRGB(200, 180, 100), Material = Enum.Material.Marble, Floor = 2},
			["Third Floor"] = {Color = Color3.fromRGB(220, 220, 220), Material = Enum.Material.SmoothPlastic, Floor = 2},
			["Invincible's Penthouse"] = {Color = Color3.fromRGB(100, 200, 255), Material = Enum.Material.Glass, Floor = 3},
			["Auto-Collector"] = {Color = Color3.fromRGB(50, 50, 50), Material = Enum.Material.Metal, Floor = 3},
			["Auto-Buyer"] = {Color = Color3.fromRGB(0, 255, 255), Material = Enum.Material.Neon, Floor = 3},
			["GDA Command Center"] = {Color = Color3.fromRGB(20, 20, 30), Material = Enum.Material.Neon, Floor = 3}
		}
	}

	local function createPlaceholder(name, config, isDropper)
		local model = Instance.new("Model")
		model.Name = name
		model.Parent = tycoon

		local floorOffset = (config.Floor - 1) * 20
		local part = Instance.new("Part")
		part.Name = "MainPart"
		part.Size = Vector3.new(10, 8, 10)
		part.Position = Vector3.new(math.random(-40, 40), 5 + floorOffset, math.random(-40, 40))
		part.Anchored = true
		part.Color = config.Color
		part.Material = config.Material
		part.Transparency = 0.5
		part.CanCollide = false
		part.Parent = model

		-- Add a simple label
		local billboard = Instance.new("BillboardGui")
		billboard.Size = UDim2.new(0, 100, 0, 50)
		billboard.Adornee = part
		billboard.AlwaysOnTop = true
		billboard.Parent = part

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Text = name
		label.TextColor3 = Color3.new(1, 1, 1)
		label.TextStrokeTransparency = 0
		label.Parent = billboard

		if isDropper then
			local dropPoint = Instance.new("Part")
			dropPoint.Name = "DropPoint"
			dropPoint.Size = Vector3.new(1, 1, 1)
			dropPoint.Position = part.Position + Vector3.new(0, 4, 0)
			dropPoint.Anchored = true
			dropPoint.Transparency = 1
			dropPoint.Parent = model
		end

		print("  ✔ Created " .. (isDropper and "Dropper" or "Upgrade") .. ": " .. name .. " (Floor " .. config.Floor .. ")")
		return model
	end

	for name, config in pairs(metadata.Droppers) do
		createPlaceholder(name, config, true)
	end

	for name, config in pairs(metadata.Upgrades) do
		createPlaceholder(name, config, false)
	end

	print("✅ DONE! Your Invincible Tycoon 'Tycoon1' is ready in Workspace.")
	print("👉 Next step: Sync your code using Rojo as described in the guide.")
end

createTycoonPlot()
