extends Control

func _ready():
	Global.update_ui.connect(_update_label)

func _update_label():
	$MarginContainer/MosquitoLabel.text = "mosqits killed: %d" % Global.score
