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

func upgrade_strenght():
	player.model.resources.strength += 5

func degrade_strength():
	player.model.resources.strength -= 5

func _on_remove_stat_point_h_pressed() -> void:
	degrade_health()


func _on_add_statpoint_h_pressed() -> void:
	upgrade_health()


func _on_remove_stat_point_st_pressed() -> void:
	degrade_stamina()


func _on_add_statpoint_st_pressed() -> void:
	upgrade_stamina()


func _on_remove_strength_point_pressed() -> void:
	degrade_strength()


func _on_add_strength_point_pressed() -> void:
	upgrade_strenght()

# Alas, poor Yorick! I knew him, Horatio; a fellow of infinite jest,
# of most excellent fancy; he hath borne me on his back a thousand times;
# and now, how abhorred in my imagination it is! My gorge rises at it.
# Here hung those lips that I have kissed I know not how oft. 
# Where be your gibes now? Your gambols? Your songs?
# Your flashes of merriment, that were wont to set the table on a roar?
# (Hamlet, V.i)
