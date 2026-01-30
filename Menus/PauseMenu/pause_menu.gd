extends PanelContainer

var is_in_pause = false
@onready var option_menu: PanelContainer = $Option_menu

# TODO: da cambiare la gestione dello screensize
func _ready() -> void:
	option_menu.custom_minimum_size = DisplayServer.window_get_size()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_menu"):
		if is_in_pause:
			return_to_game()
		else:
			pause_game()
			
func return_to_game():
	visible = false
	get_tree().paused = false
	option_menu.visible = false
	is_in_pause = false
	
func pause_game():
	visible = true
	get_tree().paused = true
	is_in_pause = true


func _on_return_to_game_button_pressed() -> void:
	return_to_game()

func _on_option_button_pressed() -> void:
	option_menu.visible = true

func _on_return_to_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/MainMenu/main_menu.tscn")
