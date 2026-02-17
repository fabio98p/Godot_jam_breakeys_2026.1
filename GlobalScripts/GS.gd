extends Node

var current_day: int = 1

signal finish_day

func _ready():
	finish_day.connect(_on_finish_day)

func _on_finish_day():
	current_day += 1
	Market.refresh_market()
	print("Nuovo giorno:", current_day)
