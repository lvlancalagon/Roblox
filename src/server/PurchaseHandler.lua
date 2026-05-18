local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))
local TycoonManager = require(script.Parent:WaitForChild("TycoonManager"))

local PurchaseHandler = {}

function PurchaseHandler.ProcessPurchase(player, itemName, tycoon)
	local itemConfig = TycoonSettings.Droppers[itemName] or TycoonSettings.Upgrades[itemName]
	if not itemConfig then return false, "Item not found" end

	-- 1. Check if already owned
	if TycoonManager.IsOwned(tycoon, itemName) then
		return false, "Item already owned"
	end

	-- 2. Check dependencies
	if itemConfig.Dependency then
		if not TycoonManager.IsOwned(tycoon, itemConfig.Dependency) then
			return false, "Dependency not met: " .. itemConfig.Dependency
		end
	end

	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then return false, "Leaderstats not found" end

	local cash = leaderstats:FindFirstChild("Cash")
	if not cash or cash.Value < itemConfig.Cost then
		return false, "Insufficient funds"
	end

	-- 3. Deduct cost
	cash.Value = cash.Value - itemConfig.Cost

	-- 4. Unlock item
	TycoonManager.UnlockItem(player, itemName)

	return true, "Purchase successful"
end

return PurchaseHandler
