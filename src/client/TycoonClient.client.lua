local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local events = ReplicatedStorage:WaitForChild("Events")
local purchaseRequest = events:WaitForChild("PurchaseRequest")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))

local buttons = {}

-- Logic for interacting with tycoon buttons
local function onButtonClicked(itemName)
	if itemName then
		purchaseRequest:FireServer(itemName)
	end
end

-- Create UI
local function createUI()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "TycoonGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui

	-- Cash Label
	local cashLabel = Instance.new("TextLabel")
	cashLabel.Name = "CashLabel"
	cashLabel.Size = UDim2.new(0, 200, 0, 50)
	cashLabel.Position = UDim2.new(0, 10, 0, 10)
	cashLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	cashLabel.Text = "Cash: $0"
	cashLabel.Parent = screenGui

	-- Update cash label
	local leaderstats = player:WaitForChild("leaderstats")
	local cash = leaderstats:WaitForChild("Cash")
	cash.Changed:Connect(function(newValue)
		cashLabel.Text = "Cash: $" .. newValue
	end)

	-- Shop Frame
	local shopFrame = Instance.new("ScrollingFrame")
	shopFrame.Name = "ShopFrame"
	shopFrame.Size = UDim2.new(0, 300, 0, 400)
	shopFrame.Position = UDim2.new(1, -310, 0, 10)
	shopFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
	shopFrame.Parent = screenGui

	local layout = Instance.new("UIListLayout")
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = shopFrame

	local function addButton(name, data, order)
		local btn = Instance.new("TextButton")
		btn.Name = name
		btn.Size = UDim2.new(1, 0, 0, 50)
		btn.Text = name .. " ($" .. data.Cost .. ")"
		btn.LayoutOrder = order
		btn.Parent = shopFrame
		btn.MouseButton1Click:Connect(function()
			onButtonClicked(name)
		end)
		buttons[name] = btn
	end

	local index = 0
	for name, data in pairs(TycoonSettings.Droppers) do
		index = index + 1
		addButton(name, data, index)
	end

	for name, data in pairs(TycoonSettings.Upgrades) do
		index = index + 1
		addButton(name, data, index)
	end
end

-- Initialize
task.spawn(createUI)
