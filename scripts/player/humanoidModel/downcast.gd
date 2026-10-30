extends RayCast3D


@onready var root = $"../../Root"
@onready var target_sphere = $target_sphere

func _process(delta: float) -> void:
	global_position = root.global_position
	target_sphere.global_position = get_collision_point()
