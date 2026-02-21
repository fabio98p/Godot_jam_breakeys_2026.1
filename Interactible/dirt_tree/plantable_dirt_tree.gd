extends Node3D

var item_planted: ItemResource
var dirt_wet: bool = false
@onready var plant_space: Node3D = $plant_space

@onready var plant_plant: Area3D = %plant_plant

var models

func plant_seed(seed: ItemResource):
	item_planted = seed
	update_plant()

func _ready():
	GS.finish_day.connect(_on_finish_day)
	update_plant()

func _on_finish_day():
	if !dirt_wet:
		if item_planted == null:
			print("lascia perdere")
		else:
			print("cresci bastatdo")
			var has_to_grow = item_planted.has_to_grow()
			if has_to_grow:
				item_planted = item_planted.next_grow_state
				update_plant()

func update_plant():
	if item_planted == null:
		return

	var template = item_planted.model
	
	if template == null:
		template = load(item_planted.model_path)

	if template != null:
		var model_instance
		
		if template is PackedScene:
			model_instance = template.instantiate()
		elif template is Node3D:
			model_instance = template.duplicate()
		
		if model_instance:
			clear_plant_space()
			plant_space.add_child(model_instance)
			
	if item_planted == null:
		plant_plant.get_child(0).set_deferred("disabled", false)
	else:
		plant_plant.get_child(0).set_deferred("disabled", true)
	
func clear_plant_space():
	if plant_space and plant_space.get_child_count() > 0:
		plant_space.get_child(0).queue_free()

func _on_plant_plant_interact() -> void:
	if item_planted == null:
		GS.show_plant_tree_interface.emit(true, self)
	else:
		print("already planted, take it first")
	update_plant()
