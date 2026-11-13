extends PanelContainer
class_name StatusDialog

@export var player : Player

func upgrade_health():
	player.model.resources.max_health += 10

func degrade_health():
	player.model.resources.max_health -= 10

func upgrade_stamina():
	player.model.resources.max_stamina += 10

func degrade_stamina():
	player.model.resources.max_stamina -= 10


func _on_remove_stat_point_h_pressed() -> void:
	degrade_health()


func _on_add_statpoint_h_pressed() -> void:
	upgrade_health()


func _on_remove_stat_point_st_pressed() -> void:
	degrade_stamina()


func _on_add_statpoint_st_pressed() -> void:
	upgrade_stamina()
