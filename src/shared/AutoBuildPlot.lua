-- INSTRUCTIONS: Copy and paste this ENTIRE script into the Roblox Studio Command Bar
-- (View Tab -> Command Bar) and press Enter to generate your tycoon plot automatically.

local TycoonSettings = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("TycoonSettings"))

local function createTycoonPlot()
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

	-- 5. Generate Items
	local function createPlaceholder(name, isDropper)
		local model = Instance.new("Model")
		model.Name = name
		model.Parent = tycoon

		local part = Instance.new("Part")
		part.Name = "MainPart"
		part.Size = Vector3.new(5, 5, 5)
		part.Position = Vector3.new(math.random(-40, 40), 5, math.random(-40, 40))
		part.Anchored = true
		part.Transparency = 1 -- Hidden by default
		part.CanCollide = false
		part.Parent = model

		if isDropper then
			local dropPoint = Instance.new("Part")
			dropPoint.Name = "DropPoint"
			dropPoint.Size = Vector3.new(1, 1, 1)
			dropPoint.Position = part.Position + Vector3.new(0, 5, 0)
			dropPoint.Anchored = true
			dropPoint.Transparency = 1
			dropPoint.Parent = model
		end

		return model
	end

	for name, _ in pairs(TycoonSettings.Droppers) do
		createPlaceholder(name, true)
	end

	for name, _ in pairs(TycoonSettings.Upgrades) do
		createPlaceholder(name, false)
	end

	print("✅ Invincible Tycoon Plot 'Tycoon1' has been generated successfully!")
end

createTycoonPlot()
