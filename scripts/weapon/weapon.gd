extends Area3D
class_name Weapon

var hitbox_ignore_list : Array[Area3D]
var is_attacking: bool = false

@export var holder : Node

@export var base_damage : float = 10

var basic_attacks : Dictionary

const MOVES_NODE : String = "Moves"

func get_moves() -> Array[Move]:
	var result : Array[Move] = []
	var root = get_node_or_null(MOVES_NODE)
	if root == null:
		return result
	for child in root.get_children():
		if child is Move:
			result.append(child)
	return result

func get_hit_data() -> HitData:
	print("someone tries to get hit by default Weapon")
	return HitData.blank()
