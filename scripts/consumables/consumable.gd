extends Item
class_name Consumable

var player : Player
@export var max_charges : int = 12
@export var current_charge : int = 1

func use(target: Node) -> bool:
	if current_charge <= 0:
		return false
	
	if do(target):
		current_charge -= 1
		return true
	return false

func do(target: Node) -> bool:
	return false

func refill():
	current_charge = max_charges

# single-use and temporary like status_effects, but this is more general purpose, or lower purpose
# its for health, faith, etc, temporary buff, no duration as it only applies once, like health pots
