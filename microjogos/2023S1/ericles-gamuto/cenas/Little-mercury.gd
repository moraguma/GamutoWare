extends Sprite2D

var speed = 10
var angular_speed_self = PI
var angular_speed_external = PI/2
var initial_angle = (3./5.)*PI #(4/5)*PI
var radius
var t = 0

var sun

func _ready():
	sun = $"../Little-sun"
	radius = position.distance_to(sun.position) # (position - sun.position).
	radius=6

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _process(delta):
	rotation -= angular_speed_self * delta

	t += delta
	position.x += radius * cos(initial_angle + angular_speed_external*t)
	position.y += radius * sin(initial_angle + angular_speed_external*t)
	
	#sun.position
