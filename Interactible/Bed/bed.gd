extends Node3D

func _on_area_3d_interact() -> void:
	GS.finish_day.emit()
