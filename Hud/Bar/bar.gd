extends Node2D

@onready var hp_bar: Sprite2D = $HpBar
@onready var hp_label: Label = $HpLabel

var bar_max_value: float = 100

func set_hp_bar_percentage(hp_value_parcentage: float, show_label:bool = true):
	# manage label
	if show_label:
		hp_label.text = str(int(hp_value_parcentage)) 
	else:
		hp_label.text = ""

	# manage bar
	var bar_tween = get_tree().create_tween()
	bar_tween.tween_property(hp_bar, "scale", Vector2(hp_value_parcentage/100*4,1), 0.5)
	bar_tween.parallel().tween_property(hp_bar,"position",Vector2(hp_value_parcentage/100*64,16),0.5)
