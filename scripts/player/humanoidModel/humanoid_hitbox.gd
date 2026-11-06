extends Area3D
class_name Hurtbox

@export var processor : Node

@export var ignored_weapon_groups : Array[String]

func _physics_process(_delta) -> void:
	if not monitoring:
		return
	for area in get_overlapping_areas():
		if is_eligible_attacking_weapon(area):
			on_contact(area)

func _ready():
	area_entered.connect(on_contact)

func on_contact(area : Node3D):
	
	if is_eligible_attacking_weapon(area):
		area.hitbox_ignore_list.append(self)
		processor.current_move.react_on_hit(area.get_hit_data())

func is_eligible_attacking_weapon(area : Node3D) -> bool:
	if area is Weapon and is_not_ignored(area) and not area.hitbox_ignore_list.has(self) and area.is_attacking:
		return true
	return false

func is_not_ignored(area : Node3D) -> bool:
	for group in ignored_weapon_groups:
		if area.is_in_group(group):
			return false
	return true
