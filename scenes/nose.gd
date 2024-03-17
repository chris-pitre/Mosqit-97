class_name Nose
extends Area2D

@export var explosion: PackedScene
var enabled: bool = false

func _on_Nose_area_entered(area):
	if enabled and area.is_in_group("enemy"):
		var boom = explosion.instantiate()
		area.get_parent().add_child(boom)
		boom.global_position = area.global_position
		boom.global_rotation = randf_range(0, 2 * PI)
		area.queue_free()	
		Global.score_add()
