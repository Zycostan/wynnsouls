extends PanelContainer
class_name InventoryDialog

@export var item_slot : PackedScene

@onready var grid_container: GridContainer = %GridContainer

func open(inventory: Inventory):
	show()
	
	for child in grid_container.get_children():
		child.queue_free()
	
	for item in inventory.get_items():
		var slot = item_slot.instantiate()
		grid_container.add_child(slot)
		slot.display(item)

func _on_close_button_pressed() -> void:
	hide()
