extends Control

@onready var black_overlay: ColorRect = $ColorRect
@onready var day_label: Label = $Label

func _ready() -> void:
	black_overlay.modulate.a = 0
	day_label.modulate.a = 0
	GS.sleeping.connect(start_day_transition)
	
func start_day_transition(start_speeing):
	if !start_speeing:
		return
	day_label.text = "DAY: " + str(GS.current_day)
	
	black_overlay.modulate.a = 0
	day_label.modulate.a = 0

	var tween = create_tween()
	
	tween.tween_property(black_overlay, "modulate:a", 1.0, 1.0)
	
	tween.tween_property(day_label, "modulate:a", 1.0, 0.5)

	tween.tween_interval(2.0)

	tween.tween_property(day_label, "modulate:a", 0.0, 0.5)

	tween.tween_property(black_overlay, "modulate:a", 0.0, 1.0)
