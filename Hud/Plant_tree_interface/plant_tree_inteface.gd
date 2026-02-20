extends Control
const ITEM_BOX = preload("uid://2u3f0lq7s83y")
@onready var grid_container: GridContainer = %GridContainer
		
func _ready() -> void:
	update_item_list()
	GS.update_all_interface.connect(update_item_list)

func update_item_list():
	var item_list: Array[ItemResource] = Inventory.get_tree_seed()
	for item in item_list:
		var item_box = ITEM_BOX.instantiate()
		grid_container.add_child(item_box)
		item_box.update_item_box(item.item_name, item.sprite, true)
