local TycoonSettings = {}

TycoonSettings.Droppers = {
	-- Floor 1
	["Mark's Dumbbell"] = {
		Cost = 0,
		Payout = 1,
		Description = "Mark's first step into training. Slow but steady.",
		ModelId = "MarkDumbbell",
		Color = Color3.fromRGB(150, 150, 150),
		Material = Enum.Material.Metal
	},
	["Viltrumite Ore"] = {
		Cost = 500,
		Payout = 10,
		Description = "Raw materials from a Viltrumite colony.",
		ModelId = "ViltrumiteOre",
		Color = Color3.fromRGB(180, 0, 0),
		Material = Enum.Material.Granite
	},
	-- Floor 2
	["Flaxan Tech Dropper"] = {
		Cost = 5000,
		Payout = 100,
		Description = "Advanced energy cores from the Flaxan dimension.",
		ModelId = "FlaxanTech",
		Dependency = "Second Floor",
		Color = Color3.fromRGB(0, 255, 100),
		Material = Enum.Material.Neon
	},
	["Mars Rock Dropper"] = {
		Cost = 25000,
		Payout = 500,
		Description = "Rare minerals brought back from the mission to Mars.",
		ModelId = "MarsRock",
		Dependency = "Flaxan Tech Dropper",
		Color = Color3.fromRGB(255, 100, 0),
		Material = Enum.Material.Slate
	},
	-- Floor 3
	["GDA Satellite Feed"] = {
		Cost = 100000,
		Payout = 2000,
		Description = "High-value data stream from Cecil's orbital network.",
		ModelId = "GDASatellite",
		Dependency = "Third Floor",
		Color = Color3.fromRGB(0, 100, 255),
		Material = Enum.Material.Metal
	},
	["Atom Eve's Energy"] = {
		Cost = 500000,
		Payout = 10000,
		Description = "Harnessed molecular energy from Eve herself.",
		ModelId = "EveEnergy",
		Dependency = "GDA Satellite Feed",
		Color = Color3.fromRGB(255, 100, 200),
		Material = Enum.Material.Neon
	}
}

TycoonSettings.Upgrades = {
	-- Floor 1
	["Grayson Residence"] = {
		Cost = 1000,
		Description = "Establish your base of operations.",
		Dependency = "Mark's Dumbbell",
		Color = Color3.fromRGB(240, 220, 180),
		Material = Enum.Material.Wood
	},
	["GDA Underground Lab"] = {
		Cost = 5000,
		Description = "Cecil's secret research facility.",
		Dependency = "Viltrumite Ore",
		Color = Color3.fromRGB(100, 100, 110),
		Material = Enum.Material.Concrete
	},
	["Second Floor"] = {
		Cost = 15000,
		Description = "Expand upwards to increase your influence.",
		Dependency = "GDA Underground Lab",
		Color = Color3.fromRGB(200, 200, 200),
		Material = Enum.Material.SmoothPlastic
	},
	-- Floor 2
	["GDA Medical Wing"] = {
		Cost = 30000,
		Description = "Advanced healing pods for injured heroes.",
		Dependency = "Second Floor",
		Color = Color3.fromRGB(255, 255, 255),
		Material = Enum.Material.Glass
	},
	["Omni-Man's Trophy Room"] = {
		Cost = 75000,
		Description = "A collection of artifacts from conquered worlds.",
		Dependency = "Mars Rock Dropper",
		Color = Color3.fromRGB(200, 180, 100),
		Material = Enum.Material.Marble
	},
	["Third Floor"] = {
		Cost = 200000,
		Description = "The ultimate level of hero operations.",
		Dependency = "Omni-Man's Trophy Room",
		Color = Color3.fromRGB(220, 220, 220),
		Material = Enum.Material.SmoothPlastic
	},
	-- Floor 3
	["Invincible's Penthouse"] = {
		Cost = 1000000,
		Description = "Luxury living for Earth's strongest defender.",
		Dependency = "Third Floor",
		Color = Color3.fromRGB(100, 200, 255),
		Material = Enum.Material.Glass
	},
	["Auto-Collector"] = {
		Cost = 2000000,
		Description = "GDA nanobots automatically collect all ore for you.",
		Dependency = "Invincible's Penthouse",
		Color = Color3.fromRGB(50, 50, 50),
		Material = Enum.Material.Metal
	},
	["Auto-Buyer"] = {
		Cost = 5000000,
		Description = "Cecil's AI assistant automatically purchases upgrades for you.",
		Dependency = "Auto-Collector",
		Color = Color3.fromRGB(0, 255, 255),
		Material = Enum.Material.Neon
	},
	["GDA Command Center"] = {
		Cost = 10000000,
		Description = "Full control over global defense operations.",
		Dependency = "Auto-Buyer",
		Color = Color3.fromRGB(20, 20, 30),
		Material = Enum.Material.Neon
	}
}

-- Animated Screen configuration
TycoonSettings.Animations = {
	["News Channel"] = {
		Image1 = "rbxassetid://12345678", -- Replace with your actual image ID
		Image2 = "rbxassetid://87654321", -- Replace with your second image ID
		Interval = 1.5
	}
}

TycoonSettings.BaseSettings = {
	DropperInterval = 3,
	StartingCash = 0,
	CollectorMultiplier = 1
}

return TycoonSettings
