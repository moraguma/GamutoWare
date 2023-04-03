extends Sprite2D

var speed = 800
var angular_speed_self = PI
var angular_speed_external = PI/4
var initial_angle = (3./5.)*PI #(4/5)*PI
var radius = 12
var t = 0

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

#func _process(delta):
#	rotation -= angular_speed_self * delta
#	var velocity = Vector2.UP.rotated(rotation) * speed
#	t += delta
#	position.x += radius * cos(initial_angle + angular_speed_external*t)
#	position.y += radius * sin(initial_angle + angular_speed_external*t)
