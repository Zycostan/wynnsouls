class_name Inventory

signal changed

var inventory_dict : Array[Item] = []
var equipped_weapon : WeaponItem = null

func add_item(item: Item):
	inventory_dict.append(item)
	changed.emit()

func remove_item(item: Item):
	inventory_dict.erase(item)
	changed.emit()

func get_items() -> Array[Item]:
	return inventory_dict

func equip_weapon(item: WeaponItem):
	if equipped_weapon:
		inventory_dict.append(equipped_weapon)
	inventory_dict.erase(item)
	equipped_weapon = item
	changed.emit()

func unequip_weapon():
	if equipped_weapon:
		inventory_dict.append(equipped_weapon)
		equipped_weapon = null
		changed.emit()
