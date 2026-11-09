extends PanelContainer
class_name InventoryDialog

signal item_activated(item: Item)

@export var item_slot : PackedScene
@onready var grid_container: GridContainer = %GridContainer

var _inventory : Inventory

func open(inventory: Inventory):
	if _inventory != inventory:
		_inventory = inventory
		_inventory.changed.connect(refresh)
	
	show()
	refresh()
	

func refresh():
	for child in grid_container.get_children():
		child.queue_free()
	
	for item in _inventory.get_items():
		var slot = item_slot.instantiate()
		grid_container.add_child(slot)
		slot.display(item)
		slot.activated.connect(item_activated.emit)

func _on_close_button_pressed() -> void:
	hide()
