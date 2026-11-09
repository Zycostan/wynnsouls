extends CanvasLayer

@export var player : Player

@onready var inventory_dialog = %InventoryDialog as InventoryDialog
@onready var equipped_slot = $EquippedSlot as EquippedSlotHud


func _ready() -> void:
	equipped_slot.bind(player.inventory)
	inventory_dialog.item_activated.connect(player.toggle_equip)
	equipped_slot.activated.connect(player.toggle_equip)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("interact"):
		inventory_dialog.open(player.inventory)
