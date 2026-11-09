extends CharacterBody3D
class_name Player

@onready var input_gatherer = $Input as InputGatherer
@onready var model = $Model as PlayerModel
@onready var visuals = $Visuals as PlayerVisuals
@onready var camera_mount = $Cam
@onready var collider = $collider

var inventory : Inventory = Inventory.new()

func _ready() -> void:
	visuals.accept_model(model)

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	input.queue_free()

func on_item_picked_up(item: Item):
	print("got a ", item.item_name)
	inventory.add_item(item)

func toggle_equip(item: Item):
	if not (item is WeaponItem):
		return
	if not model.can_change_weapon():
		return
	if item == inventory.equipped_weapon:
		inventory.unequip_weapon()
		model.unequip_weapon()
		visuals.clear_weapon_visuals()
	else:
		inventory.equip_weapon(item)
		model.equip_weapon(item)
		visuals.show_weapon_visuals(item)
