extends Area3D
class_name InteractionHandler

@export var ItemTypes : Array[ItemData] = []

var nearbyBodies : Array[InteractableItem]

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact")):
		PickupNearestItem()

func PickupNearestItem():
	var nearestItem : InteractableItem = null
	var nearestItemDistance : float = INF
	for item in nearbyBodies:
		if (item.global_position.distance_to(global_position) < nearestItemDistance):
			nearestItemDistance = item.global_position.distance_to(global_position)
			nearestItem = item
	if (nearestItem != null):
		nearestItem.queue_free()
		nearbyBodies.remove_at(nearbyBodies.find(nearestItem))
		var itemPrefab = nearestItem.scene_file_path
		for i in ItemTypes.size():
			if (ItemTypes[i].ItemModelPrefab != null and ItemTypes[i].ItemModelPrefab.resource_path == itemPrefab):
				print("Item id:" + str(i) + " Item Name:" + ItemTypes[i].ItemName)
				return
		
		printerr("No item found dumbfuck")

func OnObjectEnteredArea(body: Node3D):
	if (body is InteractableItem):
		body.gain_focus()
		nearbyBodies.append(body)

func OnObjectExitedArea(body: Node3D):
	if (body is InteractableItem and nearbyBodies.has(body)):
		body.lose_focus()
		nearbyBodies.remove_at(nearbyBodies.find(body))
