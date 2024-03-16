class_name Enemy
extends CharacterBody2D

@export var speed: int = 75.0

func _physics_process(delta):
	velocity.y = speed

	move_and_slide()
