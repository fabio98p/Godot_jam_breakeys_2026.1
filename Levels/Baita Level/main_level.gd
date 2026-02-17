extends Node3D
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		print("inventario")
		if canvas_layer.visible == true:
			canvas_layer.visible = false
		elif canvas_layer.visible == false:
			canvas_layer.visible = true
