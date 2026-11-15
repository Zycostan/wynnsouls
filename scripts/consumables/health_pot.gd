extends Consumable

@export var health_regain : int = 25

func do(target: Node):
	if player.model.resources.health > player.model.resources.max_health:
		player.model.resources.health += health_regain
