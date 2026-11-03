extends CharacterBody3D
class_name Player

@onready var input_gatherer = $Input as InputGatherer
@onready var model = $Model as PlayerModel
@onready var visuals = $Visuals as PlayerVisuals
@onready var camera_mount = $Cam
@onready var collider = $collider


func _ready() -> void:
	visuals.accept_model(model)

func _physics_process(delta):
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	input.queue_free()
