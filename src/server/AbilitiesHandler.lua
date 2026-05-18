local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilitiesConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("AbilitiesConfig"))

local AbilitiesHandler = {}
local cooldowns = {} -- player -> {abilityName -> lastUsed}
local activeFlight = {} -- player -> BodyVelocity

local MAX_ABILITY_DISTANCE = 50

function AbilitiesHandler.ExecuteAbility(player, abilityName, targetPosition)
	local character = player.Character
	if not character then return false end
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChild("Humanoid")
	if not rootPart or not humanoid then return false end

	local config = AbilitiesConfig.Abilities[abilityName]
	if not config then return false, "Ability not found" end

	-- Security: Distance check
	if targetPosition and (rootPart.Position - targetPosition).Magnitude > MAX_ABILITY_DISTANCE then
		return false, "Target too far"
	end

	-- Cooldown check
	if not config.IsToggle then
		if not cooldowns[player] then cooldowns[player] = {} end
		local lastUsed = cooldowns[player][abilityName] or 0
		if tick() - lastUsed < config.Cooldown then
			return false, "Cooldown active"
		end
		cooldowns[player][abilityName] = tick()
	end

	-- Implementation
	if abilityName == "Power Strike" then
		local explosion = Instance.new("Explosion")
		explosion.Position = rootPart.Position + (rootPart.CFrame.LookVector * 5)
		explosion.BlastRadius = 5
		explosion.Parent = workspace

	elseif abilityName == "Flight" then
		if activeFlight[player] then
			activeFlight[player]:Destroy()
			activeFlight[player] = nil
			humanoid.PlatformStand = false
		else
			local bv = Instance.new("BodyVelocity")
			bv.MaxForce = Vector3.new(400000, 400000, 400000)
			bv.Velocity = rootPart.CFrame.LookVector * config.Speed + Vector3.new(0, 10, 0)
			bv.Parent = rootPart
			activeFlight[player] = bv
			humanoid.PlatformStand = true

			-- Dynamic flight direction
			task.spawn(function()
				while activeFlight[player] == bv do
					bv.Velocity = rootPart.CFrame.LookVector * config.Speed
					task.wait(0.1)
				end
			end)
		end

	elseif abilityName == "Super Sprint" then
		local originalSpeed = humanoid.WalkSpeed
		humanoid.WalkSpeed = originalSpeed * config.Multiplier
		task.delay(config.Duration, function()
			if humanoid then humanoid.WalkSpeed = originalSpeed end
		end)

	elseif abilityName == "Explosion" then
		local explosion = Instance.new("Explosion")
		explosion.Position = targetPosition
		explosion.BlastRadius = config.Radius
		explosion.Parent = workspace

	elseif abilityName == "Grab and Throw" then
		-- Find target to throw
		for _, otherChar in pairs(workspace:GetChildren()) do
			if otherChar:IsA("Model") and otherChar ~= character then
				local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
				if otherRoot and (otherRoot.Position - rootPart.Position).Magnitude < config.Range then
					local throwDir = (targetPosition - otherRoot.Position).Unit
					otherRoot:ApplyImpulse(throwDir * config.ThrowForce * 100)
					break
				end
			end
		end
	end

	return true
end

return AbilitiesHandler
