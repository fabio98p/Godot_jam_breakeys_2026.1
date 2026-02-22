extends Node3D

@export var seed_to_spawn: ItemResource
var current_seed: ItemResource
var models
@onready var pick_plant: Interactible = $pick_plant
@onready var spawn_area: Node3D = $spawn_area

func _ready():
	GS.finish_day.connect(_on_finish_day)
	#current_seed = seed_to_spawn # is for test
	update_plant()

func _on_finish_day():
	if current_seed == null:
		print("lascia perdere")
	else:
		var has_to_grow = current_seed.has_to_grow()
		if has_to_grow:
			current_seed = current_seed.next_grow_state.duplicate(true)
			update_plant()
				
func spawn_seed():
	current_seed = seed_to_spawn.duplicate(true)
	update_plant()
	
func _on_area_3d_interact() -> void:
	Inventory.add_item_to_list(current_seed)
	current_seed = null
	if spawn_area and spawn_area.get_child_count() > 0:
		spawn_area.get_child(0).queue_free()
	update_plant()
	
func update_plant():
	if current_seed != null:
		models = current_seed.model
		if models != null:
			var model_instance = models.instantiate().duplicate(true)
			clear_plant_space()
			spawn_area.add_child(model_instance)
	
	if current_seed != null and current_seed.type == ItemResource.ItemType.SELLABLE:
		pick_plant.get_child(0).set_deferred("disabled", false)
	else:
		pick_plant.get_child(0).set_deferred("disabled", true)

func clear_plant_space():
	if spawn_area and spawn_area.get_child_count() > 0:
		spawn_area.get_child(0).queue_free()
