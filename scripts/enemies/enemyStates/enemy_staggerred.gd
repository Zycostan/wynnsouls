extends AIMove

@export var stag_dur : float = 1.0667

func check_transition(_delta) -> Array:
	if works_longer_than(stag_dur):
		if player.global_position.distance_to(character.global_position) < character.attack_radius:
			return [true, "attack"]
		return [true, "pursuit"]
	return [false, ""]


func on_enter():
	character.velocity = Vector3.ZERO
