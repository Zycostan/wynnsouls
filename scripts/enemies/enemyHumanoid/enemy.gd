extends CharacterBody3D

@onready var health_bar: ProgressBar = $Visuals/hpContainer/Health_bar
@onready var resources: EnemyResources = $Resources


@export var player : CharacterBody3D

@export var speed : float = 3
@export var return_speed : float = 9

@export var aggro_radius : float = 8
@export var attack_radius : float = 2
@export var deaggro_radius : float = 10

var spawn_point : Vector3


func _ready():
	spawn_point = global_position

func _process(delta: float) -> void:
	update_resources_interface()

func update_resources_interface():
	health_bar.max_value = resources.max_health
	health_bar.value = resources.health
