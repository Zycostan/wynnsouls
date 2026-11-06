extends AIMove

@export var simulator: PhysicalBoneSimulator3D
@export var hitbox: Hurtbox

@export var impulse_str : float = 4.0
@export var despawn_after : float = 10.0

@onready var health_bar: Sprite3D = $"../../Visuals/hp3D"
# HEALTH BAR IS ONLY MENTIONED HERE BECAUSE I GOTTA HIDE IT

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
	
	
	character.collision_layer = 0
	character.collision_mask = 0
	if hitbox:
		hitbox.monitoring = false
		hitbox.monitorable = false
	
	simulator.physical_bones_start_simulation()
	
	var away : Vector3 = character.global_position - player.global_position
	away.y = 0
	var impulse : Vector3 = (away.normalized() + Vector3.UP * 0.4) * impulse_str
	for bone in simulator.get_children():
		if bone is PhysicalBone3D:
			bone.apply_central_impulse(impulse)
	
	if despawn_after > 0:
		character.get_tree().create_timer(despawn_after).timeout.connect(character.queue_free)
	
