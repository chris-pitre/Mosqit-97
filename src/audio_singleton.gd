extends Node

func _ready():
	var p = AudioStreamPlayer.new()
	add_child(p)
	p.bus = "BGM"
	p.stream = load("res://assets/audio/music/mosqit.wav")
	p.play()
