extends Button


var item_resource: ItemResource
@onready var description_label: Label = %DescriptionLabel
@onready var button: Button = %Button
@onready var icon_sprite_2d: Sprite2D = %icon_sprite2d
@onready var price: Label = %Price

func _ready() -> void:
	price.text = str(int(item_resource.price)) + "$"
	
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

func _on_pressed() -> void:
	buy_current_item()

func buy_current_item():
	var price = item_resource.price
	GS.current_coin -= price
	Inventory.add_item_to_list(item_resource)
