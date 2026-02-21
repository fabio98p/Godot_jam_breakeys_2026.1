extends Button


var item_resource: ItemResource
@onready var description_label: Label = %DescriptionLabel
@onready var button: Button = %Button
@onready var icon_sprite_2d: Sprite2D = %icon_sprite2d

func _ready() -> void:
	pressed.connect(run_custom_signal)
	
func run_custom_signal():
	get_parent().get_parent().get_parent().get_parent().get_parent().plant_selected_seed(item_resource)
	GS.show_plant_norm_seed_interface.emit(false, "")
	GS.show_plant_tree_interface.emit(false, "")
	
func update_item_box(item: ItemResource, button_are_disabled: bool = true):
	icon_sprite_2d.texture = item.sprite
	description_label.text = item.item_name
	description_label.visible = false
	item_resource = item
	disabled = button_are_disabled

func _on_mouse_entered() -> void:
	description_label.visible = true
func _on_mouse_exited() -> void:
	description_label.visible = false
