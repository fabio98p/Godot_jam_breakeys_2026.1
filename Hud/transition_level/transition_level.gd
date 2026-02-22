extends Control

@onready var black_overlay: ColorRect = $ColorRect

func _ready() -> void:
	black_overlay.modulate.a = 1
	GS.init_level.connect(start_day_transition)
	
func start_day_transition(start_speeing):
	if !start_speeing:
		return

	await get_tree().create_timer(0.5).timeout
	black_overlay.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(black_overlay, "modulate:a", 0, 1.0)
