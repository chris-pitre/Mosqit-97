class_name DowngradeResource
extends Resource

@export var name: String
@export var speed: int
@export var num_shots: int
@export var dash: bool
@export var nose: bool

func _init(p_name = "Default", p_speed = 0, p_num_shots = 0, p_dash = false, p_nose = false):
	name = p_name
	speed = p_speed
	num_shots = p_num_shots
	dash = p_dash
	nose = p_nose
