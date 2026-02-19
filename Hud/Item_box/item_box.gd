extends Control
@onready var description_label: Label = %DescriptionLabel
@onready var button: Button = %Button
@onready var icon_sprite_2d: Sprite2D = %icon_sprite2d

func update_item_box(item: ItemResource, button_are_disabled: bool = true):
	icon_sprite_2d.texture = item.sprite
	description_label.text = item.item_name
	description_label.visible = false
	button.item_resource = item
	button.disabled = button_are_disabled

func _on_button_mouse_entered() -> void:
	description_label.visible = true

func _on_button_mouse_exited() -> void:
	description_label.visible = false

func _on_button_pressed_and_return_item(item: ItemResource) -> void:
	get_parent().get_parent().get_parent().get_parent().get_parent().plant_selected_seed(item)
	GS.show_plant_norm_seed_interface.emit(false, "")
