extends Node

var current_coin: int = 500

var current_day: int = 1

signal show_inventory(visibility: bool)
signal show_plant_norm_seed_interface(visibility: bool)
signal show_plant_tree_interface(visibility: bool)
signal show_sell_inteface(visibility: bool)

signal finish_day

func _ready():
	finish_day.connect(_on_finish_day)

func _on_finish_day():
	current_day += 1
	Market.refresh_market()
	print("Nuovo giorno:", current_day)
