local AbilitiesConfig = {}

AbilitiesConfig.Abilities = {
	["Power Strike"] = {
		Cooldown = 5,
		Damage = 25,
		Description = "A devastating punch inspired by Omni-Man.",
		AnimationId = "rbxassetid://0", -- Placeholder
	},
	["Flight"] = {
		Cooldown = 0,
		Speed = 50,
		Description = "Take to the skies like Invincible.",
		IsToggle = true,
	},
	["Super Sprint"] = {
		Cooldown = 10,
		Duration = 5,
		Multiplier = 2,
		Description = "Move with Viltrumite speed.",
	},
	["Explosion"] = {
		Cooldown = 15,
		Radius = 15,
		Damage = 50,
		Description = "Atom Eve's molecular manipulation causes a blast.",
	},
	["Grab and Throw"] = {
		Cooldown = 8,
		Range = 10,
		ThrowForce = 100,
		Description = "Grab an enemy and hurl them away.",
	}
}

return AbilitiesConfig
