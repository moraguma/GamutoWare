extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const GRAVITY = 400.0
const WALK_SPEED = 350
const JUMP = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("cima"):
		velocity.y -= JUMP
		_animated_sprite.play("default")
	else:
		_animated_sprite.stop()
		
	velocity.x = WALK_SPEED*Input.get_axis("esquerda","direita")

	move_and_slide()
	
