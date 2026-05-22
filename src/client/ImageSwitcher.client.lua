local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

-- Configuration for the image switching
local SWITCH_INTERVAL = 1.5 -- Seconds between swaps (adjustable 1-2s)

local function setupAnimatedImage(part)
	local decal = part:FindFirstChildOfClass("Decal") or Instance.new("Decal")
	decal.Parent = part

	local image1 = part:GetAttribute("Image1") or "rbxassetid://0"
	local image2 = part:GetAttribute("Image2") or "rbxassetid://0"

	local lastSwitch = 0
	local showFirst = true

	RunService.Heartbeat:Connect(function()
		if tick() - lastSwitch >= SWITCH_INTERVAL then
			lastSwitch = tick()
			showFirst = not showFirst
			decal.Texture = showFirst and image1 or image2
		end
	end)
end

-- Watch for parts with the "AnimatedImage" tag
CollectionService:GetInstanceAddedSignal("AnimatedImage"):Connect(setupAnimatedImage)

for _, instance in ipairs(CollectionService:GetTagged("AnimatedImage")) do
	setupAnimatedImage(instance)
end

print("🖼 ImageSwitcher Client System Initialized")
