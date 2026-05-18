local Collector = require(script.Parent:WaitForChild("Collector"))
local DropperHandler = require(script.Parent:WaitForChild("DropperHandler"))

local TycoonManager = {}
local tycoons = {} -- tycoonModel -> player
local playerToTycoon = {} -- player -> tycoonModel
local tycoonState = {} -- tycoonModel -> {ownedItems = {itemName = boolean}}

function TycoonManager.ClaimTycoon(player, tycoonModel)
	if tycoons[tycoonModel] or playerToTycoon[player] then return false end

	tycoons[tycoonModel] = player
	playerToTycoon[player] = tycoonModel
	tycoonState[tycoonModel] = {
		ownedItems = {}
	}

	tycoonModel:SetAttribute("Owner", player.UserId)

	-- Initialize systems
	Collector.Init(tycoonModel, player)

	-- Start the first dropper automatically
	TycoonManager.UnlockItem(player, "Mark's Dumbbell")

	print(player.Name .. " claimed the " .. tycoonModel.Name)
	return true
end

function TycoonManager.GetTycoonByPlayer(player)
	return playerToTycoon[player]
end

function TycoonManager.IsOwned(tycoon, itemName)
	return tycoonState[tycoon] and tycoonState[tycoon].ownedItems[itemName]
end

function TycoonManager.UnlockItem(player, itemName)
	local tycoon = playerToTycoon[player]
	if not tycoon then return end

	tycoonState[tycoon].ownedItems[itemName] = true

	local itemModel = tycoon:FindFirstChild(itemName)
	if itemModel then
		-- Make it visible and functional
		for _, part in pairs(itemModel:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = 0
				part.CanCollide = true
			end
		end
	end

	-- If it's a dropper, start it
	DropperHandler.StartDropper(tycoon, itemName)
end

function TycoonManager.ResetTycoon(player)
	local tycoon = playerToTycoon[player]
	if not tycoon then return end

	DropperHandler.StopAll(tycoon)
	tycoon:SetAttribute("Owner", 0)

	-- Reset visibility (simplified)
	for _, item in pairs(tycoon:GetChildren()) do
		if item:IsA("Model") and item.Name ~= "ClaimPad" then
			for _, part in pairs(item:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Transparency = 1
					part.CanCollide = false
				end
			end
		end
	end

	tycoons[tycoon] = nil
	playerToTycoon[player] = nil
	tycoonState[tycoon] = nil
end

return TycoonManager
