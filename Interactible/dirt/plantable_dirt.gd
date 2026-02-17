extends Node3D

var item_planted: ItemResource
var dirt_wet: bool = false
@onready var plant_space: Node3D = $plant_space
const PICKAXE = preload("uid://lns2ypu3wmtl")
const AXE_1 = preload("uid://dilgaw6b68pmx")

var models: PackedScene
#@export var models: PackedScene

func _on_area_3d_interact() -> void:
	item_planted = AXE_1
	update_plant()
	if item_planted == null:
		print("plant seed")
	else:
		print("already planted, take it first")

func _ready():
	GS.finish_day.connect(_on_finish_day)
	update_plant()

func _on_finish_day():
	if !dirt_wet:
		if item_planted == null:
			print("lascia perdere")
		else:
			var has_to_grow = item_planted.has_to_grow()
			if has_to_grow:
				item_planted = item_planted.next_grow_state
				update_plant()

func update_plant():
	if item_planted != null:
		models = item_planted.model
		if models != null:
			var model_instance = models.instantiate().duplicate(true)
			clear_plant_space()
			plant_space.add_child(model_instance)
	
	#var model_instance = models.instantiate().duplicate(true)
	#clear_plant_space()
	#plant_space.add_child(model_instance)
	
func clear_plant_space():
	if plant_space and plant_space.get_child_count() > 0:
		plant_space.get_child(0).queue_free()
