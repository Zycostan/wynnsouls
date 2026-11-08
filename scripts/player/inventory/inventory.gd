class_name Inventory

var inventory_dict : Array[Item] = []

func add_item(item: Item):
	inventory_dict.append(item)

func remove_item(item: Item):
	inventory_dict.erase(item)

func get_items() -> Array[Item]:
	return inventory_dict
