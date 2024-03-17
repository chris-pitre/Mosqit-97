class_name Downgrade
extends MarginContainer

@export_category("Settings")
@export var downgrade_resource: DowngradeResource

@onready var button: Button = $Button

func _ready():
	button.text = downgrade_resource.name

func _on_button_pressed():
	Global.change_player_stats(downgrade_resource)
	button.disabled = true
	UI.humanity -= 25
	Global.hide_menu.emit()
	Global.downgrades += 1
