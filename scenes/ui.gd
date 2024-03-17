class_name UI
extends Control

@export var downgrade_menu: Control
@export var bar: ProgressBar

static var humanity: int = 100

func _ready():
	Global.update_ui.connect(_update_label)
	Global.show_menu.connect(_show_menu)
	Global.hide_menu.connect(_hide_menu)

func _update_label():
	$MarginContainer/MosquitoLabel.text = "mosqits killed: %d" % Global.score

func _process(delta):
	bar.value = humanity
	
func _show_menu():
	get_tree().paused = true
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	await tween.tween_property(downgrade_menu, "position:x", 0, 1.0).finished

func _hide_menu():
	var tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.set_trans(Tween.TRANS_EXPO)
	await tween.tween_property(downgrade_menu, "position:x", 512, 1.0).finished
	get_tree().paused = false
