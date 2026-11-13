extends Node
class_name MobStateMachine

@export var animation_player : AnimationPlayer
@export var character : CharacterBody3D
@export var right_weapon : Weapon
@export var resources : EnemyResources

@export var attack_names : Array[String] = ["attack"]
@export var cooldown_min : float = 0.8
@export var cooldown_max : float = 1.8

var next_attack_time : float = 0.0
var last_attack : String = ""
var repeat_count : int = 0

var moves : Dictionary # { String : AIMove }
var current_move : AIMove

var clock : float = 0.0

func _ready():
	accept_states()
	current_move = moves["idle"]
	switch_to("idle")


func _physics_process(delta):
	clock += delta # time shit yk me
	
	var verdict = current_move.check_transition(delta)
	if verdict[0]:
		switch_to(verdict[1])
	current_move.update(delta)

func switch_to(next_state_name : String):
	print(current_move.move_name + " -> " + next_state_name)
	if current_move:
		current_move.on_exit()
	current_move = moves[next_state_name]
	current_move.mark_enter_state()
	current_move.on_enter()
	animation_player.play(current_move.animation)

func accept_states():
	for child in get_children():
		if child is AIMove:
			moves[child.move_name] = child
			child.state_machine = self
			child.animator = animation_player
			child.character = character
			child.player = character.player
			child.spawn_point = character.spawn_point
			child.right_weapon = right_weapon
			child.resources = resources

func can_attack() -> bool:
	return clock >= next_attack_time

func pick_attack() -> String:
	var pool = attack_names.duplicate()
	if repeat_count >= 2 and pool.size() > 1:
		pool.erase(last_attack) # no 3-term presidency
	return pool.pick_random()

func register_attack(attack_name: String, duration: float):
	repeat_count = repeat_count + 1 if attack_name == last_attack else 1
	last_attack = attack_name
	next_attack_time = clock + duration + randf_range(cooldown_min, cooldown_max)
