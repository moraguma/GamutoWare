extends Area2D

var velocity = 500
var error = 0


const TOLERANCE = 100


@export var aim_pos: Vector2
@export var incoming_dir: Vector2
@export var action: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_frame(0)


func set_time_to_hit(t):
	position = aim_pos - incoming_dir.normalized() * velocity * t


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += incoming_dir * velocity * delta
	if Input.is_action_just_pressed(action):
		if (position - aim_pos).length() < TOLERANCE:
			$AnimatedSprite2D.set_frame(1)
			$"../".hit_sounds()
			$"../".aumentar_acertos()
			queue_free()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.x -= velocity * delta
		position.y -= velocity * delta
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
