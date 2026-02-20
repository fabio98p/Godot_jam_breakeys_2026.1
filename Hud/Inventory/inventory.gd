extends Control
const ITEM_BOX = preload("uid://2u3f0lq7s83y")
@onready var grid_container: GridContainer = %GridContainer

func _ready() -> void:
	GS.show_sell_inteface.connect(show_sell_inteface)
	update_item_list()
	GS.update_all_interface.connect(update_item_list)

func update_item_list():
	var item_list: Array[ItemResource] = Inventory.get_all_items()
	
	for item_box in grid_container.get_children():
		item_box.queue_free()
		
	for item in item_list:
		var item_box = ITEM_BOX.instantiate()
		grid_container.add_child(item_box)
		item_box.update_item_box(item, true)

func show_sell_inteface(state):
	visible = state
