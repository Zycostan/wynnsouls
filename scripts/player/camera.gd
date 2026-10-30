extends Node3D
@onready var player = $".." as Player
@onready var player_camera = $PlayerCamera as Camera3D

@export var delay : float = 5.0 ## lower means more delay

var mouse_is_captured = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	top_level = true


func _process(delta):
	global_position = global_position.lerp(player.global_position, delay * delta)


func _input(event):
	if event.is_action_released("mouse_mode_switch"):
		switch_mouse()
	
	if event is InputEventMouseMotion and mouse_is_captured:
		var d_hor = event.relative.x
		rotate_y(- d_hor / 1000)


func switch_mouse():
	if mouse_is_captured:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	mouse_is_captured = not mouse_is_captured
