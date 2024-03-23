extends Area2D

var velocity = 8
var error = 0

# 2s -> 1500      6s -> 3000
var UPos = Vector2(1128, randf_range(1720, 2720))

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_frame(0)
	position = UPos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y -= velocity
	if Input.is_action_just_pressed("cima"):
		if position.y < 760 && position.y > 570:
			$AnimatedSprite2D.set_frame(1)
			$"../".hit_sounds()
			$"../".aumentar_acertos()
			queue_free()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.x += velocity
		position.y += velocity
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
