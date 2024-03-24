extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = 900
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -900
	else:
		velocity.x = 0
	# Add the gravity.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()



func _on_area_2d_body_entered(body):
	body.velocity.y=0
	body.freeze= true
	body.reparent(self)

