extends Node3D
class_name PlayerModel

@export var is_enemy : bool = false

@export var humanoid: CharacterBody3D
@export var skeleton: Skeleton3D
@export var animator: AnimationPlayer
@export var combat: HumanoidCombat
@export var resources: HumanoidResources
@export var area_awareness : AreaAwareness

@export var active_weapon: Weapon
@export var moves_container: HumanoidStates

@export var weapon_socket : Node3D

var current_move : Move

func _ready():
	moves_container.humanoid = humanoid
	moves_container.accept_moves()
	if active_weapon:
		moves_container.load_weapon_moves(active_weapon)
	current_move = moves_container.moves["idle"]

func update(input : InputPackage, delta : float):
	input = combat.contextualize(input)
	area_awareness.last_input_package = input
	var relevance = current_move.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	#print(current_move.animation)
	current_move.update_resources(delta)
	current_move.update(input, delta)

func switch_to(state : String):
	if not is_enemy:
		print(current_move.move_name + " -> " + state)
	current_move.on_exit_state()
	current_move = moves_container.moves[state]
	current_move.on_enter_state()
	current_move.mark_enter_state()
	resources.pay_resource_cost(current_move)
	animator.play(current_move.animation)

func equip_weapon(item: WeaponItem):
	unequip_weapon()
	var weapon := item.weapon_scene.instantiate() as Weapon
	weapon.add_to_group("enemys_weapon" if is_enemy else "players_weapon")
	weapon.holder = self
	weapon_socket.add_child(weapon)
	active_weapon = weapon
	moves_container.load_weapon_moves(weapon)

func unequip_weapon():
	if active_weapon == null:
		return
	if current_move != moves_container.moves["idle"]:
		switch_to("idle")
	moves_container.unload_weapon_moves()
	active_weapon.queue_free()
	active_weapon = null

func can_change_weapon() -> bool:
	return not moves_container.is_weapon_move(current_move.move_name)
