extends Control
const ITEM_BOX = preload("uid://2u3f0lq7s83y")
@onready var sell_container: GridContainer = %SellContainer
@onready var buy_container: GridContainer = %BuyContainer

const AXE_SEED = preload("uid://c3sxrr8mi2fet")
const PICKAXE_SEED = preload("uid://cjmng77mi8csb")
const SICKLE_SEED = preload("uid://d0vu6r8b4pqkx")

var buy_list: Array[ItemResource] = [
	AXE_SEED,
	PICKAXE_SEED,
	SICKLE_SEED
]

func _ready() -> void:
	var item_list: Array[ItemResource] = Inventory.get_sellable_item()
	for item in item_list:
		var item_box = ITEM_BOX.instantiate()
		sell_container.add_child(item_box)
		item_box.update_item_box(item.item_name, item.sprite, true)
		

	for item in buy_list:
		var item_box = ITEM_BOX.instantiate()
		buy_container.add_child(item_box)
		item_box.update_item_box(item.item_name, item.sprite, true)
	
