extends Node
class_name HumanoidCombat

@onready var model  = $".." as PlayerModel

static var inputs_priority : Dictionary = {
	"light_attack_pressed" : 1,
	"heavy_attack_pressed" : 2,
}

func contextualize(new_input : InputPackage) -> InputPackage:
	translate_inputs(new_input)
	filter_with_resources(new_input)
	return new_input

func translate_inputs(input : InputPackage):
	if not input.combat_actions.is_empty():
		input.combat_actions.sort_custom(combat_action_priority_sort)
		var best_input_action : String = input.combat_actions[0]
		var weapon = model.active_weapon
		if weapon == null or not weapon.basic_attacks.has(best_input_action):
			return # unarmed or weapon has no move to it
		input.actions.append(weapon.basic_attacks[best_input_action])

func filter_with_resources(input : InputPackage):
	if model.resources.statuses.has("fatique"):
		input.actions.erase("sprint")

static func combat_action_priority_sort(a : String, b : String):
	if inputs_priority[a] > inputs_priority[b]:
		return true
	else:
		return false
