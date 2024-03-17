extends Control

@export var label: Label
@export var buttons: HBoxContainer

func _on_live_pressed():
	label.text = "YOU ARE SELFISH"
	buttons.hide()

func _on_sacrifice_pressed():
	label.text = "YOU ARE NOBLE"
	buttons.hide()
