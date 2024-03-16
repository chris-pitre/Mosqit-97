extends AnimatedSprite2D

var index = 0
var playing = true

func _ready():
	play("title")
	await fade_in()
	playing = false

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot") and not playing:
		play_next()

func fade_in():
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	await tween.tween_property(self, "modulate:a", 1, 1).finished

func fade_out():
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	await tween.tween_property(self, "modulate:a", 0, 1).finished

func play_next():
	playing = true
	await fade_out()
	match index:
		0:
			index += 1
			play("1")
			await fade_in()
		1:
			index += 1
			play("2")
			await fade_in()
		2:
			index += 1
			play("3")
			await fade_in()
		3:
			index += 1
			play("4")
			await fade_in()
		4:
			index = 0
			play("title")
	playing = false
