extends Move

@export var potion : Consumable

func default_lifecycle(input) -> String:
	if works_longer_than(DURATION):
		return "idle"
	return "okay"


func on_enter_state():
	humanoid.velocity = Vector3.ZERO
	
	if potion and potion.current_charge > 0:
		potion.use(humanoid)
	else:
		printerr("NO")
