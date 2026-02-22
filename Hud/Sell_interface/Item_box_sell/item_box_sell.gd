extends Button


var item_resource: ItemResource
var quantity: int
@onready var description_label: Label = %DescriptionLabel
@onready var button: Button = %Button
@onready var icon_sprite_2d: Sprite2D = %icon_sprite2d
@onready var price: Label = $Control/Price

func _ready() -> void:
	price.text = str(int(item_resource.price)) + "$"
	
func update_item_box(item: ItemResource, button_are_disabled: bool = true):
	icon_sprite_2d.texture = item.sprite
	description_label.text = item.item_name
	description_label.get_parent().visible = false
	item_resource = item
	disabled = button_are_disabled

func _on_mouse_entered() -> void:
	description_label.get_parent().visible = true
func _on_mouse_exited() -> void:
	description_label.get_parent().visible = false

func _on_pressed() -> void:
	sell_current_item()
	
func sell_current_item():
	var price = item_resource.price
	GS.current_coin += price

	Inventory.remove_item_from_list(item_resource)
	Utils.play_sfx("res://Assets/Sound/alexzavesa-clinking-coins-8-468434.mp3", "SFX", -25)
