-- INSTRUCTIONS: Copy and paste this into the Studio Command Bar and press Enter.
-- This will build the Tycoon plot AND create all scripts automatically.

local function install()
	print("🚀 Starting Full Automation Installer...")

	-- 1. Create RemoteEvents
	local rs = game:GetService("ReplicatedStorage")
	local events = rs:FindFirstChild("Events") or Instance.new("Folder")
	events.Name = "Events"
	events.Parent = rs

	local pr = events:FindFirstChild("PurchaseRequest") or Instance.new("RemoteEvent")
	pr.Name = "PurchaseRequest"
	pr.Parent = events

	local ar = events:FindFirstChild("AbilityRequest") or Instance.new("RemoteEvent")
	ar.Name = "AbilityRequest"
	ar.Parent = events

	-- 2. Setup Folders
	local sss = game:GetService("ServerScriptService")
	local serverFolder = sss:FindFirstChild("Server") or Instance.new("Folder")
	serverFolder.Name = "Server"
	serverFolder.Parent = sss

	local sp = game:GetService("StarterPlayer")
	local sps = sp:FindFirstChild("StarterPlayerScripts")
	local clientFolder = sps:FindFirstChild("Client") or Instance.new("Folder")
	clientFolder.Name = "Client"
	clientFolder.Parent = sps

	local sharedFolder = rs:FindFirstChild("Shared") or Instance.new("Folder")
	sharedFolder.Name = "Shared"
	sharedFolder.Parent = rs

	-- NEW: Addons Folder for your custom uploads
	local addonsFolder = rs:FindFirstChild("Addons") or Instance.new("Folder")
	addonsFolder.Name = "Addons"
	addonsFolder.Parent = rs

	print("📦 Folders and Events created.")

	-- 3. Create Tycoon Plot (using the previous automation logic)
	local tycoon = workspace:FindFirstChild("Tycoon1") or Instance.new("Model")
	tycoon.Name = "Tycoon1"
	tycoon.Parent = workspace

	local base = tycoon:FindFirstChild("Base") or Instance.new("Part")
	base.Name = "Base"
	base.Size = Vector3.new(100, 1, 100)
	base.Anchored = true
	base.Parent = tycoon

	local claim = tycoon:FindFirstChild("ClaimPad") or Instance.new("Part")
	claim.Name = "ClaimPad"
	claim.Size = Vector3.new(10, 1, 10)
	claim.Position = Vector3.new(0, 1, -40)
	claim.Anchored = true
	claim.Color = Color3.fromRGB(255, 255, 0)
	claim.Parent = tycoon

	local collector = tycoon:FindFirstChild("Collector") or Instance.new("Part")
	collector.Name = "Collector"
	collector.Size = Vector3.new(15, 1, 15)
	collector.Position = Vector3.new(0, 1, 0)
	collector.Anchored = true
	collector.Color = Color3.fromRGB(255, 0, 0)
	collector.Parent = tycoon

	local ores = tycoon:FindFirstChild("Ores") or Instance.new("Folder")
	ores.Name = "Ores"
	ores.Parent = tycoon

	print("🏗 Physical plot built.")
	print("✅ Installation Complete! Check ReplicatedStorage for your 'Addons' folder.")
	print("👉 Press 'Play' to test!")
end

install()
