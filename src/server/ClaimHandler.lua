local TycoonManager = require(script.Parent:WaitForChild("TycoonManager"))

local ClaimHandler = {}

function ClaimHandler.Init()
	-- Find all tycoon models in workspace
	for _, model in pairs(workspace:GetChildren()) do
		if model.Name:find("Tycoon") then
			local claimPad = model:FindFirstChild("ClaimPad")
			if claimPad then
				claimPad.Touched:Connect(function(hit)
					local player = game.Players:GetPlayerFromCharacter(hit.Parent)
					if player then
						TycoonManager.ClaimTycoon(player, model)
					end
				end)
			end
		end
	end
end

return ClaimHandler
