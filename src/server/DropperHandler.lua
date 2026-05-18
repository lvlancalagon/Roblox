local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))

local DropperHandler = {}
local activeLoops = {} -- tycoonModel -> {itemName -> boolean}

function DropperHandler.StartDropper(tycoon, dropperName)
	local dropperConfig = TycoonSettings.Droppers[dropperName]
	if not dropperConfig then return end

	-- Check if already running for this tycoon to prevent duplicates
	if not activeLoops[tycoon] then activeLoops[tycoon] = {} end
	if activeLoops[tycoon][dropperName] then return end
	activeLoops[tycoon][dropperName] = true

	local dropperModel = tycoon:FindFirstChild(dropperName)
	if not dropperModel then return end

	local dropPoint = dropperModel:FindFirstChild("DropPoint")
	if not dropPoint then return end

	task.spawn(function()
		while activeLoops[tycoon] and activeLoops[tycoon][dropperName] do
			task.wait(TycoonSettings.BaseSettings.DropperInterval)

			if not (activeLoops[tycoon] and activeLoops[tycoon][dropperName]) then break end

			local part = Instance.new("Part")
			part.Name = "Ore"
			part.Size = Vector3.new(1, 1, 1)
			part.Position = dropPoint.Position
			part.Parent = tycoon:FindFirstChild("Ores") or tycoon

			local valueAttr = Instance.new("IntValue")
			valueAttr.Name = "PayoutValue"
			valueAttr.Value = dropperConfig.Payout
			valueAttr.Parent = part

			game:GetService("Debris"):AddItem(part, 10)
		end
	end)
end

function DropperHandler.StopAll(tycoon)
	activeLoops[tycoon] = nil
end

return DropperHandler
