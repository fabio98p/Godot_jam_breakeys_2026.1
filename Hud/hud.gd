extends Control

@onready var number_of_day: Label = $MarginContainer/VBoxContainer/HBoxContainer/number_of_day
@onready var number_of_coins: Label = $MarginContainer/VBoxContainer/HBoxContainer2/number_of_coins


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	number_of_day.text = str(GS.current_day)
	number_of_coins.text = str(GS.current_coin)
