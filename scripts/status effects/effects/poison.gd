extends StatusEffect
class_name PoisonEffect

@export var damage_tick : float = 5.0

func effect_tick():
	if target and target.has_node("Resources"):
		var res = target.get_node("Resources")
		res.lose_health(damage_tick)
