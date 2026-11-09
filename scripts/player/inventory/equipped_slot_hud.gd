extends ItemSlot
class_name EquippedSlotHud

func bind(inventory: Inventory):
	inventory.changed.connect(func(): display(inventory.equipped_weapon))
	display(inventory.equipped_weapon)
