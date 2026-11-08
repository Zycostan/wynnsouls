extends PanelContainer
class_name ItemSlot

@onready var icon: TextureRect = %TextureRect


func display(item: Item):
	icon.texture = item.item_icon
