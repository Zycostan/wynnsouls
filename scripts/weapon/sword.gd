extends Weapon
class_name Sword

@export var damage : float = 15

func _ready():
	basic_attacks = {
		"light_attack_pressed" : "slash_1",
	}

func get_hit_data():
	return holder.current_move.form_hit_data(self)
