extends Button

signal pressed_and_return_item(item: ItemResource)

var item_resource: ItemResource

func _ready() -> void:
	pressed.connect(run_custom_signal)


func run_custom_signal():
	pressed_and_return_item.emit(item_resource)
