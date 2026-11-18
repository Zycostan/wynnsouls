extends PanelContainer
class_name ItemSlot

signal activated(item: Item)

@onready var icon: TextureRect = %TextureRect
var item : Item

func display(_item: Item, is_equipped: bool = false):
	item = _item
	icon.texture = item.item_icon if item else null
	
	if is_equipped:
		modulate = Color(0.455, 0.455, 0.863, 0.557)
	else:
		modulate = Color.WHITE
	

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		activated.emit(item)
