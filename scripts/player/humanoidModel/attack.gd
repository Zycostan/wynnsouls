extends Move

@export var RELEASES_PRIORITY : float

@export var hit_damage = 10 ## will be a function of player stats in the future

func default_lifecycle(input : InputPackage) -> String:
	if has_queued_move and transitions_to_queued():
		has_queued_move = false
		return queued_move
	
	var best_input = best_input_that_can_be_paid(input)
	if works_longer_than(RELEASES_PRIORITY):
		if works_longer_than(DURATION) or best_input != "idle":
			return best_input
	return "okay"

func update(input : InputPackage, delta):
	move_player(delta)
	if accepts_queueing():
		check_combos(input)
	if weapon:
		humanoid.model.active_weapon.is_attacking = right_weapon_hurts()

func move_player(delta : float):
	var delta_pos = get_root_position_delta(delta)
	delta_pos.y = 0
	humanoid.velocity = humanoid.get_quaternion() * delta_pos / delta
	if not humanoid.is_on_floor():
		humanoid.velocity.y -= gravity * delta
		has_forced_move = true
		forced_move = "midair"
	humanoid.move_and_slide()

func form_hit_data(hitting_weapon : Weapon) -> HitData:
	var hit = HitData.new()
	hit.damage = hit_damage
	hit.hit_move_animation = animation
	hit.is_parryable = is_parryable()
	hit.weapon = hitting_weapon
	return hit

func on_enter_state():
	has_queued_move = false

func on_exit_state():
	if weapon:
		weapon.hitbox_ignore_list.clear()
		weapon.is_attacking = false
