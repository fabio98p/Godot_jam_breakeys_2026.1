extends Node3D

var item_planted: ItemResource

func _on_area_3d_interact() -> void:
	if item_planted == null:
		print("plant seed")
	else:
		print("already planted, take it first")
