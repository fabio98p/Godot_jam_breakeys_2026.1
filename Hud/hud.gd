extends Control

@onready var bar: Node2D = $Bar

func _ready() -> void:
	bar.set_hp_bar_percentage(100, false)
	await get_tree().create_timer(1).timeout
	bar.set_hp_bar_percentage(50, false)
	await get_tree().create_timer(1).timeout
	bar.set_hp_bar_percentage(10, false)
	await get_tree().create_timer(1).timeout
	bar.set_hp_bar_percentage(0, false)
	
