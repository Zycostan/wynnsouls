extends Node3D
class_name PlayerVisuals

@onready var model : PlayerModel
@onready var mannequin: MeshInstance3D = $Mannequin

@onready var sword_visuals: Node3D = $SwordVisuals if has_node("SwordVisuals") else null
@onready var stamina_bar: ProgressBar = $Stamina_bar
@onready var health_bar: ProgressBar = $Health_bar


func accept_model(_model: PlayerModel):
	model = _model
	mannequin.skeleton = _model.skeleton.get_path()

func _process(_delta):
	adjust_weapon_visuals()
	update_resources_interface()

func adjust_weapon_visuals():
	if model and model.active_weapon and sword_visuals:
		sword_visuals.global_transform = model.active_weapon.global_transform

func update_resources_interface():
	if not model.is_enemy:
		stamina_bar.max_value = model.resources.max_stamina
		stamina_bar.value = model.resources.stamina
		
		health_bar.max_value = model.resources.max_health
		health_bar.value = model.resources.health
