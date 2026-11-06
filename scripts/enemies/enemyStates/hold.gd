extends AIMove

func check_transition(delta) -> Array:
	if player.global_position.distance_to(spawn_point) > character.deaggro_radius:
		return [true, "return"]
	if player.global_position.distance_to(character.global_position) >= character.attack_radius:
		return [true, "pursuit"]
	if state_machine.can_attack():
		return [true, state_machine.pick_attack()]
	return [false, ""]

func update(delta):
	var grounded = player.global_position
	grounded.y = character.global_position.y
	character.look_at(grounded)
