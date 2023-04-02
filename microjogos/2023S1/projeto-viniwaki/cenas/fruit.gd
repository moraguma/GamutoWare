extends RigidBody2D

var directions = ['u','d','r','l']
var dir_prop = {
	'u': { 'rot': 0 },
	'd': { 'rot': 180 },
	'r': { 'rot': 90 },
	'l': { 'rot': 270 },
}


# Called when the node enters the scene tree for the first time.
func _ready():
	var x = 400 - randf() * 800
	var y = 1600 + randf() * 300
	var d = directions.pick_random()
	
	set_axis_velocity(Vector2(x, -y))
	angular_velocity = 3 - randf() * 6
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
