local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

-- Require all server-side modules
local Leaderstats = require(script.Parent:WaitForChild("Leaderstats"))
local PurchaseHandler = require(script.Parent:WaitForChild("PurchaseHandler"))
local TycoonManager = require(script.Parent:WaitForChild("TycoonManager"))
local ClaimHandler = require(script.Parent:WaitForChild("ClaimHandler"))
local AbilitiesHandler = require(script.Parent:WaitForChild("AbilitiesHandler"))

-- Initialize Claiming system
ClaimHandler.Init()

-- Setup RemoteEvent Listener
local events = ReplicatedStorage:WaitForChild("Events")
local purchaseRequest = events:WaitForChild("PurchaseRequest")
local abilityRequest = events:WaitForChild("AbilityRequest")

purchaseRequest.OnServerEvent:Connect(function(player, itemName)
	local tycoon = TycoonManager.GetTycoonByPlayer(player)
	if tycoon then
		local success, message = PurchaseHandler.ProcessPurchase(player, itemName, tycoon)
		-- Send response to client if needed
	end
end)

abilityRequest.OnServerEvent:Connect(function(player, abilityName, targetPosition)
	AbilitiesHandler.ExecuteAbility(player, abilityName, targetPosition)
end)

Players.PlayerRemoving:Connect(function(player)
	TycoonManager.ResetTycoon(player)
end)

print("Invincible Tycoon Server Systems Initialized")
