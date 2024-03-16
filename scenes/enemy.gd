class_name Enemy
extends StaticBody2D

var speed: int = 2.0
var horizontal_move_factor_in_which_they_move_horizontally_variably: float = 0

@export var tex_1: Texture2D
@export var tex_2: Texture2D

func _ready():
	var rand_bool = randf() > 0.5
	$Sprite2D.texture = tex_1 if rand_bool else tex_2
	speed += randf_range(-1.0, 1.0)
	horizontal_move_factor_in_which_they_move_horizontally_variably = randf_range(-8.0, 8.0)

func _physics_process(delta):
	position.y += speed
	position.x += horizontal_move_factor_in_which_they_move_horizontally_variably * sin(Time.get_ticks_usec())
	
	if position.x > 448:
		queue_free()
