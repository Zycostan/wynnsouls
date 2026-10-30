extends Resource
class_name TransitionData

var transitions : bool
var target_move : String

func _init(verdict: bool, next_move: String) -> void:
	transitions = verdict
	target_move = next_move
