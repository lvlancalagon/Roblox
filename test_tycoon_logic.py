import unittest

class MockValue:
    def __init__(self, value):
        self.Value = value

class MockInstance:
    def __init__(self, name):
        self.Name = name
        self.children = {}
    def FindFirstChild(self, name):
        return self.children.get(name)
    def AddChild(self, child):
        self.children[child.Name] = child

class TestTycoonLogic(unittest.TestCase):
    def setUp(self):
        # Expanded settings mock
        self.settings = {
            "Droppers": {
                "Mark's Dumbbell": {"Cost": 0, "Payout": 1},
                "Viltrumite Ore": {"Cost": 500, "Payout": 10},
                "Flaxan Tech Dropper": {"Cost": 5000, "Payout": 100, "Dependency": "Second Floor"}
            },
            "Upgrades": {
                "Grayson Residence": {"Cost": 1000, "Dependency": "Mark's Dumbbell"},
                "Second Floor": {"Cost": 15000}
            }
        }
        self.owned_items = {}

    def test_purchase_logic_with_dependencies(self):
        current_cash = 20000

        def can_purchase(item_name, cash, owned):
            config = self.settings["Droppers"].get(item_name) or self.settings["Upgrades"].get(item_name)
            if not config: return False, "Item not found"
            if item_name in owned: return False, "Already owned"
            if cash < config["Cost"]: return False, "Insufficient funds"
            dep = config.get("Dependency")
            if dep and dep not in owned: return False, f"Missing dependency: {dep}"
            return True, cash - config["Cost"]

        # 1. Try to buy Flaxan Tech Dropper without Second Floor
        success, res = can_purchase("Flaxan Tech Dropper", current_cash, self.owned_items)
        self.assertFalse(success)
        self.assertIn("Missing dependency", res)

        # 2. Buy Second Floor
        success, current_cash = can_purchase("Second Floor", current_cash, self.owned_items)
        self.assertTrue(success)
        self.owned_items["Second Floor"] = True
        self.assertEqual(current_cash, 5000)

        # 3. Buy Flaxan Tech Dropper now
        success, current_cash = can_purchase("Flaxan Tech Dropper", current_cash, self.owned_items)
        self.assertTrue(success)
        self.owned_items["Flaxan Tech Dropper"] = True
        self.assertEqual(current_cash, 0)

    def test_ability_cooldown(self):
        cooldowns = {}
        def execute_ability(player, ability_name, current_time, cooldown_config):
            last_used = cooldowns.get(ability_name, 0)
            if current_time - last_used < cooldown_config:
                return False
            cooldowns[ability_name] = current_time
            return True

        self.assertTrue(execute_ability("Player1", "Power Strike", 100, 5))
        self.assertFalse(execute_ability("Player1", "Power Strike", 102, 5)) # Too soon
        self.assertTrue(execute_ability("Player1", "Power Strike", 106, 5)) # Enough time

if __name__ == '__main__':
    unittest.main()
