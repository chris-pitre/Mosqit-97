extends Node

var p: AudioStreamPlayer

func _ready():
	p = AudioStreamPlayer.new()
	add_child(p)
	p.process_mode = Node.PROCESS_MODE_ALWAYS
	p.bus = "BGM"
	p.stream = load("res://assets/audio/music/mosqit.wav")
	p.play()
	
	Global.its_over.connect(_scary)
	
func _scary():
	p.pitch_scale = 0.25
	
