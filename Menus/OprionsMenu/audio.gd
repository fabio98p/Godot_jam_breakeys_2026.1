extends Control

@onready var master_h_slider: HSlider = %MasterHSlider
@onready var music_h_slider: HSlider = %MusicHSlider
@onready var sfx_h_slider: HSlider = %SFXHSlider

var master_bus_index := 0
var music_bus_index := 0
var sfx_bus_index := 0

func _ready():
	master_bus_index = AudioServer.get_bus_index("Master")
	music_bus_index = AudioServer.get_bus_index("Music")
	sfx_bus_index = AudioServer.get_bus_index("SFX")

	# Set initial value with actual value using linear
	master_h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus_index)) * 100.0
	music_h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus_index)) * 100.0
	sfx_h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus_index)) * 100.0

	master_h_slider.connect("value_changed", Callable(self, "_on_master_volume_changed"))
	music_h_slider.connect("value_changed", Callable(self, "_on_music_volume_changed"))
	sfx_h_slider.connect("value_changed", Callable(self, "_on_sfx_volume_changed"))

func _on_master_volume_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(master_bus_index, db)

func _on_music_volume_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(music_bus_index, db)

func _on_sfx_volume_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(sfx_bus_index, db)
