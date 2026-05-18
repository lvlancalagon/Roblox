local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))

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

	local Collector = require(script.Parent:WaitForChild("Collector"))
	Collector.Init(tycoonModel, player)

	TycoonManager.UnlockItem(player, "Mark's Dumbbell")

	-- Auto-Buyer loop
	task.spawn(function()
		while playerToTycoon[player] == tycoonModel do
			task.wait(2)
			if tycoonModel:GetAttribute("AutoBuyerActive") then
				TycoonManager.TryAutoBuy(player, tycoonModel)
			end
		end
	end)

	return true
end

function TycoonManager.TryAutoBuy(player, tycoon)
	local PurchaseHandler = require(script.Parent:WaitForChild("PurchaseHandler"))
	-- Find next available items
	for name, data in pairs(TycoonSettings.Upgrades) do
		if not TycoonManager.IsOwned(tycoon, name) then
			local dep = data.Dependency
			if not dep or TycoonManager.IsOwned(tycoon, dep) then
				PurchaseHandler.ProcessPurchase(player, name, tycoon)
			end
		end
	end
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

	if itemName == "Auto-Collector" then
		tycoon:SetAttribute("AutoCollectorActive", true)
	elseif itemName == "Auto-Buyer" then
		tycoon:SetAttribute("AutoBuyerActive", true)
	end

	local itemModel = tycoon:FindFirstChild(itemName)
	if itemModel then
		for _, part in pairs(itemModel:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = 0
				part.CanCollide = true
			end
		end
	end

	local DropperHandler = require(script.Parent:WaitForChild("DropperHandler"))
	if TycoonSettings.Droppers[itemName] then
		DropperHandler.StartDropper(tycoon, itemName)
	end
end

function TycoonManager.ResetTycoon(player)
	local tycoon = playerToTycoon[player]
	if not tycoon then return end

	local DropperHandler = require(script.Parent:WaitForChild("DropperHandler"))
	DropperHandler.StopAll(tycoon)
	tycoon:SetAttribute("Owner", 0)
	tycoon:SetAttribute("AutoCollectorActive", false)
	tycoon:SetAttribute("AutoBuyerActive", false)

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
