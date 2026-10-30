extends Node
class_name InputGatherer

@onready var player: CharacterBody3D = $".."

func gather_input() -> InputPackage:
	var new_input = InputPackage.new()
	var delta = get_physics_process_delta_time()
	
	new_input.actions.append("idle")
	
	new_input.input_direction = Input.get_vector("left", "right", "forward", "backward")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		if Input.is_action_pressed("sprint"):		# sprint is hidden here to avoid standing in place and sprinting
			new_input.actions.append("sprint")
		
		if Input.is_action_pressed("parry"):
			new_input.actions.append("parry")
		
		if Input.is_action_just_pressed("jump"):
			if new_input.actions.has("sprint"):
				new_input.actions.append("jump_start")
			else:
				new_input.actions.append("jump_start")
	
	if Input.is_action_just_pressed("light_attack"):
		new_input.combat_actions.append("light_attack_pressed")
	
	
	return new_input
