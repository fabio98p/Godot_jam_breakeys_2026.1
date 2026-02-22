extends Node3D


func _on_area_3d_interact() -> void:
	GS.bucket_full = true
	Utils.play_sfx("res://Assets/Sound/universfield-splash-effect-229315.mp3", "SFX", -25)
