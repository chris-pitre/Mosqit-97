class_name Bullet
extends Area2D

@export_category("Settings")
@export var speed: int = 750
@export var explosion: PackedScene

var is_player_bullet: bool = false

func _physics_process(delta):
	position -= transform.y * speed * delta

func _on_Bullet_body_entered(body):
	if is_player_bullet and body.is_in_group("enemy"):
		var boom = explosion.instantiate()
		body.get_parent().add_child(boom)
		boom.global_position = body.global_position
		boom.global_rotation = randf_range(0, 2 * PI)
		body.queue_free()	
		Global.score_add()
	queue_free()
	


func _on_Bullet_area_entered(area):
	if is_player_bullet and area.is_in_group("enemy"):
		var boom = explosion.instantiate()
		area.get_parent().add_child(boom)
		boom.global_position = area.global_position
		boom.global_rotation = randf_range(0, 2 * PI)
		area.queue_free()	
		Global.score_add()
	queue_free()
