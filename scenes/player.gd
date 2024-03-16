class_name Player
extends CharacterBody2D

@export_category("References")
@export var anim: AnimatedSprite2D
@export var bullet: PackedScene

@export_category("Settings")
@export var speed: int = 200

var input: Vector2 = Vector2.ZERO

func _physics_process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input.x >= 1:
		anim.flip_h = true
	else:
		anim.flip_h = false
	
	if input == Vector2.ZERO:
		anim.play("idle_down")
	elif input.y < 0:
		anim.play("idle_up")
	else:
		anim.play("run")
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	velocity = input * speed
	
	move_and_slide()

func shoot():
	var b = bullet.instantiate()
	get_parent().add_child(b)
	b.is_player_bullet = true
	b.global_position = global_position
