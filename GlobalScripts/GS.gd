extends Node

var current_coin: int = 500

var current_day: int = 1

var bucket_full = false

var inventory_is_open = false

signal show_inventory(visibility: bool)
signal show_plant_norm_seed_interface(visibility: bool, dirt: Node)
signal show_plant_tree_interface(visibility: bool, dirt: Node,ciao:Node)
signal show_sell_inteface(visibility: bool)

signal update_all_interface
signal finish_day

func _ready():
	finish_day.connect(_on_finish_day)
	show_inventory.connect(change_mouse_state)
	show_plant_norm_seed_interface.connect(change_mouse_state)
	show_plant_tree_interface.connect(change_mouse_state)
	show_sell_inteface.connect(change_mouse_state)

func _on_finish_day():
	current_day += 1
	Market.refresh_market()
	print("Nuovo giorno:", current_day)



func change_mouse_state(state: bool, dirt = ""):
	if state:
		# MODALITÀ MENU
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		inventory_is_open = true
	else:
		# MODALITÀ GIOCO
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		inventory_is_open = false
