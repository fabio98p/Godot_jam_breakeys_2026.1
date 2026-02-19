extends Node
const AXE_SEED = preload("uid://c3sxrr8mi2fet")
const PICKAXE_SEED = preload("uid://cjmng77mi8csb")
const SICKLE_SEED = preload("uid://d0vu6r8b4pqkx")

var item_list: Array[ItemResource] = [
	AXE_SEED,
	PICKAXE_SEED,
	SICKLE_SEED,
]

func get_all_items() -> Array[ItemResource]:
	return item_list

func get_norm_seed() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource]
	for item in item_list:
		if item.type == ItemResource.ItemType.NORM_SEED:
			norm_seed_list.append(item)
	return norm_seed_list
	
func get_tree_seed() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource]
	for item in item_list:
		if item.type == ItemResource.ItemType.TREE_SEED:
			norm_seed_list.append(item)
	return norm_seed_list
	
func get_sellable_item() -> Array[ItemResource]:
	var norm_seed_list: Array[ItemResource]
	for item in item_list:
		if item.type == ItemResource.ItemType.SELLABLE:
			norm_seed_list.append(item)
	return norm_seed_list
