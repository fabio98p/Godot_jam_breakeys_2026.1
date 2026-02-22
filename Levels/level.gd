extends Node3D

func _ready() -> void:
	GS.init_level_func()
	Utils.play_sfx("res://Assets/Sound/alphaproxy-chillhop-mix-136000.mp3", "Music",-25)
