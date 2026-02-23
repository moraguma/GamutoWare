extends Sprite2D

const DROP_SPEED = 800
const DROP_SPREAD = PI/6

const SPIN_VEL_MIN = 0.3
const SPIN_VEL_MAX = 0.8

const GRAVITY = Vector2(0, 2100)


var dropping = false

var velocity = Vector2(0, 0)
var spin_vel = 0


func _process(delta):
	if dropping:
		velocity += GRAVITY * delta
		position += velocity * delta
		
		rotation += spin_vel * delta


func drop():
	dropping = true
	
	velocity = Vector2(0, -1).rotated(randf_range(-DROP_SPREAD, DROP_SPREAD)) * DROP_SPEED
	spin_vel = randf_range(SPIN_VEL_MIN, SPIN_VEL_MAX)
