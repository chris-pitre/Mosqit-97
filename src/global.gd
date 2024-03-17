extends Node

signal update_ui
signal player_stats
signal hide_menu
signal show_menu

signal grow_nose

var score = 0
var downgrades = 0

var player_speed: int = 200
var player_num_shots: int = 2
var player_dash: bool = false
var player_nose: bool = false

func _init():
	player_default()

func score_add():
	score += 1
	update_ui.emit()
	if score != 0 and score % 100 == 0 and downgrades < 4:
		show_menu.emit()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func player_default():
	Player.speed = player_speed
	Player.num_shots = player_num_shots
	Player.dash = player_dash
	Player.nose = player_nose
	
func change_player_stats(downgrade: DowngradeResource):
	Player.speed += downgrade.speed
	Player.num_shots += downgrade.num_shots
	Player.dash = downgrade.dash
	Player.nose = downgrade.nose
	if downgrade.nose:
		grow_nose.emit()
