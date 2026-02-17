extends Node3D

@onready var inventory: Control = %Inventory
@onready var plant_norm_seed_inteface: Control = $CanvasLayer/Plant_norm_seed_inteface
@onready var plant_tree_inteface: Control = $CanvasLayer/plant_tree_inteface
@onready var sell_inteface: Control = $CanvasLayer/sell_inteface

func _ready() -> void:
	GS.show_inventory.connect(show_inventory)
	GS.show_plant_norm_seed_interface.connect(show_plant_norm_seed_interface)
	GS.show_plant_tree_interface.connect(show_plant_tree_interface)
	GS.show_sell_inteface.connect(show_sell_inteface)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		GS.show_inventory.emit(!inventory.visible)

func show_inventory(visibility):
	inventory.visible = visibility

func show_plant_norm_seed_interface(visibility):
	plant_norm_seed_inteface.visible = visibility

func show_plant_tree_interface(visibility):
	plant_tree_inteface.visible = visibility
	
func show_sell_inteface(visibility):
	sell_inteface.visible = visibility
