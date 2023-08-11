extends Area2D

var velocity = 8
var error = 0

# 2s -> 1500      4s -> 3000
var DPos = Vector2(776, randf_range(-1000, -2000))

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_frame(0)
	position = DPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y += velocity
	if Input.is_action_just_pressed("baixo"):
		if position.y < 760 && position.y > 600:
			$AnimatedSprite2D.set_frame(1)
			$"../".hit_sounds()
			$"../".aumentar_acertos()
			queue_free()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.x -= velocity
		position.y -= velocity
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
