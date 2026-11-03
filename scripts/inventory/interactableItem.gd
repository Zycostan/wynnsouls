extends Node3D
class_name InteractableItem

@export var ItemHighlightMesh : MeshInstance3D

func gain_focus():
	ItemHighlightMesh.visible = true

func lose_focus():
	ItemHighlightMesh.visible = false
