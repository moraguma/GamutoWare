extends Area2D

var velocity = 8
var error = 0

# 2s -> 1500      6s -> 3000
var RPos = Vector2(randf_range(2280, 3280), 440)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_frame(0)
	var hit = $Area2D
	position = RPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= velocity
	if Input.is_action_just_pressed("direita"):
		if position.x < 1200 && position.x > 960:
			$AnimatedSprite2D.set_frame(1)
			$"../".hit_sounds()
			$"../".aumentar_acertos()
			queue_free()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.y += velocity
		position.x += velocity
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
