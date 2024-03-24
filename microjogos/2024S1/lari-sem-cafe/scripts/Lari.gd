extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canWalk = true

func setTimer(do):
	#Code for firing  
	canWalk = false  
	var timer:SceneTreeTimer = get_tree().create_timer(5)  
	timer.timeout.connect(set.bind("canWalk", true))  
	do
	
func walk(x, jump):
	if not is_on_floor():
		velocity.y += gravity
	if jump:
		velocity.y = JUMP_VELOCITY
		velocity.x += x		
		
	elif canWalk:
		velocity.x += x
		

func _physics_process(delta):
	
	#if not is_on_floor():
		#velocity.y += gravity
		
	#setTimer(walk(10, false))
	#
	#setTimer(walk(0, true))
	#
	#setTimer(walk(0, false))

	
	
	#velocity.y += gravity
	#velocity.y = JUMP_VELOCITY
	#velocity.x -= SPEED
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



