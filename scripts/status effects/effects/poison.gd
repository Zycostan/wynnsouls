extends StatusEffect
class_name PoisonEffect

@export var damage_tick : float = 5.0

func effect_tick():
	target.lose_health(damage_tick)
