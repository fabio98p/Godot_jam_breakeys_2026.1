extends Node3D

var item_planted: ItemResource
var dirt_wet: bool = false

func _on_area_3d_interact() -> void:
	if item_planted == null:
		print("plant seed")
	else:
		print("already planted, take it first")

func _ready():
	GS.finish_day.connect(_on_finish_day)

func _on_finish_day():
	if !dirt_wet:
		if item_planted == null:
			print("lascia perdere")
		else:
			print("cresce pianta di tot") #itemplantet 
