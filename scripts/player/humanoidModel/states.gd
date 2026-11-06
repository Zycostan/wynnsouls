extends Node
class_name HumanoidStates

@export var humanoid : CharacterBody3D
@export var animator : AnimationPlayer
@export var resources : HumanoidResources
@export var combat : HumanoidCombat
@export var area_awareness : AreaAwareness

@onready var moves_data_repo = $MovesData as MovesDataRepository

var moves : Dictionary ## { string : Move }, where string is Move heirs name
var weapon_move_names : Array[String] ## names of the moves given to the equipped weapon

func accept_moves():
	for child in get_children():
		if child is Move:
			register_move(child)

func load_weapon_moves(weapon: Weapon):
	for move in weapon.get_moves():
		if register_move(move, weapon):
			weapon_move_names.append(move.move_name)
	
	for move_name in weapon.basic_attacks.values():
		if not moves.has(move_name):
			push_error(weapon.name + ".basic_attacks points to the fucking abyss" + move_name)

func unload_weapon_moves():
	for move_name in weapon_move_names:
		moves.erase(move_name)
	weapon_move_names.clear()

func is_weapon_move(move_name : String) -> bool:
	return weapon_move_names.has(move_name)

func register_move(move: Move, weapon: Weapon = null) -> bool:
	if moves.has(move.move_name):
		push_error("move name collision, skipped: " + move.move_name)
		return false
	moves[move.move_name] = move
	move.humanoid = humanoid
	move.animator = animator
	move.resources = resources
	move.combat = combat
	move.moves_data_repo = moves_data_repo
	move.area_awareness = area_awareness
	move.container = self
	move.weapon = weapon
	move.DURATION = moves_data_repo.get_duration(move.backend_animation)
	move.assign_combos()
	return true

func moves_priority_sort(a : String, b : String):
	if moves[a].priority > moves[b].priority:
		return true
	else:
		return false
