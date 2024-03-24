extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var c=0
var lider=self
# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):

	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func coletar(body):
	c=c+1
	return c
