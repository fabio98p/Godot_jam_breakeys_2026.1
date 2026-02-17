@tool
extends Resource
class_name ItemResource

enum ItemType {
	NORM_SEED,
	TREE_SEED,
	SELLABLE
}

@export var item_name: String
@export var price: float
@export var type: ItemType
@export var model: PackedScene
@export var sprite: Texture2D
@export var takeable_from_dirt: bool = false
@export var can_grow: bool = false:
	set(value):
		can_grow = value
		notify_property_list_changed()

var next_grow_state: ItemResource
var day_grow_left: int

func _get_property_list() -> Array:
	var properties = []
	
	if can_grow:
		properties.append({
			"name": "next_grow_state",
			"type": TYPE_OBJECT,
			"hint": PROPERTY_HINT_RESOURCE_TYPE,
			"hint_string": "ItemResource",
			"usage": PROPERTY_USAGE_DEFAULT
		})
		properties.append({
			"name": "day_grow_state",
			"type": TYPE_INT,
			"usage": PROPERTY_USAGE_DEFAULT,
		})
	
	return properties


func has_to_grow():
	if can_grow:
		if day_grow_left <= 1:
			return true
		else:
			day_grow_left -= 1
	return false
