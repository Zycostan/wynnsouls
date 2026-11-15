extends Resource
class_name StatusEffect

var target: Node
var e_time : float = 0.0
var tick_time : float = 0.0

@export var effect_name : String = "Status"
@export var duration : float = 5.0
@export var tick_int : float = 1.0

func apply(t: Node):
	target = t
	# TODO, apply init stat changes

func time(delta: float) -> void:
	duration -= delta
	tick_int += delta
	if tick_time >= tick_int:
		tick_time = 0.0

func effect_tick():
	# override this in child
	pass

func remove():
	# TODO, revert stat changes when effect expires
	pass

# this script is basically like the consumables.gd but its for defects and gain, etc
# it is a temporary gain or loss that could be inflicted on the player (or if the player does it, then itself)
# target can be player or enemy, fucking crazy ik
# if dureation ends, status effect then gets removed, crazy shit tbh
