extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const GRAVITY = 600.0
const WALK_SPEED = 500
const JUMP = 30


var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if not done:
		velocity.y += delta * GRAVITY
		if Input.is_action_pressed("cima") or Input.is_action_pressed("acao"):
			velocity.y -= JUMP
			_animated_sprite.play("default")
		else:
			_animated_sprite.stop()
			
		velocity.x = WALK_SPEED*Input.get_axis("esquerda","direita")
		
		move_and_slide()
	
