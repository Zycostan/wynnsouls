extends AIMove

@export var simulator: PhysicalBoneSimulator3D
@export var despawn_after : float = 10.0

@onready var health_bar: Sprite3D = $"../../Visuals/hp3D" # HEALTH BAR IS ONLY MENTIONED HERE BECAUSE I GOTTA HIDE IT

func check_transition(delta):
	return [false, ""]

func on_enter():
	call_deferred("raggin_on_doll")


func raggin_on_doll():
	simulator.active = true
	
	character.velocity = Vector3.ZERO
	
	animator.stop()
	animator.active = false
	health_bar.hide()
	
	simulator.physical_bones_start_simulation()
	
	if despawn_after > 0:
		character.get_tree().create_timer(despawn_after).timeout.connect(character.queue_free)
	
