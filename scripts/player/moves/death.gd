extends Move

const ANIMATION_END : float = 3

func on_enter_state():
	humanoid.model.active_weapon.is_attacking = false
	humanoid.velocity = Vector3.ZERO

func default_lifecycle(_input : InputPackage):
	return "okay"
