extends Node

var item_list: Array[ItemResource] = [
	preload("uid://lns2ypu3wmtl"),
	preload("uid://lns2ypu3wmtl"),
	preload("uid://cjmng77mi8csb"),
	preload("uid://cjmng77mi8csb")
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
