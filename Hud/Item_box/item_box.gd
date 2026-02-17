extends Control
@onready var icon_sprite_2d: Sprite2D = $icon_sprite2d
@onready var description_label: Label = $DescriptionLabel
@onready var button: Button = $Button

func update_item_box(desc: String, icon_sprite: Texture2D, button_are_disabled: bool = true):
	icon_sprite_2d.texture = icon_sprite
	description_label.text = desc
	description_label.visible = false
	
	button.disabled = button_are_disabled
	
	

func _on_button_pressed() -> void:
	print("seell items?")

func _on_button_mouse_entered() -> void:
	description_label.visible = true

func _on_button_mouse_exited() -> void:
	description_label.visible = false
