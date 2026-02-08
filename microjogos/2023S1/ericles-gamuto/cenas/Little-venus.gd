extends Sprite2D

var angular_speed_self = PI
var angular_speed_external = 0.01
var initial_angle = PI/8
var initial_direction = Vector2.from_angle(initial_angle)

var t = 0

var radius = 350.
var sun
var relative_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	sun = $"../Little-sun"
	relative_pos = radius * initial_direction
	position = sun.position + relative_pos

func _process(delta):
	t += delta
	
	var updated_direction = initial_direction.rotated(angular_speed_external*t)
	print(radius*updated_direction)
	radius*updated_direction
	#relative_pos.x += radius * cos(angular_speed_external*t)
	#print(relative_pos.x)
	relative_pos.y -= radius * sin(angular_speed_external*t)
	
	position = sun.position + radius*updated_direction
	
	#position.x = sun.position + relative_pos #radius * cos(initial_angle + angular_speed_external*t)
	#position.y = sun.position +  #radius * sin(initial_angle + angular_speed_external*t)
