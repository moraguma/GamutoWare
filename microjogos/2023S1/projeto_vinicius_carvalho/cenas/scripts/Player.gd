extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 30;


func _physics_process(delta):
	$AnimationPlayer.play("Fly")
	velocity.x = move_toward(velocity.x, 300, SPEED)
	velocity.y += gravity;
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_select"):
		velocity.y = JUMP_VELOCITY*2
	move_and_slide()
