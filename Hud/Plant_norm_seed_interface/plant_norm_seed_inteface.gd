extends Control
const ITEM_BOX = preload("uid://2u3f0lq7s83y")
@onready var grid_container: GridContainer = %GridContainer

var selected_dirt: Node

func _ready() -> void:
	GS.show_plant_norm_seed_interface.connect(show_plant_norm_seed_interface)
	var item_list: Array[ItemResource] = Inventory.get_norm_seed()
	for item in item_list:
		var item_box = ITEM_BOX.instantiate()
		grid_container.add_child(item_box)
		item_box.update_item_box(item.item_name, item.sprite, false)
		
func _on_exit_button_pressed() -> void:
	GS.show_plant_norm_seed_interface.emit(false, self)

func show_plant_norm_seed_interface(state, dirt):
	visible = state
	selected_dirt = dirt

func plant_selected_seed(seed: ItemResource):
	selected_dirt.plant_seed(seed)
