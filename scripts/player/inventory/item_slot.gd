extends PanelContainer
class_name ItemSlot

signal activated(item: Item)

@onready var icon: TextureRect = %TextureRect
var item : Item

func display(_item: Item):
	item = _item
	icon.texture = item.item_icon if item else null

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		activated.emit(item)
