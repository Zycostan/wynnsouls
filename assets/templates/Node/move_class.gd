extends Move
class_name NewMove ## change this

# redefining override parameters
func _ready() -> void:
	animation = "animation" ## change this

#implement check
func check_relevance(input: InputPackage) -> String:
	return "change this"

# implement update function
func update(input: InputPackage, delta: float):
	pass

# delete these comments and pretend you know what you're doing by reading them
