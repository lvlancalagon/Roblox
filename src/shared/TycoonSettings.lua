local TycoonSettings = {}

TycoonSettings.Droppers = {
	-- Floor 1
	["Mark's Dumbbell"] = {
		Cost = 0,
		Payout = 1,
		Description = "Mark's first step into training. Slow but steady.",
		ModelId = "MarkDumbbell"
	},
	["Viltrumite Ore"] = {
		Cost = 500,
		Payout = 10,
		Description = "Raw materials from a Viltrumite colony.",
		ModelId = "ViltrumiteOre"
	},
	-- Floor 2
	["Flaxan Tech Dropper"] = {
		Cost = 5000,
		Payout = 100,
		Description = "Advanced energy cores from the Flaxan dimension.",
		ModelId = "FlaxanTech",
		Dependency = "Second Floor"
	},
	["Mars Rock Dropper"] = {
		Cost = 25000,
		Payout = 500,
		Description = "Rare minerals brought back from the mission to Mars.",
		ModelId = "MarsRock",
		Dependency = "Flaxan Tech Dropper"
	},
	-- Floor 3
	["GDA Satellite Feed"] = {
		Cost = 100000,
		Payout = 2000,
		Description = "High-value data stream from Cecil's orbital network.",
		ModelId = "GDASatellite",
		Dependency = "Third Floor"
	},
	["Atom Eve's Energy"] = {
		Cost = 500000,
		Payout = 10000,
		Description = "Harnessed molecular energy from Eve herself.",
		ModelId = "EveEnergy",
		Dependency = "GDA Satellite Feed"
	}
}

TycoonSettings.Upgrades = {
	-- Floor 1
	["Grayson Residence"] = {
		Cost = 1000,
		Description = "Establish your base of operations.",
		Dependency = "Mark's Dumbbell"
	},
	["GDA Underground Lab"] = {
		Cost = 5000,
		Description = "Cecil's secret research facility.",
		Dependency = "Viltrumite Ore"
	},
	["Second Floor"] = {
		Cost = 15000,
		Description = "Expand upwards to increase your influence.",
		Dependency = "GDA Underground Lab"
	},
	-- Floor 2
	["GDA Medical Wing"] = {
		Cost = 30000,
		Description = "Advanced healing pods for injured heroes.",
		Dependency = "Second Floor"
	},
	["Omni-Man's Trophy Room"] = {
		Cost = 75000,
		Description = "A collection of artifacts from conquered worlds.",
		Dependency = "Mars Rock Dropper"
	},
	["Third Floor"] = {
		Cost = 200000,
		Description = "The ultimate level of hero operations.",
		Dependency = "Omni-Man's Trophy Room"
	},
	-- Floor 3
	["Invincible's Penthouse"] = {
		Cost = 1000000,
		Description = "Luxury living for Earth's strongest defender.",
		Dependency = "Third Floor"
	},
	["GDA Command Center"] = {
		Cost = 2500000,
		Description = "Full control over global defense operations.",
		Dependency = "Invincible's Penthouse"
	}
}

TycoonSettings.BaseSettings = {
	DropperInterval = 3,
	StartingCash = 0,
	CollectorMultiplier = 1
}

return TycoonSettings
