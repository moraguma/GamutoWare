extends CharacterBody2D


@onready var wall_detector := $"Detector" as RayCast2D
@onready var texture := $Texture as AnimatedSprite2D
const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var direction := 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	texture.play("run")

func change_direction():
	direction *= -1
	wall_detector.scale.x  *= -1
		
	if direction == -1:
		texture.flip_h = true
	else:
		texture.flip_h = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if wall_detector.is_colliding():
		change_direction()

	velocity.x = direction * SPEED * delta
	move_and_slide()


func _on_hurtbox_body_entered(body):
	if body == get_parent().get_node("Player"):
		body.velocity.y = JUMP_VELOCITY
		self.queue_free()
