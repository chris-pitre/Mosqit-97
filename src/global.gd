extends Node

signal update_ui

var score = 0

func score_add():
	score += 1
	update_ui.emit()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
