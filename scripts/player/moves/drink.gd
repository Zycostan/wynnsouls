extends Move

@export var potion : Consumable

func default_lifecycle(input) -> String:
	if works_longer_than(DURATION):
		return "idle"
	return "okay"


func on_enter_state():
	humanoid.velocity = Vector3.ZERO
	
	if humanoid.has_method("use_quick_item"):
		humanoid.use_quick_item()
