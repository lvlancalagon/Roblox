local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))

local Collector = {}

function Collector.Init(tycoon, owner)
	local collectorPart = tycoon:FindFirstChild("Collector")
	if not collectorPart then return end

	local function collect(hit)
		if hit.Name == "Ore" then
			local payoutAttr = hit:FindFirstChild("PayoutValue")
			if payoutAttr then
				local amount = payoutAttr.Value * TycoonSettings.BaseSettings.CollectorMultiplier
				local leaderstats = owner:FindFirstChild("leaderstats")
				if leaderstats then
					local cash = leaderstats:FindFirstChild("Cash")
					if cash then
						cash.Value = cash.Value + amount
					end
				end
			end
			hit:Destroy()
		end
	end

	collectorPart.Touched:Connect(collect)

	-- Auto-Collector logic
	task.spawn(function()
		while true do
			task.wait(1)
			if tycoon:GetAttribute("AutoCollectorActive") then
				local oresFolder = tycoon:FindFirstChild("Ores")
				if oresFolder then
					for _, ore in pairs(oresFolder:GetChildren()) do
						collect(ore)
					end
				end
			end
		end
	end)
end

return Collector
