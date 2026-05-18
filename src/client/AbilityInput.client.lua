local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local events = ReplicatedStorage:WaitForChild("Events")
local abilityEvent = events:WaitForChild("AbilityRequest")

local keybinds = {
	[Enum.KeyCode.Q] = "Power Strike",
	[Enum.KeyCode.E] = "Flight",
	[Enum.KeyCode.R] = "Explosion",
	[Enum.KeyCode.F] = "Grab and Throw",
	[Enum.KeyCode.LeftShift] = "Super Sprint"
}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	local abilityName = keybinds[input.KeyCode]
	if abilityName then
		local targetPos = player:GetMouse().Hit.Position
		abilityEvent:FireServer(abilityName, targetPos)
	end
end)
