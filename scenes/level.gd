extends Node2D

@export var enemy_scene: PackedScene

@onready var enemy_timer: Timer = $MobTimer
@onready var spawn_locations: PathFollow2D = $Path2D/PathFollow2D

func _init():
	Global.its_over.connect(_end_it_all)
	

func _on_mob_timer_timeout():
	enemy_timer.start()
	
	var enemy = enemy_scene.instantiate()
	spawn_locations.progress_ratio = randf()
	enemy.position = spawn_locations.position
	add_child(enemy)

func _end_it_all():
	queue_free()
