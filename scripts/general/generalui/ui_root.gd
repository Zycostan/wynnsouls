extends CanvasLayer

@export var player : Player

@onready var status_dialog = $StatusDialog as StatusDialog
@onready var inventory_dialog = %InventoryDialog as InventoryDialog
@onready var equipped_slot = $EquippedSlot as EquippedSlotHud
@onready var ui_hub: Panel = $ui_hub

func _ready() -> void:
	equipped_slot.bind(player.inventory)
	inventory_dialog.item_activated.connect(player.toggle_equip)
	equipped_slot.activated.connect(player.toggle_equip)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("mouse_mode_switch"):
		if ui_hub.visible:
			ui_hub.hide()
		else:
			ui_hub.show()
		if inventory_dialog.visible:
			inventory_dialog.hide()
		if status_dialog.visible:
			status_dialog.hide()
	


func _on_inventory_button_pressed() -> void:
	inventory_dialog.open(player.inventory)


func _on_stats_button_pressed() -> void:
	if status_dialog.visible:
		status_dialog.hide()
	else:
		status_dialog.show()
