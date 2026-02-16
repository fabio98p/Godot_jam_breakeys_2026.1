extends RayCast3D
@onready var label: Label = $Label
func _ready() -> void:
	label.text= ""
func _process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider is Interactible:
			label.text = collider.int_name
			if Input.is_action_just_pressed("interaction"):
				collider.interact.emit()
	else:
		label.text = ""
