extends Control
const ITEM_BOX_SELL = preload("uid://crhumpled6lle")
const ITEM_BOX_BUY = preload("uid://diyu4ckw7jjns")
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
	GS.show_sell_inteface.connect(show_sell_inteface)
	update_item_list()
	GS.update_all_interface.connect(update_item_list)

func update_item_list():
	var item_list: Array[ItemResource] = Inventory.get_sellable_item()
	
	for item_box in sell_container.get_children():
		item_box.queue_free()
	for item_box in buy_container.get_children():
		item_box.queue_free()
	
	for item in item_list:
		var item_box = ITEM_BOX_SELL.instantiate()
		item_box.item_resource = item
		sell_container.add_child(item_box)
		item_box.update_item_box(item, false)

	for item in buy_list:
		var item_box = ITEM_BOX_BUY.instantiate()
		item_box.item_resource = item
		buy_container.add_child(item_box)
		item_box.update_item_box(item, false)

func show_sell_inteface(state):
	visible = state

func _on_exit_button_pressed() -> void:
	GS.show_sell_inteface.emit(false)
