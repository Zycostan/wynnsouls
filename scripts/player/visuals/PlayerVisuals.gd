extends Node3D
class_name PlayerVisuals

@onready var model : PlayerModel

@onready var eyebrows: MeshInstance3D = $Eyebrows
@onready var eyes: MeshInstance3D = $Eyes
@onready var super_hero_male: MeshInstance3D = $SuperHero_Male

@onready var weapon_visuals: Node3D
@onready var stamina_bar: ProgressBar = $Stamina_bar
@onready var health_bar: ProgressBar = $Health_bar

@export var pixel_hp : float = 4.0
@export var pixel_stamina : float = 4.0
@export var max_bar_width : float = 800.0

func accept_model(_model: PlayerModel):
	model = _model
	super_hero_male.skeleton = _model.skeleton.get_path()
	eyes.skeleton = _model.skeleton.get_path()
	eyebrows.skeleton = _model.skeleton.get_path()

func _process(_delta):
	adjust_weapon_visuals()
	update_resources_interface()

func show_weapon_visuals(item: Item):
	clear_weapon_visuals()
	if item.item_visuals:
		weapon_visuals = item.item_visuals.instantiate()
		add_child(weapon_visuals)

func clear_weapon_visuals():
	if weapon_visuals:
		weapon_visuals.queue_free()
		weapon_visuals = null

func adjust_weapon_visuals():
	if model and model.active_weapon and weapon_visuals:
		weapon_visuals.global_transform = model.active_weapon.global_transform

func update_resources_interface():
	if not model.is_enemy:
		stamina_bar.max_value = model.resources.max_stamina
		stamina_bar.value = model.resources.stamina
		
		health_bar.max_value = model.resources.max_health
		health_bar.value = model.resources.health
