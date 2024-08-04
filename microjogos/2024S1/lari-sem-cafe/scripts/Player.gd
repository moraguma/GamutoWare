extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

@onready var animPlayer = $"AnimatedSprite2D" as AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping := false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animPlayer.play("fall")
		

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif is_on_floor():
		is_jumping = false		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED

		if !is_jumping:		
			animPlayer.play("run")
		elif is_jumping:
			animPlayer.play("jump")			
			
		if direction > 0:
			animPlayer.flip_h = false
		else:
			animPlayer.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animPlayer.play("idle")
		

	move_and_slide()


func _on_cafe_body_entered(body):
	print('entrou')
