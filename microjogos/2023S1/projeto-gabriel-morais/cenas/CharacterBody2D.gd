extends CharacterBody2D
var foi_jogado = 0

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	position = Vector2(540, 800)

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept"):
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if foi_jogado == 0:
		var direction_y
		var direction_x
		if Input.is_action_pressed("baixo"):
			direction_y = 1
		elif Input.is_action_pressed("cima"):
			direction_y = -1
		else:
			direction_y = 0
		if Input.is_action_pressed("esquerda"):
			direction_x = -1
		elif Input.is_action_pressed("direita"):
			direction_x = 1
		else:
			direction_x = 0
		var direction = Vector2(direction_x, direction_y).normalized()
		velocity = direction * SPEED
	else:
		velocity.y += gravity * delta
	if Input.is_action_pressed("acao") and foi_jogado==0:
		velocity = 10*(get_node("../pivo").position-position)
		get_node("tiro").play()
		#som_jogar.play()
		foi_jogado = 1
	if position.x > 2000 or position.x < -300 or position.y < 0 or position.y > 2000:
		position = Vector2(540, 800)
		foi_jogado = 0
		
		
	move_and_slide()


func _on_maca_1_body_entered(body):
	pass
