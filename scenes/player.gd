class_name Player
extends CharacterBody2D

@export_category("References")
@export var anim: AnimatedSprite2D
@export var bullet: PackedScene
@export var noseN: Nose

static var speed: int
static var num_shots: int
static var dash: bool
static var nose: bool

var dashing: bool = false

var input: Vector2 = Vector2.ZERO

func _init():
	Global.grow_nose.connect(_grow_nose)

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
	
	if dash and not dashing and Input.is_action_just_pressed("dash"):
		dashing = true
		velocity *= 3
		await get_tree().create_timer(0.25).timeout
		dashing = false
	
	if not dashing:
		velocity = input * speed
	
	move_and_slide()

func shoot():
	for i in range(num_shots):
		var b = bullet.instantiate()
		get_parent().add_child(b)
		b.is_player_bullet = true
		b.global_position = global_position
		await get_tree().create_timer(0.1).timeout

func _grow_nose():
	noseN.show()
	noseN.enabled = true
