extends Node

const AXE_SEED = preload("uid://c3sxrr8mi2fet")
const KATANA_SEED = preload("uid://cpmi81apb3yss")
const PICKAXE_SEED = preload("uid://cjmng77mi8csb")
const SHOVEL_SEED = preload("uid://ilibyovo7k4g")
const SICKLE_SEED = preload("uid://d0vu6r8b4pqkx")
const TREE_SAW_SEED = preload("uid://c1ll1afhttoq7")
const TREE_TNT_SEED = preload("uid://cvjagbtpolvr4")

var item_list: Array[ItemResource] = [
]

func _process(delta: float) -> void:
	pass
	#print(item_list.size())
	
func get_all_items() -> Array[ItemResource]:
	return item_list

func get_norm_seed() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource] = []
	for item in item_list:
		if item.type == ItemResource.ItemType.NORM_SEED:
			norm_seed_list.append(item)
	return norm_seed_list
	
func get_tree_seed() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource] = []
	for item in item_list:
		if item.type == ItemResource.ItemType.TREE_SEED:
			norm_seed_list.append(item)
	return norm_seed_list
	
func get_sellable_item() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource] = []
	for item in item_list:
		if item.type == ItemResource.ItemType.SELLABLE:
			norm_seed_list.append(item)
	return norm_seed_list

func remove_item_from_list(item_to_remove: ItemResource):
	for item in item_list:
		if item.item_name == item_to_remove.item_name:
			Inventory.item_list.remove_at(Inventory.item_list.find(item))
			break
	GS.update_all_interface.emit()

func add_item_to_list(item: ItemResource):
	item_list.append(item)
	GS.update_all_interface.emit()
