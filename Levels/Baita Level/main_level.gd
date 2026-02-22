extends Node3D

@onready var inventory: Control = %Inventory

func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		GS.show_inventory.emit(!inventory.visible)
