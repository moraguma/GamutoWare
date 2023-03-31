extends CharacterBody2D

@onready var caverna = get_node("../Caverna")
@onready var player = get_node("../Player")

var vel_mul = 1.1

func _ready():
	velocity = Vector2.ZERO
	
func _process(delta):
	velocity.x = player.BG_VEL*vel_mul
	var target_vel = clamp((caverna.get_path_y(position.x)-position.y)/delta,
							-player.VEL*vel_mul, player.VEL*vel_mul)
	velocity.y = target_vel + (velocity.y-target_vel)*exp(-10*delta)
	
	rotation = atan2(velocity.y, velocity.x)

	#position.x += velocity.x*delta
	#position.y = caverna.get_path_y(position.x)
	position += velocity*delta
