extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _process(delta):
	var velocity = Vector2(-1,0)
	velocity = velocity.normalized() * SPEED
	position += velocity * delta
