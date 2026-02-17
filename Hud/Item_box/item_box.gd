extends Control
@onready var icon: Sprite2D = $icon
@onready var label: Label = $Label
var description: String
var icon_sprite: Texture2D

func _ready() -> void:
	icon.texture = icon_sprite
	label.visible = false

func _on_button_pressed() -> void:
	print("seell items?")


func _on_button_mouse_entered() -> void:
	label.visible = true


func _on_button_mouse_exited() -> void:
	label.visible = false
