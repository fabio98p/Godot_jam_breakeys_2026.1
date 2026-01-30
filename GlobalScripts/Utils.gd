extends Node

func play_sfx(path: String, bus: String = "Master", volume: float = 0) -> void:
	var audioStreamPlayer := AudioStreamPlayer.new()
	add_child(audioStreamPlayer)

	# setup and istanziate the audioStreamPlayer
	audioStreamPlayer.stream = load(path)
	audioStreamPlayer.bus = bus
	audioStreamPlayer.volume_db = volume
	audioStreamPlayer.play()

	# remove audioStramPlayer after the end of the sound
	audioStreamPlayer.finished.connect(audioStreamPlayer.queue_free)
