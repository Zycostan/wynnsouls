extends Consumable
class_name HealthPot

@export var health_regain : float = 25.0

func do(target: Node) -> bool:
	var act_tar = target if target else player
	if not act_tar:
		return false
	
	var tar_model = act_tar.get("model") if "model" in act_tar else null
	if tar_model and "resources" in tar_model and tar_model.resources:
		var rizzler = tar_model.resources
		
		if rizzler.health >= rizzler.max_health:
			return false
		
		rizzler.gain_health(health_regain)
		return true
		
	return false
