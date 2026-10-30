extends Node3D
class_name PlayerVisuals

@onready var model : PlayerModel
@onready var mannequin: MeshInstance3D = $Mannequin

@onready var sword_visuals: Node3D = $SwordVisuals
@onready var stamina_bar: Label = $Stamina_bar
@onready var health_bar: Label = $Health_bar


func accept_model(_model: PlayerModel):
	model = _model
	mannequin.skeleton = _model.skeleton.get_path()

func _process(_delta):
	adjust_weapon_visuals()
	update_resources_interface()

func adjust_weapon_visuals():
	sword_visuals.global_transform = model.active_weapon.global_transform

func update_resources_interface():
	if not model.is_enemy:
		stamina_bar.text = "Stamina " + "%10.3f" % model.resources.stamina
		health_bar.text = "Health " + "%10.3f" % model.resources.health
