extends Node

func _ready():
	var p = AudioStreamPlayer.new()
	add_child(p)
	p.process_mode = Node.PROCESS_MODE_ALWAYS
	p.bus = "BGM"
	p.stream = load("res://assets/audio/music/mosqit.wav")
	p.play()
