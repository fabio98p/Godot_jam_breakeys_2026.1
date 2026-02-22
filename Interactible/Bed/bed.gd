extends Node3D
@onready var area_3d: Area3D = $Area3D

func _ready() -> void:
	GS.sleeping.connect(sleeping)

func _on_area_3d_interact() -> void:
	GS.finish_day.emit()
	await get_tree().create_timer(1).timeout
	Utils.play_sfx("res://Assets/Sound/universfield-owl-144750.mp3", "SFX", -25)

func sleeping(sleeping_state):
	area_3d.get_child(0).set_deferred("disabled", sleeping_state)
