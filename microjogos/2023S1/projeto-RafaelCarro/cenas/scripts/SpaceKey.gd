extends Area2D

var velocity = 8
var error = 0

# 2s -> 1500      6s -> 3000
var SPos = Vector2(960, randf_range(-1000, -2000))

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = 1
	$AnimatedSprite2D.set_frame(0)
	position = SPos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y += velocity
	if Input.is_action_just_pressed("acao"):
		if position.y < 1100 && position.y > 900:
			$AnimatedSprite2D.set_frame(1)
			$"../".hit_sounds()
			$"../".aumentar_acertos()
			queue_free()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.y -= 2 * velocity
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
