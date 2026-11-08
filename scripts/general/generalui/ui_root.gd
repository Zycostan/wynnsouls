extends CanvasLayer

@export var player : Player

@onready var inventory_dialog = %InventoryDialog as InventoryDialog

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("interact"):
		inventory_dialog.open(player.inventory)
