extends Control
@onready var option_menu: PanelContainer = $Option_menu

func _on_start_pressed() -> void:
	Utils.play_sfx("res://Assets/Sound/SFX/Jump.mp3", "SFX", 0)
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
	
func _on_option_pressed() -> void:
	Utils.play_sfx("res://Assets/Sound/SFX/Jump.mp3", "SFX", 0)
	option_menu.visible = true

func _on_credits_pressed() -> void:
	Utils.play_sfx("res://Assets/Sound/SFX/Jump.mp3", "SFX", 0)
	print("start credits")

func _on_exit_pressed() -> void:
	get_tree().quit()
