extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel = 200
var pos = -32
func _ready():
	while pos != 1020:
		pos = pos + vel
	# Called every time the node is added to the scene.
	# Initialization here
	pass
