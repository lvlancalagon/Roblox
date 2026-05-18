local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TycoonSettings = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("TycoonSettings"))

local Collector = {}

function Collector.Init(tycoon, owner)
	local collectorPart = tycoon:FindFirstChild("Collector")
	if not collectorPart then return end

	collectorPart.Touched:Connect(function(hit)
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
	end)
end

return Collector
