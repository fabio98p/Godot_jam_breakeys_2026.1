extends Node3D

var item_planted: ItemResource
var dirt_wet: bool = false
@onready var plant_space: Node3D = $plant_space

@onready var put_water: Interactible = $put_water
@onready var plant_plant: Area3D = %plant_plant
@onready var pick_plant: Interactible = %pick_plant

@onready var zollasecca: Node3D = $zollasecca
@onready var zollabagnata: Node3D = $zollabagnata

var models: PackedScene

func plant_seed(seed: ItemResource):
	item_planted = seed
	update_plant()

func _ready():
	GS.finish_day.connect(_on_finish_day)
	update_plant()
	
func _process(delta: float) -> void:
	update_zolla()
	
func _on_finish_day():
	if dirt_wet:
		if item_planted == null:
			print("lascia perdere")
		else:
			var has_to_grow = item_planted.has_to_grow()
			if has_to_grow:
				item_planted = item_planted.next_grow_state
				update_plant()
	dirt_wet = false
	update_zolla()
	
func update_plant():
	if item_planted != null:
		models = item_planted.model
		if models != null:
			var model_instance = models.instantiate().duplicate(true)
			clear_plant_space()
			plant_space.add_child(model_instance)
	
	if item_planted == null:
		plant_plant.get_child(0).set_deferred("disabled", false)
		pick_plant.get_child(0).set_deferred("disabled", true)
	else:
		if item_planted.type == ItemResource.ItemType.SELLABLE:
			plant_plant.get_child(0).set_deferred("disabled", true)
			pick_plant.get_child(0).set_deferred("disabled", false)
		else:
			plant_plant.get_child(0).set_deferred("disabled", true)
			pick_plant.get_child(0).set_deferred("disabled", true)
	#var model_instance = models.instantiate().duplicate(true)
	#clear_plant_space()
	#plant_space.add_child(model_instance)
	
func clear_plant_space():
	if plant_space and plant_space.get_child_count() > 0:
		plant_space.get_child(0).queue_free()

func update_zolla():
	if dirt_wet:
		zollasecca.visible = false
		zollabagnata.visible = true
	else: 
		zollasecca.visible = true
		zollabagnata.visible = false
	
	if !dirt_wet and GS.bucket_full:
		put_water.get_child(0).set_deferred("disabled", false)
	else:
		put_water.get_child(0).set_deferred("disabled", true)
		
func _on_pick_plant_interact() -> void:
	Inventory.add_item_to_list(item_planted)
	item_planted = null
	models = null
	clear_plant_space()
	update_plant()

func _on_plant_plant_interact() -> void:
	if item_planted == null:
		GS.show_plant_norm_seed_interface.emit(true, self)
	else:
		print("already planted, take it first")
	update_plant()


func _on_put_water_interact() -> void:
	dirt_wet = true
	GS.bucket_full = false
